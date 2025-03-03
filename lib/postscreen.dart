import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:sahara_homepage/Donationscreens.dart';
import 'dart:convert';
import 'dart:io';

//import 'displayscreen.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final String goMapApiKey = "AlzaSyUjbZXOHbS4_68CvZTVxlasskt-su_tgUI"; // Replace with your API key
  List<String> _suggestions = [];

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
            'Location services are disabled. Please enable them.')),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permission denied')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
            'Location permissions are permanently denied. Enable them from settings.')),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      String address = "${place.locality}, ${place.administrativeArea}, ${place
          .country}";
      setState(() {
        _locationController.text = address;
      });
    }
  }

  Future<void> _fetchLocationSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() {
        _suggestions.clear();
      });
      return;
    }

    final url = Uri.parse(
        "https://api.gomap.com/autocomplete?q=$query&key=$goMapApiKey");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> results = (data["suggestions"] as List).map((item) =>
            item["name"].toString()).toList();

        setState(() {
          _suggestions = results;
        });
      } else {
        print("Error fetching suggestions: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick  Image')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _image != null
                ? Image.file(
                _image!, height: 150, width: 150, fit: BoxFit.cover)
                : Text('No image selected'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
              onChanged: _fetchLocationSuggestions,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_suggestions[index]),
                  onTap: () {
                    setState(() {
                      _locationController.text = _suggestions[index];
                      _suggestions.clear();
                    });
                  },
                );
              },
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_image != null &&
                    _nameController.text.isNotEmpty &&
                    _locationController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  _showDonationTypeDialog(); // Show pop-up when submit is pressed
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(
                        'Please fill all fields and select an image')),
                  );
                }
              },
              child: Text('Submit'),
            ),

          ],
        ),
      ),
    );
  }

  void _showDonationTypeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("What type of your donation?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDonationButton("Donate Item", () =>
                  donateitemscreen(
                    image: _image!,
                    name: _nameController.text,
                    location: _locationController.text,
                    description: _descriptionController.text,
                  )),
              _buildDonationButton("Donate Money", () =>
                  donatemoneyscreen(
                    image: _image!,
                    name: _nameController.text,
                    location: _locationController.text,
                    description: _descriptionController.text,
                  )),
              _buildDonationButton("Donate Stationary", () =>
                  donatestationaryscreen(
                    image: _image!,
                    name: _nameController.text,
                    location: _locationController.text,
                    description: _descriptionController.text,
                  )),
              _buildDonationButton("Donate Cloth", () =>
                  donateclothscreen(
                    image: _image!,
                    name: _nameController.text,
                    location: _locationController.text,
                    description: _descriptionController.text,
                  )),
              _buildDonationButton("Donate Medical Items", () =>
                  donatemedicalitems(
                    image: _image!,
                    name: _nameController.text,
                    location: _locationController.text,
                    description: _descriptionController.text,
                  )),
              _buildDonationButton("Other Donation", () =>
                  otherdonation(
                    image: _image!,
                    name: _nameController.text,
                    location: _locationController.text,
                    description: _descriptionController.text,
                  )),
            ],
          ),
        );
      },
    );
  }


  Widget _buildDonationButton(String label, Widget Function() screenBuilder) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context); // Close the dialog
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  screenBuilder(), // Navigate to selected screen
            ),
          );
        },
        child: Text(label),
      ),
    );
  }

}