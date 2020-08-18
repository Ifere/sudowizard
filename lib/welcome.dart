import 'package:flutter/material.dart';
import 'package:sudoku/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF46A1DD), Color(0xFF35A9C1)])),
                child: Column(
                   children: <Widget>[
                     SizedBox(
                       height: 300,
                     ),

                     Center(
                       child: Text(
                    'Solve Sudoku Fast',
                    style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                  ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Center(
                       child: Text(
                         'Scan your sudoku 3x3 and get solutions',
                         style: TextStyle(
                           fontSize: 15.0,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                         ),

                       ),
                     ),
                     SizedBox(
                       height: 200,
                     ),
                     Positioned(
                       bottom: 20.0,
                       right: 80.0,
                       left: 80.0,
                       child: SizedBox(
                         height: 60,
                         width: 200,
                         child: Padding(
                           padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
                           child: RaisedButton(
//                      splashColor: press ? Colors.green : Colors.red,
                             color: Colors.white,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(13),
                             ),
                             child: Text(
                               'Next',
                               style: TextStyle(
                                 fontSize: 15,
                                 color: Color(0xFF35A9C1),
                               ),
                             ),
                           onPressed: ()  {
                             Navigator.push(context, MaterialPageRoute(builder: (context) {
                               return Dashboard();
                             }));
                           },
                           ),
                         ),
                       ),
                     ),
],
                ),
              ),
    );
  }
}