import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:pdf_text/pdf_text.dart';

class TextToSpeech extends StatefulWidget {
  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

enum TtsState { playing, stopped, paused, continued }

class _TextToSpeechState extends State<TextToSpeech> {
  final FlutterTts flutterTts = FlutterTts();
  PDFDoc _pdfDoc;
  String _text = "";

  bool _buttonsEnabled = true;
  TtsState ttsState = TtsState.stopped;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc2afe1),
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.light,
        backgroundColor: Color(0xff87dcb2),
        title: Text('PDF to Audio'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            FlatButton(
              child: Text(
                "Choose PDF",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent,
              onPressed: _pickPDFText,
              padding: EdgeInsets.all(5),
            ),
            FlatButton(
              child: Text(
                "Read Aloud",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent,
              onPressed: _buttonsEnabled ? _readAloud : () {},
              padding: EdgeInsets.all(5),
            ),
            FlatButton(
              child: Text(
                "Stop",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent,
              onPressed: _buttonsEnabled ? _stop : () {},
              padding: EdgeInsets.all(5),
            ),
            Padding(
              child: Text(
                _pdfDoc == null
                    ? "Pick a new PDF document and wait for it to load..."
                    : "PDF document loaded, ${_pdfDoc.length} pages\n",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.all(15),
            ),
            Padding(
              child: Text(
                _text == "" ? "" : "Text:",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.all(15),
            ),
            Text(_text),
          ],
        ),
      ),
    );
  }

  /// Picks a new PDF document from the device
  Future _pickPDFText() async {
    File file = await FilePicker.getFile();
    _pdfDoc = await PDFDoc.fromFile(file);
    setState(() {});
  }

  /// Reads the whole document

  Future _readAloud() async {
    if (_pdfDoc == null) {
      return;
    }
    setState(() {
      _buttonsEnabled = false;
    });

    String text = await _pdfDoc.text;
    var result = await flutterTts.speak(text);
    if (result == 1) setState(() => ttsState = TtsState.playing);
    setState(() {
      _text = text;
      _buttonsEnabled = true;
    });
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }
}
