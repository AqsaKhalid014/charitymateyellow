import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahara_homepage/profilemorescreen.dart';

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
              height: 166,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    child: Text(
                      'BA',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'CHARITY MATE',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text('amjadbisma68@gmail.com'),
                  SizedBox(height: 15),
                ],
              ),
            ),
            SizedBox(
              height: 25,
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
                        title: Text('Account'),
                        leading: Icon(Icons.account_circle_outlined),
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
                        title: Text('Notification'),
                        leading: Icon(Icons.notifications_none),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('Help & Support'),
                        leading: Icon(Icons.help_outline_rounded),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('Send Feedback'),
                        leading: Icon(Icons.feedback_outlined),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('Terms & Conditions'),
                        leading: Icon(Icons.terminal_sharp),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text('More'),
                        leading: Icon(Icons.more_vert_outlined),
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
