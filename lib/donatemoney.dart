import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'moneyaccounts.dart';

class MoneyDonationPage extends StatelessWidget {
  final List<String> imagePath = [
   ' assets/images/WhatsApp Image 2025-04-04 at 3.59.40 PM.jpeg',
    'assets/images/WhatsApp Image 2025-04-04 at 4.00.36 PM.jpeg',
    'assets/images/WhatsApp Image 2025-04-04 at 4.02.45 PM.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
            ),
            items: imagePath.map((Path) {
              return Image.network(
                Path,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            }).toList(),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Donate Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DonationPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Make a Donation To Live Better")),
      body:Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => JazzCashPage()),
    );
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    ),
    child: Text("Donate via JazzCash", style: TextStyle(fontSize: 18)),
    ),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => EasyPaisaPage()),
    );
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    ),
    child: Text("Donate via EasyPaisa", style: TextStyle(fontSize: 18)),
    ),
    ],
    ),
    ),
    );
  }
}

