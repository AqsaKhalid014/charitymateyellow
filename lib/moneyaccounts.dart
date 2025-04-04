
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: ElevatedButton(
          onPressed: _launchJazzCash,
          child: Text("Open JazzCash App"),
        ),
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
      body: Center(
        child: ElevatedButton(
          onPressed: _launchEasyPaisa,
          child: Text("Open EasyPaisa App"),
        ),
      ),
    );
  }
}
