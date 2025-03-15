import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahara_homepage/postscreen.dart';

class donateitemscreen extends StatefulWidget {
  final File image;
  final String name;
  final String location;
  final String description;
  final bool isNewPost;
  donateitemscreen({
    required this.image,
    required this.name,
    required this.location,
    required this.description, required this.isNewPost,
  });

  @override
  State<donateitemscreen> createState() => _donateitemscreenState();

}


class _donateitemscreenState extends State<donateitemscreen> {
  
  @override
  void initState() {
    super.initState();

    // Ensure that the dialog only shows when all required data is provided
    if (widget.isNewPost && widget.name.isNotEmpty && widget.location.isNotEmpty && widget.image != null) {
      Future.delayed(Duration.zero, () {
        showThankYouDialog(context);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Items '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(widget.image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: ${widget.name}"),
            Text("Location: ${widget.location}"),
            Text("Description: ${widget.description}"),
          ],
        ),
      ),
    );
  }
}

class donatemoneyscreen extends StatefulWidget {
  final File image;          //stateless widget ma data dosry page/class se a raha hota ha and us ko name location etc
                                  //ye chezain chaye jo k dosri class provide kr rai ha is lye final or required lekhy
  final String name;
  final String location;
  final String description;
  final bool isNewPost;
  donatemoneyscreen({
    required this.image,
    required this.name,
    required this.location,
    required this.description, required this.isNewPost,
  });

  @override
  State<donatemoneyscreen> createState() => _donatemoneyscreenState();
}

class _donatemoneyscreenState extends State<donatemoneyscreen> {

  @override
  void initState() {
    super.initState();

    // Ensure that the dialog only shows when all required data is provided
    if (widget.isNewPost && widget.name.isNotEmpty && widget.location.isNotEmpty && widget.image != null) {
      Future.delayed(Duration.zero, () {
        showThankYouDialog(context);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate money '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(widget.image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: ${widget.name}"),
            Text("Location: ${widget.location}"),
            Text("Description: ${widget.description}"),
          ],
        ),
      ),
    );
  }
}

class donatestationaryscreen extends StatefulWidget {
   final File image;
  final String name;
  final String location;
  final String description;
  final bool isNewPost;
   donatestationaryscreen({
    required this.image,
    required this.name,
    required this.location,
    required this.description,
     required this.isNewPost,

  });

  @override
  State<donatestationaryscreen> createState() => _donatestationaryscreenState();
}

class _donatestationaryscreenState extends State<donatestationaryscreen> {
  @override
  void initState() {
    super.initState();

    // Ensure that the dialog only shows when all required data is provided
    if (widget.isNewPost && widget.name.isNotEmpty && widget.location.isNotEmpty && widget.image != null) {
      Future.delayed(Duration.zero, () {
        showThankYouDialog(context);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate Stationary '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(widget.image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: ${widget.name}"),
            Text("Location: ${widget.location}"),
            Text("Description: ${widget.description}"),
          ],
        ),
      ),
    );
  }
}

class donateclothscreen extends StatefulWidget {
  final File image;
  final String name;
  final String location;
  final String description;
  final bool isNewPost;
  donateclothscreen({
    required this.image,
    required this.name,
    required this.location,
    required this.description,
    required this.isNewPost,
  });

  @override
  State<donateclothscreen> createState() => _donateclothscreenState();
}

class _donateclothscreenState extends State<donateclothscreen> {
  @override
  void initState() {
    super.initState();

    // Ensure that the dialog only shows when all required data is provided
    if (widget.isNewPost && widget.name.isNotEmpty && widget.location.isNotEmpty && widget.image != null) {
      Future.delayed(Duration.zero, () {
        showThankYouDialog(context);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate clothes '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(widget.image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: ${widget.name}"),
            Text("Location: ${widget.location}"),
            Text("Description: ${widget.description}"),
          ],
        ),
      ),
    );
  }
}

class donatemedicalitems extends StatefulWidget {
  final File image;
  final String name;
  final String location;
  final String description;
  final bool isNewPost;
  donatemedicalitems({
    required this.image,
    required this.name,
    required this.location,
    required this.description, required this.isNewPost,
  });

  @override
  State<donatemedicalitems> createState() => _donatemedicalitemsState();
}

class _donatemedicalitemsState extends State<donatemedicalitems> {
  @override
  void initState() {
    super.initState();

    // Ensure that the dialog only shows when all required data is provided
    if (widget.isNewPost && widget.name.isNotEmpty && widget.location.isNotEmpty && widget.image != null) {
      Future.delayed(Duration.zero, () {
        showThankYouDialog(context);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate medical items '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(widget.image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: ${widget.name}"),
            Text("Location: ${widget.location}"),
            Text("Description: ${widget.description}"),
          ],
        ),
      ),
    );
  }
}

class otherdonation extends StatefulWidget {
  final File image;          //  final ensures the variables cannot change once set
  final String name;
  final String location;
  final String description;
  final bool isNewPost;
  otherdonation({
    required this.image,        ///required this.image forces the caller to pass data, preventing missing values
    required this.name,
    required this.location,
    required this.description,
    required this.isNewPost,
  });

  @override
  State<otherdonation> createState() => _otherdonationState();
}

class _otherdonationState extends State<otherdonation> {
  @override
  void initState() {
    super.initState();

    // Ensure that the dialog only shows when all required data is provided
    if (widget.isNewPost && widget.name.isNotEmpty && widget.location.isNotEmpty && widget.image != null) {
      Future.delayed(Duration.zero, () {
        showThankYouDialog(context);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('other screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(widget.image, height: 150, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text("Name: ${widget.name}"),
            Text("Location: ${widget.location}"),
            Text("Description: ${widget.description}"),
          ],
        ),
      ),
    );
  }
}
