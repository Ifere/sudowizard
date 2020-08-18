import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sudoku/constants.dart';
import 'package:sudoku/dashboard.dart';
import 'capture.dart';
int page = 0;


List <String> itemms =  ['this', 'is', 'the', 'remix'];
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
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

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Dashboard();
              }));

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

            }
          });


        },
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
              child: Center(
                  child: Text(
                      'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF46A1DD),
                    ),
                  ),
              ),
            ),
            Expanded(
              child: Container(
                height: 500,
                width: 360,
                child: ListView(

                  children: ListTile.divideTiles(
                    context: context,
                      tiles: [
                        ListTile(
                          leading: Icon(Icons.language),
                          title: Text(
                            'Language',
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.phonelink_ring),
                          title: Text(
                            'Sounds',
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.clear_all),
                          title: Text(
                            'Clear',
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.info_outline),
                          title: Text(
                            'About',
                          ),
                        ),

                      ]
                  ).toList(),


                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}

