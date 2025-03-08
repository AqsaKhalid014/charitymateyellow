import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final TextEditingController _controller = TextEditingController();
  String _translatedText = "";

  // Function to translate text
  Future<void> _translate(bool isEnglishToUrdu) async {
    final sourceLang =
    isEnglishToUrdu ? TranslateLanguage.english : TranslateLanguage.urdu;
    final targetLang =
    isEnglishToUrdu ? TranslateLanguage.urdu : TranslateLanguage.english;

    final translator =
    OnDeviceTranslator(sourceLanguage: sourceLang, targetLanguage: targetLang);

    try {
      final result = await translator.translateText(_controller.text);
      setState(() {
        _translatedText = result;
      });
    } catch (e) {
      setState(() {
        _translatedText = "Error: $e";
      });
    } finally {
      translator.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ML Kit Translator")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter text",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _translate(true),
                  child: Text("English to Urdu"),
                ),
                ElevatedButton(
                  onPressed: () => _translate(false),
                  child: Text("Urdu to English"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Translated Text:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _translatedText,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TranslationScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
