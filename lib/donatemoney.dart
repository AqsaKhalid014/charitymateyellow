
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'moneyaccount.dart';
//import 'money account.dart';

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
                  backgroundColor: Colors.orangeAccent ,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
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
      //appBar: AppBar(title: Text("Make a Donation To Live Better")),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child:
             Container(color: Colors.orange[300],
               child: Center(

                           child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child:Card(
                      elevation:15,
                    color:Colors.deepOrange[10],
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => JazzCashPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text("Donate via JazzCash", style: TextStyle(fontSize: 18,color: Colors.white),),
                    ),
                  ),),
                  SizedBox(height: 20),
                  Center(
                    child: Card(
                      elevation:15,
                    color: Colors.green[10],
                    child:ElevatedButton(
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
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text("Donate via EasyPaisa", style: TextStyle(fontSize: 18,color: Colors.white),
                       ),
                    ),
                  ),),
                ],

                       ),
                         ),
             ),
        ),
      );
  }
}
