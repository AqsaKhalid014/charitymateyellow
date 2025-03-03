import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class donateitemscreen extends StatelessWidget {
  final File image;
  final String name;
  final String location;
  final String description;

  donateitemscreen({
    required this.image,
    required this.name,
    required this.location,
    required this.description,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Items '),
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

class donatemoneyscreen extends StatelessWidget {
  final File image;          //stateless widget ma data dosry page/class se a raha hota ha and us ko name location etc
                                  //ye chezain chaye jo k dosri class provide kr rai ha is lye final or required lekhy
  final String name;
  final String location;
  final String description;

  donatemoneyscreen({
    required this.image,
    required this.name,
    required this.location,
    required this.description,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate money '),
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

class donatestationaryscreen extends StatelessWidget {
   final File image;
  final String name;
  final String location;
  final String description;

   donatestationaryscreen({
    required this.image,
    required this.name,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate Stationary '),
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

class donateclothscreen extends StatelessWidget {
  final File image;
  final String name;
  final String location;
  final String description;

  donateclothscreen({
    required this.image,
    required this.name,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate clothes '),
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

class donatemedicalitems extends StatelessWidget {
  final File image;
  final String name;
  final String location;
  final String description;

  donatemedicalitems({
    required this.image,
    required this.name,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('donate medical items '),
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

class otherdonation extends StatelessWidget {
  final File image;          //  final ensures the variables cannot change once set
  final String name;
  final String location;
  final String description;

  otherdonation({
    required this.image,        ///required this.image forces the caller to pass data, preventing missing values
    required this.name,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('other screen'),
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
