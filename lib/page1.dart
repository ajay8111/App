import 'package:flutter/material.dart';
import 'package:flutter_application_1/bluetooth_manager.dart';

import 'package:flutter_application_1/easy.dart';
import 'package:flutter_application_1/hard.dart';
import 'package:flutter_application_1/medium.dart';
import 'package:just_audio/just_audio.dart';


class Page1 extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Define AudioPlayer instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/squarebg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Text(
                    'Level',
                    style: TextStyle(
                      color: Color.fromARGB(255, 246, 247, 248),
                      fontSize: MediaQuery.of(context).size.width * 0.13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ProtestRiot',
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 39, 156, 240), width: 4),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _playSound();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => easy()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 39, 156, 240),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                          ),
                          child: Text(
                            'Easy',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProtestRiot',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ElevatedButton(
                          onPressed: () {
                            _playSound();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => medium()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 39, 156, 240),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),
                          child: Text(
                            'Medium',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProtestRiot',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ElevatedButton(
                          onPressed: () {
                            _playSound();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => hard()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 39, 156, 240),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                          ),
                          child: Text(
                            'Hard',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProtestRiot',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.02,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color.fromARGB(255, 39, 156, 240),
                      size: MediaQuery.of(context).size.width * 0.08),
                  onPressed: () {
                    _playSound(); // Play sound when back arrow button is pressed
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.02,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.bluetooth,
                      color: Color.fromARGB(255, 39, 156, 240),
                      size: MediaQuery.of(context).size.width * 0.08),
                  onPressed: () {
                    _playSound(); // Play sound when bluetooth icon button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BluetoothManagePage()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _playSound() async {
    try {
      await _audioPlayer.setAsset('assets/click.mp3'); // Load the click sound
      await _audioPlayer.play();
    } catch (e) {
      print("Error playing sound: $e");
    }
  }
}
