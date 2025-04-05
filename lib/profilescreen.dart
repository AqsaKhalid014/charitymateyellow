import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahara_homepage/privacy%20screen.dart';
import 'package:sahara_homepage/terms%20and%20condition%20screen.dart';
import 'about us screen.dart';
import 'feedback & rating.dart';
import 'loginpage.dart';
import 'main.dart';
import 'most asked question screen.dart'; // <-- Make sure this is your actual login screen path

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfileState();
}

class _ProfileState extends State<Profilescreen> {
  String userName = "Loading...";
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      userName = user?.displayName ?? "Unknown User";
      _nameController.text = userName;
    });
  }

  Future<void> _updateUsername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.updateDisplayName(_nameController.text);
      await user.reload();
      setState(() {
        userName = _nameController.text;
      });
    }
  }

  // Method to show the logout confirmation dialog
  Future<void> _showLogoutDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout Confirmation'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog if No is clicked
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the dialog first
              await FirebaseAuth.instance.signOut(); // Sign out the user
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => loginPage()), // Navigate to login screen
              );
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/logo zoom.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'CHARITY MATE',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            SizedBox(height: 3),
                            Text(
                              userName,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent.shade100),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Edit Name"),
                                    content: TextField(controller: _nameController),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _updateUsername();
                                          Navigator.pop(context);
                                        },
                                        child: Text("Save"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text('Edit Name'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage())),
                  child: ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home_sharp, color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen())),
                      child: ListTile(
                        title: Text('About Us'),
                        leading: Icon(Icons.read_more_outlined),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionsScreen())),
                      child: ListTile(
                        title: Text('Terms and Conditions'),
                        leading: Icon(Icons.terminal_sharp),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyScreen())),
                      child: ListTile(
                        title: Text('Privacy Policy'),
                        leading: Icon(Icons.privacy_tip_outlined),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen())),
                      child: ListTile(
                        title: Text('FAQ'),
                        leading: Icon(Icons.question_mark),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen())),
                      child: ListTile(
                        title: Text('Rating & Feedback'),
                        leading: Icon(Icons.feedback_outlined),
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
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () => _showLogoutDialog(context), // Show dialog on Logout button click
                  child: ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
