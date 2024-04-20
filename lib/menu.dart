import 'package:flutter/material.dart';
import 'package:flutter_application_1/ReceviedData.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_application_1/minigame/game.dart';
import 'package:flutter_application_1/page1.dart';
import 'package:flutter_application_1/connect_device.dart';

class Menu extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/menubg.jpg', // Replace with the actual path to your image
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                'MindSpark',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProtestRiot',
                  color: Color.fromARGB(255, 0, 8, 13),
                  letterSpacing: 4.0, // Add some letter spacing for style
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                color: Colors.transparent, // Set Container background color to transparent
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          playSound('assets/click.mp3');
                          // Navigate to Page1 when "Board Game" button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page1()),
                          );
                        },
                        child: Text(
                          'Board Game',
                          style: TextStyle(
                            color: Color.fromARGB(255, 39, 156, 240),
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProtestRiot',
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      ElevatedButton(
                        onPressed: () {
                          playSound('assets/click.mp3');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SendMessagePage()),
                          );
                        },
                        child: Text(
                          'Mini Games',
                          style: TextStyle(
                            color: Color.fromARGB(255, 188, 169, 24),
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProtestRiot',
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      ElevatedButton(
                        onPressed: () {
                          playSound('assets/click.mp3');
                          // Navigate to LoginScreen when "Quiz Game" button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BPage()),
                          );
                        },
                        child: Text(
                          'Connect Board ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 229, 47, 86),
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProtestRiot',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> playSound(String assetPath) async {
    try {
      await audioPlayer.setAsset(assetPath);
      await audioPlayer.play();
    } catch (e) {
      print("Error playing sound: $e");
    }
  }
}
