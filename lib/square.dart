import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'bluetooth.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  runApp(MaterialApp(
    home: Square(),
  ));
}

class Square extends StatefulWidget {
  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Gradient> _animation;

  bool showCompletedAnimation = false; // Define showCompletedAnimation

  // Initialize an instance of BService
  final BService bluetoothService = BService();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = LinearGradientTween(
      begin: LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 218, 206, 206)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      end: LinearGradient(
        colors: [
          Color.fromARGB(255, 79, 67, 236),
          Color.fromARGB(255, 241, 243, 245)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ).animate(_animationController);

    // Check for connection status initially
    checkConnectionStatus();
  }

  // Function to check connection status and set the animation accordingly
  void checkConnectionStatus() async {
    try {
      // Get the connected device
      BluetoothDevice connectedDevice =
          await bluetoothService.getConnectedDevice();
      // If connected, set the isConnected flag to true
      setState(() {
        bluetoothService.isConnected = true;
      });
    } catch (e) {
      // If not connected, show the pop-up message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white, // Set background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Set border radius
            ),
            title: Text(
              "No Device Connected",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProtestRiot', // Use ProtestRiot font
              ),
            ),
            content: Text(
              "Please connect a Bluetooth device.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'ProtestRiot', // Use ProtestRiot font
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ProtestRiot', // Use ProtestRiot font
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void startAnimation() {
    setState(() {
      showCompletedAnimation = true;
    });
    // Delay hiding animation after 10 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: _animation.value,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Lottie.asset(
                          'assets/square.json',
                          width: 300,
                          height: 300,
                        ),
                        SizedBox(height: 20),
                        if (showCompletedAnimation)
                          Lottie.asset(
                            'assets/wrong.json',
                            width: 200,
                            height: 200,
                          ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Check connection status again when button is pressed
                                checkConnectionStatus();
                                // Start animation only if connected
                                if (bluetoothService.isConnected) {
                                  startAnimation();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.yellow),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 150,
                                height: 50,
                                alignment: Alignment.center,
                                child: Text(
                                  'Check',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'ComicSans',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text(
                'SQUARE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProtestRiot',
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class LinearGradientTween extends Tween<Gradient> {
  LinearGradientTween({
    required Gradient begin,
    required Gradient end,
  }) : super(begin: begin, end: end);

  @override
  Gradient lerp(double t) =>
      LinearGradient.lerp(begin as LinearGradient?, end as LinearGradient?, t)!;
}
