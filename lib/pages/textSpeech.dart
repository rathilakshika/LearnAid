import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSpeech extends StatelessWidget {
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    speak() async {
      await flutterTts.speak("Hello, I am Akanksha ");
    }

    Scaffold(
      backgroundColor: Color(0xff9ad7e9),
      body: Container(
        child: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: new Container(
              child: new Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Image(
                      image: AssetImage('assets/icons/talk.png'),
                      height: 150,
                      width: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Text(
                            'We will answer all your queries',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text(
                                    'What type of breast cancer do I have?',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Color(0xFF20124d),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  // Text('Nipple discharge')
                                ],
                              ),
                            ),
                            color: Color(0xff9ad7e9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                          child: Text("press"), onPressed: () => speak()),
                    ),
                    // add form here
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
