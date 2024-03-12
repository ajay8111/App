import 'package:flutter/material.dart';
import 'package:flutter_application_1/StartScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization tasks here
    _navigateToMainScreen();
  }

  _navigateToMainScreen() async {
    // Simulate a time-consuming task, e.g., loading data
    await Future.delayed(Duration(seconds: 6));

    // Navigate to the main screen after the splash screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => StartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 156, 240), // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your title
            Text(
              'MindSpark',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'ProtestRiot',
              ),
            ),
            SizedBox(height: 20),
            // Your game controller icon or any other widget
            Icon(
              MdiIcons.puzzle,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            // Loading animation using flutter_spinkit
            SpinKitChasingDots(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
