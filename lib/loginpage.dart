import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sahara_homepage/Homescreen.dart';
import 'package:sahara_homepage/main.dart';
import 'package:sahara_homepage/signup%20screen.dart';
import 'functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void saveFcmToken() async {
  final user = FirebaseAuth.instance.currentUser;
  await FirebaseMessaging.instance.requestPermission(); //  request permission
  if (user != null) {
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
        'fcmToken': token,
      }, SetOptions(merge: true)); // merge keeps other fields intact
      print(" FCM token saved: $token");
    }
  }
}
class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      functions.Dialogboxx(context, "Enter required fields");
      return;
    }
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      saveFcmToken(); // Save token after login
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } on FirebaseAuthException catch (ex) {
      functions.Dialogboxx(context, ex.code.toString());
    }
  }

  // Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // User canceled login

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } catch (e) {
      functions.Dialogboxx(context, "Google Sign-In failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35),
            // Image.network('https://images.app.goo.gl/NPsnRe7cXp1egyHx8'),
            Image.asset(
              'assets/images/iStock-1055191292-1620x1080.jpg',
              fit: BoxFit.fill,
              height: 320,
              width: double.infinity,
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5,),
                  SizedBox(
                    //height: 5,
                    child: Container(
                      //   height: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon:
                              const Icon(Icons.email, color: Colors.orange),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon:
                              const Icon(Icons.lock, color: Colors.orange),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {

                                login(emailController.text,
                                    passwordController.text);

                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => signuppage()));
                                },
                                child: const Text("Sign up",
                                    style: TextStyle(color: Colors.orange)),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: signInWithGoogle,
                              icon: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.orangeAccent,
                              ),
                              label: const Text("Sign in with Google",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//its an fcm code ..>"private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCO2budQ7KJxKVV\nfw+I/bPX4xeEsEex7utXBYiwovCT5a0wHAEuBwK7FR5zxRwnyJvQ/TffUNU3Ffw7\nj2U5X+/GKhaEtO8Ig3p34M5pK7N7Dcw/PttCaFmovlBrKNeJfKMIl7cxUSUuDK+0\n6354PP3MiouClq+ZinfI/gCsGs/IzEnEsbasf4DeHCLmNb/Up9+8fjVTONv76Dfh\no065swP9fvBBbbE/X8U/jMysnL+c2JU2NtjCjbwl5vRxPIC/h6PTI7iG46d8Sb6h\nOCN9HsNcRq16PPrKIYn4q9Xh3xXDt4zY5c01JU3TyASfjlawKtIGkNzddtVG1Hf9\nuWu3VNLDAgMBAAECggEAAfBvZ+ghBqvBDtMQaUIAbKrW3o9CDzv4vTqvAK7a6Ixn\n+HeOMItvJw5XVnz+L9q8+sOlPDEtuSIMRYa3JLs/rFyqkkHz3hVi1o5vtDp1T54A\nACUgoYXRycT49IDJGZhejOGlCVSvq4YH5e3YeVYNSqHgLkqmDEXhRbzk/MZ0Zvu8\ncYoeasQuB0gl3gq6qQobYDsefsEsYCb9AeUsDGeVeQ71t+oBzTMwBGE+2XjNyGeZ\n/3Yz0YkmB1I6Jh6oGwLaFnDrzDdbGZ9IvgKpguImtPIHGi1o2+n3mDg7eDriOov/\n/pJsnrrJ4nB1ET5gLqBrxvRajWTLRjo6JWn875sTaQKBgQDFBsrIkxgpV5pr/BrZ\neRfl85MXp/I6nUy2pcmjcEQzwt2nav3vqhrK9RgI11Gkg5cDuNUKcUy3Ykw6vx+c\n5mZeebshTVwaYOUxhZLEaX5uGFXBEcY4qkSOaHE2e9IAXdOecdYYlhK72kjG5KYK\nznrD56zA2h9yptPcCPMUl7jmxQKBgQC5m7CncS/dlESSsxHHD0e6MPDakGs7mtV8\n83pYP9nkFzVY5FPUnF7QBTmdWzIwtzcX8iZy/BcJbLoM8m68z1vY4Tkjs8c+jtxv\n9e42oorer3GIgBqSjYuYbacxcRNgwpNNSnQrm+K5I4F+RZIKj+O70AKoH4lz+slZ\nlu4kBWur5wKBgAZ2sJRf7vz8OL6uKJtV06jhksPF6LZvjqK3UaQg/LvN+sORSP9h\nzzs1SzKPDcid4IhoueR7zw59FQ8gUgMts9IJoE/5X7olz58OSMBUzacC+V06Hgyh\n2VnqpzwoV71XVqfuCB4KXlb3VEfiHGhiWbivkwVIopt6SZ0AVikoyRIZAoGAElRV\ntbNvzqn9u58Demz/4FtE7dClRlWcD6LbyitEEUpZclXaEXz/v/tEHU4MPtNZFXxM\nX76VZ9Dc7rpiRTMVFu3m/qeaXYsuKcBXrf2PST56L8i21xIzXvI1OKS6DSwp79AS\neNwEH9RpzVaBfZmIG9wG5yN2J4X0rGxDSDtgzrECgYEApU0GY/V73PoyG1SWiyk0\nlHWwyZIMqMlueECGDeIZ0Pde8gH0FpVII2ypNvq8pctF0t5vy72y+O/P9bZ1DOZa\nGDe34RPj9bj62yliDYWyNajQiQL8Ou0agK7lp9lwkLa8TVUpEezXYZ73IKwL2cTf\ncn7rYHmqRAuniUiV12tboZc=\n-----END PRIVATE KEY-----\n",

