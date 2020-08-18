import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sudoku/capture.dart';
import 'package:sudoku/constants.dart';
import 'package:sudoku/save.dart';
import 'package:sudoku/settings.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  Color iconAlt = Colors.white;

  Color iconColor = Color(0xFF46A1DD);

  bool iconStatus1 = false;

  bool iconStatus2 = true;

  bool iconStatus3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF46A1DD),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60,
        color: Colors.white,
        backgroundColor: Color(0xFFF6F6F6),
        buttonBackgroundColor: Color(0xFF46A1DD),
        animationDuration: Duration(milliseconds: 250),
        items: <Widget>[
          Icon(
            Icons.dashboard,
            color: navState.iconStatus1 ? navState.iconAlt : navState.iconColor,
            size: 30,
            semanticLabel: 'Dashboard',
          ),
          Icon(
            Icons.camera_alt,
            color: navState.iconStatus2 ? navState.iconAlt : navState.iconColor,
            size: 30,
            semanticLabel: 'Camera',

          ),
          Icon(
            Icons.settings,
            color: navState.iconStatus3 ? navState.iconAlt : navState.iconColor,
            size: 30,
            semanticLabel: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              navState.iconStatus1 = true;
             navState.iconStatus2 = false;
             navState.iconStatus3 = false;

            }
            else if (index == 1) {
             navState.iconStatus2 = true;
             navState.iconStatus1 = false;
             navState.iconStatus3 = false;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CapturePage();
              }));
            }
            else {
             navState.iconStatus3 = true;
             navState.iconStatus2 = false;
             navState.iconStatus1 = false;

             index = 2;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingsPage();
              }));


            }
          });


        },
      ),

      body: SafeArea(

        child: Stack(
                  children: <Widget>[

                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 500,
                      width: 375,
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)
                          )
                      ),
                    ),
                ),
                    Positioned(
                      top: 15.0,
                          left: 135.0,
                          child: Text(
                            'Dashboard',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        ),
                    ),
                    Positioned(
                      top: 50.0,
                      left: 50.0,
                      right: 50.0,
                      child: SizedBox(
                        height: 100,
                        width: 40,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                          ),
                          elevation: 10.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'scans',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0
                                    ),
                                  ),
                                ],
                              ),


                            ],

                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
//                    Positioned(
//                      top: 100,
//                        child: Text('All')
//                    ),

                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 420,
                        width: 380,
                        color: Color(0xFFF3F3F3),
                        child: ListView.builder(
                          itemCount: itemms.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Sudocards(itemms[index]);
                          },

                        ),
                      ),
                    )

              ],

        ),
      ),
    );
  }
}
List <String> itemms = ['1', '2', '3', '4', '5', '6', '7', '8', '8'];


class Sudocards extends StatelessWidget {
  Sudocards(this.texts);
  String texts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 7.0, 5.0, 7.0),
      child: Container(
        height: 80,
        width: 360,
        child: Card(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        topLeft: Radius.circular(8),
        ),
        ),
        elevation: 5.0,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        '27 Aug. 2020',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 12,
                          ),
                          Text(
                              ' Surulere, Lagos',
                          style: TextStyle(
                            fontSize: 10
                          ),
                          )
                        ],
                      )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 10.0, 10.0),
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '6:05 pm',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                        fontSize: 10
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
