import 'dart:io';
import 'package:flutter/material.dart';

class DonateFoodScreen extends StatelessWidget {
  const DonateFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final image = File('path_to_image'); // Example of hardcoded image
    final name = "Item Name";
    final location = "Item Location";
    final description = "Item Description";
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: $name"),
            Text("Location: $location"),
            Text("Description: $description"),
          ],
        ),
      ),
    );
  }
}

class DonateItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can fetch this data from a service or other provider
    final image = File('path_to_image'); // Example of hardcoded image
    final name = "Item Name";
    final location = "Item Location";
    final description = "Item Description";

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: $name"),
            Text("Location: $location"),
            Text("Description: $description"),
          ],
        ),
      ),
    );
  }
}

class DonateMoneyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can fetch this data from a service or other provider
    final image = File('path_to_image'); // Example of hardcoded image
    final name = "Money Donation";
    final location = "Donation Location";
    final description = "Monetary donations for charity";

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: $name"),
            Text("Location: $location"),
            Text("Description: $description"),
          ],
        ),
      ),
    );
  }
}

class DonateStationaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can fetch this data from a service or other provider
    final image = File('path_to_image'); // Example of hardcoded image
    final name = "Stationary Item";
    final location = "Stationary Location";
    final description = "Description of the stationary item";

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Stationary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: $name"),
            Text("Location: $location"),
            Text("Description: $description"),
          ],
        ),
      ),
    );
  }
}

class DonateClothScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can fetch this data from a service or other provider
    final image = File('path_to_image'); // Example of hardcoded image
    final name = "Clothing Item";
    final location = "Clothing Donation Location";
    final description = "Description of the clothing item";

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Clothes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: $name"),
            Text("Location: $location"),
            Text("Description: $description"),
          ],
        ),
      ),
    );
  }
}

class DonateMedicalItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can fetch this data from a service or other provider
    final image = File('path_to_image'); // Example of hardcoded image
    final name = "Medical Item";
    final location = "Medical Donation Location";
    final description = "Description of the medical item";

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Medical Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: $name"),
            Text("Location: $location"),
            Text("Description: $description"),
          ],
        ),
      ),
    );
  }
}

class OtherDonationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can fetch this data from a service or other provider
    final image = File('path_to_image'); // Example of hardcoded image
    final name = "Other Donation Item";
    final location = "Other Donation Location";
    final description = "Description of other donation";

    return Scaffold(
      appBar: AppBar(
        title: Text('Other Donations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: $name"),
            Text("Location: $location"),
            Text("Description: $description"),
          ],
        ),
      ),
    );
  }
}
