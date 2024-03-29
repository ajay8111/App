import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';

import 'menu.dart'; // Import your Menu screen

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Bubble> _bubbles;
  late AudioPlayer _backgroundMusicPlayer; // Define AudioPlayer instance for background music
  bool _isBackgroundMusicPlaying = true; // Track if background music is playing or not

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _bubbles = List.generate(10, (index) => Bubble());

    _animationController.addListener(() {
      for (var bubble in _bubbles) {
        bubble.update();
      }
      setState(() {});
    });

    // Initialize AudioPlayer for background music
    _backgroundMusicPlayer = AudioPlayer();
    _playBackgroundMusic(); // Play background music
  }

  @override
  void dispose() {
    _animationController.dispose();
    _backgroundMusicPlayer.dispose(); // Dispose the AudioPlayer instance for background music
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/underwaterbg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    CustomPaint(
                      painter: BubblePainter(bubbles: _bubbles),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/mindspark.png',  // Replace with your actual image path
                              width: 300,
                              height: 300,
                            ),
                            SizedBox(height: constraints.maxHeight * 0.02),
                            GestureDetector(
                              onTap: () {
                                _playSound(); // Play sound when tapped
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Menu()),
                                );
                              },
                              child: Image.asset(
                                'assets/start.png',
                                width: constraints.maxWidth * 0.5,
                                height: constraints.maxWidth * 0.5,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                            Text(
                              '',
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.05,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'ProtestRiot',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: _toggleBackgroundMusic,
              child: Icon(
                _isBackgroundMusicPlaying ? Icons.volume_up : Icons.volume_off,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _playSound() async {
    try {
      // Load and play the click sound
      final clickPlayer = AudioPlayer();
      await clickPlayer.setAsset('assets/click.mp3');
      await clickPlayer.play();
      await clickPlayer.dispose(); // Dispose the click sound player
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  void _playBackgroundMusic() async {
    try {
      // Load and play the background music
      await _backgroundMusicPlayer.setAsset('assets/farcry.mp3');
      await _backgroundMusicPlayer.setLoopMode(LoopMode.one);
      await _backgroundMusicPlayer.play();
    } catch (e) {
      print("Error playing background music: $e");
    }
  }

  void _toggleBackgroundMusic() async {
    if (_isBackgroundMusicPlaying) {
      await _backgroundMusicPlayer.pause(); // Pause background music
    } else {
      await _backgroundMusicPlayer.play(); // Resume background music
    }
    setState(() {
      _isBackgroundMusicPlaying = !_isBackgroundMusicPlaying; // Toggle the state
    });
  }
}

class Bubble {
  double x;
  double y;
  double radius;
  double speed;

  Bubble()
      : x = Random().nextDouble(),
        y = Random().nextDouble(),
        radius = Random().nextDouble() * 20 + 5,
        speed = Random().nextDouble() * 0.005 + 0.002;

  void update() {
    y -= speed;
    if (y < 0) {
      y = 1.0;
    }
  }
}

class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;

  BubblePainter({required this.bubbles});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255).withOpacity(0.6)
      ..style = PaintingStyle.fill;

    for (var bubble in bubbles) {
      canvas.drawCircle(
        Offset(bubble.x * size.width, bubble.y * size.height),
        bubble.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

