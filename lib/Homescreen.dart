import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sahara_homepage/Donationscreens.dart';
import 'functions.dart';

class Homepage extends StatelessWidget {
  
  const Homepage({super.key
  });

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
          height: 350,
          child: Stack(children: [
            /* Image.asset(
              'assets/images/background image.jpeg',
              fit: BoxFit.fill,
              height: 400,
              width: double.infinity,
            ),*/
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnN1YYQEf27aqIgiJSDWhpgQYHV9JJPkRxdA&s',
              height: 350,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\n\n𝘾𝙝𝙖𝙧𝙞𝙩𝙮𝙈𝙖𝙩𝙚',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ])),
      const SizedBox(
        height: 5,
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30), bottom: Radius.circular(2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              '      Categories:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              const Spacer(),
              functions.container(Icons.fastfood, Colors.orange, ' Food', () {
                File? image; // Declare _image in Homepage class
                File defaultImage = File('assets/images/iStock-1055191292-1620x1080.jpg');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => donateitemscreen(image:image??defaultImage, name:"" , location: '',description: "", isNewPost: true,)));
              }),
              Spacer(),
              functions.container(
                  Icons.monetization_on_outlined, Colors.orange, ' Money', () {
                File? image0;
                File defaultImage = File('assets/images/iStock-1055191292-1620x1080.jpg');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => donatemoneyscreen(image:image0??defaultImage , name: '', location: '', description: '',isNewPost: true)));
              }),
              const Spacer(),
              functions.container(
                  Icons.cyclone_outlined, Colors.orange, 'Clothing', () {
                File? image1;
                File defaultImage = File('assets/images/iStock-1055191292-1620x1080.jpg');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => donateclothscreen(image:image1??defaultImage , name: '', location: '', description: '', isNewPost: true,)));
              }),
              const Spacer(),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              const Spacer(),
              functions.container(
                  Icons.menu_book_rounded, Colors.orange, ' Education', () {
                File? _image;
                File defaultImage = File('assets/images/iStock-1055191292-1620x1080.jpg');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => donatestationaryscreen(image:_image??defaultImage , name: '', location: '', description: '',isNewPost: true)));
              }),
              const Spacer(),
              functions.container(
                  Icons.medical_information_outlined, Colors.orange, 'Medical',
                  () {
                    File? image2;
                    File defaultImage = File('assets/images/iStock-1055191292-1620x1080.jpg');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => donatemedicalitems(image: image2?? defaultImage, name: '', location: '', description: '',isNewPost: true)));
              }),
              const Spacer(),
              functions.container(Icons.devices_other, Colors.orange, 'Other',
                  () {File? image3;
                  File defaultImage = File('assets/images/iStock-1055191292-1620x1080.jpg'); // Use an default image path

                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => otherdonation(image:image3?? defaultImage, name: '', location: '', description: '',isNewPost: true)));
              }),
              const Spacer(),
            ]),
            const SizedBox(
              height: 12,
            ),
            const Text(
              '      Start your donation journey:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 200, autoPlay: true, enlargeCenterPage: true),
              items: [
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnN1YYQEf27aqIgiJSDWhpgQYHV9JJPkRxdA&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnN1YYQEf27aqIgiJSDWhpgQYHV9JJPkRxdA&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnN1YYQEf27aqIgiJSDWhpgQYHV9JJPkRxdA&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnN1YYQEf27aqIgiJSDWhpgQYHV9JJPkRxdA&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnN1YYQEf27aqIgiJSDWhpgQYHV9JJPkRxdA&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnN1YYQEf27aqIgiJSDWhpgQYHV9JJPkRxdA&s',
              ]
                  .map((item) => Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 600.0),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      )
    ])));
  }
}
