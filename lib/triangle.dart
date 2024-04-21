import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import the lottie package

class Triangle extends StatefulWidget {
  @override
  _TriangleState createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Gradient> _animation;

  bool showCompletedAnimation = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = LinearGradientTween(
      begin: LinearGradient(
        colors: [Color.fromARGB(255, 214, 6, 222), Color.fromARGB(255, 218, 206, 206)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      end: LinearGradient(
        colors: [Color.fromARGB(255, 230, 17, 31), Color.fromARGB(255, 241, 243, 245)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                      'assets/triangle.json',
                      width: 310,
                      height: 310,
                    ),
                    SizedBox(height: 20),
                    if (showCompletedAnimation)
                      Lottie.asset(
                        'assets/completed.json',
                        width: 250,
                        height: 250,
                      ),
                    Spacer(), // Added Spacer widget
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showCompletedAnimation = !showCompletedAnimation;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow), // Set background color
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Button border radius
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
                                color: Colors.black, // Text color
                                fontFamily: 'ComicSans', // Text font
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
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text(
                'TRIANGLE',
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
