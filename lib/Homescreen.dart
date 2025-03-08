import 'dart:io';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sahara_homepage/Donationscreens.dart';
import 'package:sahara_homepage/profilemorescreen.dart';
import 'functions.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade100,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/logo image.jpeg'),
                    radius: 30,
                  ),
                  Text(
                    'CHARITY MATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => profilemorescreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter, // Align text at the bottom
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(40), // To match container shape
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnN1YYQEf27aqIgiJSDWhpgQYHV9JJPkRxdA&s',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.orange
                          .withOpacity(0.5), // Semi-transparent background
                      child: Text(
                        'Give a little, help a lot – your donation can change a life! 💙',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 5,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30), bottom: Radius.circular(2))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '      Categories:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Spacer(),
                      functions.container(
                          Icons.fastfood, Colors.orange.shade400, ' Food', () {
                        File? _image;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => donateitemscreen(
                                      image: _image!,
                                      name: "",
                                      location: '',
                                      description: "",
                                    )));
                      }),
                      Spacer(),
                      functions.container(Icons.monetization_on_outlined,
                          Colors.orange.shade400, ' Money', () {
                        File? _image;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => donatemoneyscreen(
                                    image: _image!,
                                    name: '',
                                    location: '',
                                    description: '')));
                      }),
                      Spacer(),
                      functions.container(Icons.cyclone_outlined,
                          Colors.orange.shade400, 'Clothing', () {
                        File? _image;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => donateclothscreen(
                                    image: _image!,
                                    name: '',
                                    location: '',
                                    description: '')));
                      }),
                      Spacer(),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Spacer(),
                      functions.container(Icons.menu_book_rounded,
                          Colors.orange.shade400, ' Education', () {
                        File? _image;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => donatestationaryscreen(
                                    image: _image!,
                                    name: '',
                                    location: '',
                                    description: '')));
                      }),
                      Spacer(),
                      functions.container(Icons.medical_information_outlined,
                          Colors.orange.shade400, 'Medical', () {
                        File? _image;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => donatemedicalitems(
                                    image: _image!,
                                    name: '',
                                    location: '',
                                    description: '')));
                      }),
                      Spacer(),
                      functions.container(
                          Icons.devices_other, Colors.orange.shade400, 'Other',
                          () {
                        File? _image;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => otherdonation(
                                    image: _image!,
                                    name: '',
                                    location: '',
                                    description: '')));
                      }),
                      Spacer(),
                    ]),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.orange.shade50,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Text(
                              'Welcome to Charity Mate',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Start Your Donation Journey',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [

                                functions.colorful_container(
                                  Colors.orange.shade500,
                                  "\nWe make a living by what we get, but we make a life by what we give.",
                                  Colors.black,
                                ),
                                Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                functions.colorful_container(
                                  Colors.pinkAccent.shade200,
                                  "\nThe meaning of life is to find your gift. The purpose of life is to give it away.",
                                  Colors.black,
                                ),
                                Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                functions.colorful_container(
                                  Colors.yellow,
                                  "Charity begins at home, but it should not end there.",
                                  Colors.black,
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '      Start your donation journey:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  child: Image.network(item,
                                      fit: BoxFit.cover, width: 600.0),
                                ),
                              ))
                          .toList(),
                    )
                  ])),
        ])));
  }
}
