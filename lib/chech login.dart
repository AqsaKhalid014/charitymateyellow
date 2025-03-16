import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahara_homepage/loginpage.dart';
import 'package:sahara_homepage/main.dart';

class checkuserloginstatus extends StatelessWidget {
  const checkuserloginstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return  checkuser();
  }
  checkuser(){
    final user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      return MyHomePage();
    }
    else
      {
        return loginPage();
      }
  }
}
