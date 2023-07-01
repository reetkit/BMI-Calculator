import 'package:flutter/material.dart';

import 'input_insert.dart';
import 'dart:async';
void main() => runApp(MyApp());

//import 'screens/input_page.dart';

// void main() {
//   runApp(BMICalculator());
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REETKIT',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BMICalculator())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       color: Color(0xff0A0E21),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('bmi.png'),
                )
              ),

            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                child: Text('BMI CALCULATOR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            )
          ],
        ),
     ),
      bottomNavigationBar: Container(
        color: Color(0xff0A0E21),
        height: 100.0,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text('REETKIT',
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
            SizedBox(
              height: 5.0,
            ),
            Text('Made by Ankit',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),)
          ],
        ),
      ),
    );
  }
}
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0A0E21),
        //textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white) )
      ),
      home: InputPage(),
    );
  }
}