import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahara_homepage/about%20us%20screen.dart';
import 'package:sahara_homepage/main.dart';
import 'package:sahara_homepage/most%20asked%20question%20screen.dart';
import 'package:sahara_homepage/privacy%20screen.dart';
import 'package:sahara_homepage/morescreen.dart';
import 'package:sahara_homepage/terms%20and%20condition%20screen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfileState();
}

class _ProfileState extends State<Profilescreen> {
  String userName = "Loading..."; // Default text before fetching username

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  // Function to get the username from FirebaseAuth
  void _loadUsername() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      userName = user?.displayName ?? "Unknown User";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'CHARITY MATE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    userName.isNotEmpty ? userName : "Guest", // Show name or Guest
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),

                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('Home'),
                        leading: Icon(Icons.home_sharp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUsScreen()));

                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('About Us'),
                        leading: Icon(Icons.read_more_outlined),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditionsScreen()));

                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('Terms and Conditions'),
                        leading: Icon(Icons.terminal_sharp),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyScreen()));

                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('Privacy Policy'),
                        leading: Icon(Icons.privacy_tip_outlined),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FAQScreen()));
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('FAQ'),
                        leading: Icon(Icons.question_mark),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('Logout'),
                        leading: Icon(Icons.logout),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
