import 'package:flutter/material.dart';

import './widgets/bottomSheetTile.dart';
import './widgets/alertBox.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = [
    'History',
    'Stats',
    'Contribute',
    'Donate',
    'Report Bug',
    'About',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bgscreen.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logoas.png',
                    height: 60,
                    width: 60,
                  ),
                  Text(
                    'TuneSwitch',
                    style: TextStyle(
                        color: Colors.greenAccent[400],
                        fontSize: 40,
                        backgroundColor: Color.fromRGBO(5, 19, 48, 1)),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  GestureDetector(
                      child: Image.asset(
                        'assets/images/hamburger.png',
                        height: 40,
                        width: 40,
                      ),
                      onTap: () => showModalBottomSheet(
                          //isScrollControlled: true,
                          context: context,
                          builder: (context) => Column(
                                children: <Widget>[
                                  GestureDetector(
                                      child: BottomSheetTile('History'),
                                      onTap: null),
                                  GestureDetector(
                                      child: BottomSheetTile('Stats'),
                                      onTap: null),
                                  GestureDetector(
                                    child: BottomSheetTile('Donate'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertBoxx(
                                              'Donate',
                                              'dialogheart.png',
                                              'If you enjoy the app,\nBuy a Coffee to the developers'));
                                    },
                                  ),
                                  GestureDetector(
                                    child: BottomSheetTile('Contribute'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertBoxx(
                                              'Contribute',
                                              'github.gif',
                                              'Liike to add Features?,\nContribute by visiting https://github.com/anandhakrishnanaji/TuneSwitch'));
                                    },
                                  ),
                                  GestureDetector(
                                    child: BottomSheetTile('Report'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertBoxx(
                                              'Report',
                                              'bug.png',
                                              'Found any interesting bug, Post as an Issue on \nhttps://github.com/anandhakrishnanaji/TuneSwitch/issues'));
                                    },
                                  ),
                                  GestureDetector(
                                    child: BottomSheetTile('About'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertBoxx(
                                              'About',
                                              'aboutus.png',
                                              'anandhakris'));
                                    },
                                  )
                                ],
                              )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
