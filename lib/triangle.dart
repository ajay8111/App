import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'bluetooth.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:just_audio/just_audio.dart'; // Add just_audio package

class Triangle extends StatefulWidget {
  @override
  _TriangleState createState() => _TriangleState();
}

class _TriangleState extends State<Triangle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Gradient> _animation;
  late AudioPlayer _audioPlayer; // Add audio player

  bool showCompletedAnimation = false; // Define showCompletedAnimation
  bool magneticFieldDetected = false;
  bool audioPlayed = false; // Add a flag to track if the audio has been played

  // Initialize an instance of BService
  final BService bluetoothService = BService();

  // Bluetooth characteristics
  late BluetoothCharacteristic characteristic;
  late BluetoothCharacteristic notifyCharacteristic;

  String _message = '';

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
          Color.fromARGB(255, 214, 6, 222),
          Color.fromARGB(255, 218, 206, 206)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      end: LinearGradient(
        colors: [
          Color.fromARGB(255, 230, 17, 31),
          Color.fromARGB(255, 241, 243, 245)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ).animate(_animationController);

    _audioPlayer = AudioPlayer(); // Initialize audio player

    // Check for connection status initially
    checkConnectionStatus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _audioPlayer.dispose(); // Dispose of the audio player
    super.dispose();
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
      _getServiceAndCharacteristic(connectedDevice);
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
              "No Board Connected",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProtestRiot', // Use ProtestRiot font
              ),
            ),
            content: Text(
              "Please connect with Board.",
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

  void _getServiceAndCharacteristic(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((char) {
        if (char.uuid.toString() == '2a19') {
          notifyCharacteristic = char;
        }
        if (char.uuid.toString() == '6e400003-b5a3-f393-e0a9-e50e24dcca9e') {
          characteristic = char;
          _listenCharacteristic();
        }
      });
    });

    // Set the notify characteristic to listen for magnetic field detection
    if (notifyCharacteristic != null) {
      await notifyCharacteristic.setNotifyValue(true);
      notifyCharacteristic.value.listen((value) {
        String message = String.fromCharCodes(value);
        if (message == 'Magnetic Field Detected') {
          setState(() {
            _message = 'Magnetic Field Detected';
            magneticFieldDetected = true;
            startAnimation();
          });
        }
      });
    }
  }

  void _listenCharacteristic() {
    Stream<List<int>> stream = characteristic.lastValueStream;
    if (stream != null) {
      stream.listen((value) {
        String message = String.fromCharCodes(value);
        if (message == 'Magnetic Field Detected') {
          setState(() {
            _message = 'Magnetic Field Detected';
            magneticFieldDetected = true;
            startAnimation();
          });
        }
      });
    }
  }

  void startAnimation() {
    setState(() {
      showCompletedAnimation = true;
    });

    if (magneticFieldDetected && !audioPlayed) {
      _audioPlayer.setAsset('assets/square.mp3').then((_) {
        _audioPlayer.play();
        setState(() {
          audioPlayed = true;
        });
      });
    }

    // Delay hiding animation after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        showCompletedAnimation = false;
        magneticFieldDetected = false;
        audioPlayed =
            false; // Reset the flag to allow playing the audio again in the future
      });
    });
  }

  void _handleCheckButtonPressed() {
    // Start animation when the button is pressed
    startAnimation();
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
                        Image.asset(
                          'assets/cross.png',
                          width: 310,
                          height: 310,
                        ),
                        SizedBox(height: 20),
                        if (showCompletedAnimation && magneticFieldDetected)
                          Lottie.asset(
                            'assets/completed.json',
                            width: 200,
                            height: 200,
                          ),
                        if (showCompletedAnimation && !magneticFieldDetected)
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
                                // Handle button press here
                                _handleCheckButtonPressed();
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
                                  'CHECK',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'ProtestRiot',
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
                'CROSS',
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
