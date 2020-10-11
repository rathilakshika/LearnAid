import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_aid/pages/homepage.dart';
import 'package:learn_aid/pages/textToSpeech.dart';
import 'package:learn_aid/pages/friendly.dart';
import 'package:learn_aid/pages/counsellor.dart';
import 'package:learn_aid/pages/speechText.dart';
import 'package:learn_aid/pages/resources.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "PDF to Audio",
      img: "assets/images/audio.png",
      screen: TextToSpeech());

  Items item2 = new Items(
      title: "Friendly Font",
      img: "assets/images/pdf.png",
      screen: FriendlyFont());

  Items item3 = new Items(
      title: "Speech To Text",
      img: "assets/images/mic.png",
      screen: SpeechScreen());
  Items item4 = new Items(
      title: "Counsellor",
      img: "assets/images/counsellor.png",
      screen: CallCounsellor());
  Items item5 = new Items(
      title: "Resources", img: "assets/images/book.png", screen: Resources());
  Items item6 =
      new Items(title: "More", img: "assets/images/more.png", screen: Home());

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
    ];
    //var color = Colors.lightGreen;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 14, right: 14),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: myList.map((data) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 110,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.abel(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => data.screen),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Widget screen;
  Items({this.title, this.img, this.screen});
}
