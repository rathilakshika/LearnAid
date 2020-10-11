import 'package:flutter/material.dart';
import 'package:learn_aid/components/gridDashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  double screenHeight;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffc2afe1),
      // #ffb8c5 #ff6e8d #ff8ba4
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.light,
        backgroundColor: Color(0xff87dcb2),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: new Image.asset('assets/images/menu.png'),
            );
          },
        ),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Color(0xff87dcb2),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/unicorn.png'),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi! ",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xFF20124d),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      child: Text(
                        '''What help do you need? ''',
                        maxLines: 20,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color(0xFF20124d),
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 230,
                      child: RaisedButton(
                        child: Text(
                          'Talk to me',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Color(0xFF20124d),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                        color: Color(0xff87dcb2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GridDashboard(),
        ],
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: MediaQuery.of(context).size.width / 1.7, //20.0,
      child: Drawer(
        child: Container(
          color: Color(0xffc2afe1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                decoration: BoxDecoration(
                    color: Color(0xff87dcb2),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/hands.png'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SliderDialog())),
                  ),
                  ListTile(
                    leading: Icon(Icons.border_color),
                    title: Text('Feedback'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
