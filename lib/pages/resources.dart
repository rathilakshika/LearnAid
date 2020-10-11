import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Resources extends StatefulWidget {
  @override
  ResourcesState createState() => new ResourcesState();
}

class ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc2afe1),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: AssetImage('assets/images/stu.png'),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Text(
                  'Breaking the barriers in Classroom',
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
                  child: ListTile(
                    leading: Image.asset("assets/images/math.png"),
                    title: Text('Visualize Mathematics'),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    trailing: RaisedButton(
                        child: Text('Go'),
                        color: Colors.pink[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {}),
                  ),
                  color: Colors.blue[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/audiobook.png"),
                    title: Text('Audiobook Collection'),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    trailing: RaisedButton(
                        child: Text('Go'),
                        color: Colors.pink[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {}),
                  ),
                  color: Colors.blue[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/opportunity.png"),
                    title: Text('Upcoming Opportunities'),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    trailing: RaisedButton(
                        child: Text('Go'),
                        color: Colors.pink[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {}),
                  ),
                  color: Colors.blue[100],
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
          // add form here
        ],
      ),
    );
  }
}
