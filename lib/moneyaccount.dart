

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahara_homepage/Homescreen.dart';
import 'package:sahara_homepage/main.dart';
import 'package:url_launcher/url_launcher.dart';

class JazzCashPage extends StatelessWidget {
  Future<void> _launchJazzCash() async {
    const packageName = 'com.techlogix.jazzcash'; // Known JazzCash package
    final uri = Uri.parse('intent://#Intent;package=$packageName;end');

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch JazzCash app';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JazzCash")),
      body: Column(
        children: [

          Container(height: 200,
          width: double.infinity,
          color:Colors.orangeAccent,
          child:Text("send your donation to this account ")),
          SizedBox(height: 20,),
          Center(
            child:

            ElevatedButton(
              onPressed: _launchJazzCash,
              child: Text("Open JazzCash App",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent)
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor:Colors.white,///its a text color
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),//MaterialPageRoute(builder: (_) => MoneyDonationPage()
           onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>MyHomePage()) );
           }, child: const Text("Go to Home",style: TextStyle(fontSize: 15),), ),
        ],
      ),
    );
  }
}

class EasyPaisaPage extends StatelessWidget {
  Future<void> _launchEasyPaisa() async {
    const packageName = 'pk.com.telenor.phoenix'; // Known EasyPaisa package
    final uri = Uri.parse('intent://#Intent;package=$packageName;end');

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch EasyPaisa app';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EasyPaisa")),
      body: Column(
        children: [
          Container(height: 200,
            width:double.infinity,
            color:Colors.orangeAccent,
          child: const Text("send your donation to this account ....")),
          SizedBox(height: 20,),
          Center(
            child: ElevatedButton(
              onPressed: _launchEasyPaisa,
              child: Text("Open EasyPaisa App",style:TextStyle(color: Colors.white),),

              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor:Colors.white,///its a text color
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),//MaterialPageRoute(builder: (_) => MoneyDonationPage()
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MyHomePage()) );
            }, child: const Text("Go to Home",style: TextStyle(fontSize: 15),), ),
        ],
      ),
    );
  }
}
