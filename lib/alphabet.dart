import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Alphabet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/alphawater2.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            children: [
              Wrap(
                spacing: MediaQuery.of(context).size.width * 0.02,
                runSpacing: MediaQuery.of(context).size.width * 0.1,
                alignment: WrapAlignment.center,
                children: [
                  for (var letter = 'A';
                      letter.compareTo('Z') <= 0;
                      letter = String.fromCharCode(letter.codeUnitAt(0) + 1))
                    ClickableLetterWidget(letter,
                        onLetterTap: () => navigateToPage(context, letter)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToPage(BuildContext context, String letter) {
    // Replace the switch statement with the navigation logic for each letter
    switch (letter) {
      case 'A':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageA()));
        break;
      case 'B':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageB()));
        break;
      case 'C':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageC()));
        break;
      case 'D':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageD()));
        break;
      case 'E':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageE()));
        break;
      case 'F':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageF()));
        break;
      case 'G':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageG()));
        break;
      case 'H':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageH()));
        break;
      case 'I':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageI()));
        break;
      case 'J':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageJ()));
        break;
      case 'K':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageK()));
        break;
      case 'L':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageL()));
        break;
      case 'M':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageM()));
        break;
      case 'N':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageN()));
        break;
      case 'O':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageO()));
        break;
      case 'P':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageP()));
        break;
      case 'Q':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageQ()));
        break;
      case 'R':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageR()));
        break;
      case 'S':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageS()));
        break;
      case 'T':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageT()));
        break;
      case 'U':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageU()));
        break;
      case 'V':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageV()));
        break;
      case 'W':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageW()));
        break;
      case 'X':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageX()));
        break;
      case 'Y':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageY()));
        break;
      case 'Z':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageZ()));
        break;
      default:
        print('$letter tapped!'); // Add a default case or handle as needed
    }
  }
}

class ClickableLetterWidget extends StatelessWidget {
  final String letter;
  final VoidCallback onLetterTap;

  ClickableLetterWidget(this.letter, {required this.onLetterTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLetterTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.width * 0.4,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bubble.png'),
            fit: BoxFit.cover,
          ),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
        ),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.1,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'ProtestRiot',
            ),
          ),
        ),
      ),
    );
  }
}

// Define YourPageA(), YourPageB(), etc., based on your project structure
class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Aletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageB extends StatefulWidget {
  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter2(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the B letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Bletter.png', // Path to your B letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter2 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter2({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageC extends StatefulWidget {
  @override
  _PageCState createState() => _PageCState();
}

class _PageCState extends State<PageC> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the C letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Cletter.png', // Path to your C letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter3 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter3({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageD extends StatefulWidget {
  @override
  _PageDState createState() => _PageDState();
}

class _PageDState extends State<PageD> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Dletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter4 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter4({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageE extends StatefulWidget {
  @override
  _PageEState createState() => _PageEState();
}

class _PageEState extends State<PageE> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Eletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter5 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter5({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageF extends StatefulWidget {
  @override
  _PageFState createState() => _PageFState();
}

class _PageFState extends State<PageF> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Fletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter6 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter6({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

double cmToPixels(double cm) {
  return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
}

class PageG extends StatefulWidget {
  @override
  _PageGState createState() => _PageGState();
}

class _PageGState extends State<PageG> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Gletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter7 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter7({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageH extends StatefulWidget {
  @override
  _PageHState createState() => _PageHState();
}

class _PageHState extends State<PageH> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Hletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter8 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter8({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageI extends StatefulWidget {
  @override
  _PageIState createState() => _PageIState();
}

class _PageIState extends State<PageI> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Iletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter9 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter9({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageJ extends StatefulWidget {
  @override
  _PageJState createState() => _PageJState();
}

class _PageJState extends State<PageJ> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Jletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter10 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter10({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageK extends StatefulWidget {
  @override
  _PageKState createState() => _PageKState();
}

class _PageKState extends State<PageK> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Kletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter11 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter11({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageL extends StatefulWidget {
  @override
  _PageLState createState() => _PageLState();
}

class _PageLState extends State<PageL> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Lletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter12 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter12({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageM extends StatefulWidget {
  @override
  _PageMState createState() => _PageMState();
}

class _PageMState extends State<PageM> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Mletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter13 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter13({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageN extends StatefulWidget {
  @override
  _PageNState createState() => _PageNState();
}

class _PageNState extends State<PageN> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Nletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter14 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter14({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageO extends StatefulWidget {
  @override
  _PageOState createState() => _PageOState();
}

class _PageOState extends State<PageO> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Oletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter15 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter15({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageP extends StatefulWidget {
  @override
  _PagePState createState() => _PagePState();
}

class _PagePState extends State<PageP> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Pletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter16 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter16({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageQ extends StatefulWidget {
  @override
  _PageQState createState() => _PageQState();
}

class _PageQState extends State<PageQ> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Qletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter17 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter17({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageR extends StatefulWidget {
  @override
  _PageRState createState() => _PageRState();
}

class _PageRState extends State<PageR> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Rletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter18 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter18({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageS extends StatefulWidget {
  @override
  _PageSState createState() => _PageSState();
}

class _PageSState extends State<PageS> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Sletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter19 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter19({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageT extends StatefulWidget {
  @override
  _PageTState createState() => _PageTState();
}

class _PageTState extends State<PageT> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Tletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter20 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter20({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageU extends StatefulWidget {
  @override
  _PageUState createState() => _PageUState();
}

class _PageUState extends State<PageU> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Uletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter21 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter21({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageV extends StatefulWidget {
  @override
  _PageVState createState() => _PageVState();
}

class _PageVState extends State<PageV> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Vletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter22 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter22({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageW extends StatefulWidget {
  @override
  _PageWState createState() => _PageWState();
}

class _PageWState extends State<PageW> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Wletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter23 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter23({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageX extends StatefulWidget {
  @override
  _PageXState createState() => _PageXState();
}

class _PageXState extends State<PageX> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Xletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter24 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter24({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageY extends StatefulWidget {
  @override
  _PageYState createState() => _PageYState();
}

class _PageYState extends State<PageY> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Yletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter25 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter25({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}

class PageZ extends StatefulWidget {
  @override
  _PageZState createState() => _PageZState();
}

class _PageZState extends State<PageZ> {
  final List<Offset> tappedSquares = [];
  bool showCompletedAnimation = false;

  void resetGrid() {
    setState(() {
      tappedSquares.clear();
    });
  }

  void checkGrid() {
    // Implement your logic for checking the grid here
    print('Checking grid...');
    // Show completed animation
    setState(() {
      showCompletedAnimation = true;
    });
    // Hide completed animation after 3 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showCompletedAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Gradient Blue Background
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 125, 163, 208),
                      Colors.blue.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Grid Background with Dark Blue Color
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight /
                    2, // Adjusted height to cover only the bottom half
                child: GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          box.globalToLocal(details.globalPosition);
                      tappedSquares.add(localOffset);
                    });
                  },
                  child: CustomPaint(
                    painter: GridPainter(
                        tappedSquares:
                            tappedSquares), // Custom painter for drawing grid lines
                  ),
                ),
              ),
              // Positioned widget to place the A letter image on top screen
              Positioned(
                top: constraints.maxHeight * 0.4, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Zletter.png', // Path to your A letter image
                    width: constraints.maxWidth * 0.3, // Adjust size as needed
                    height: constraints.maxHeight * 0.2,
                  ),
                ),
              ),
              // Check button
              Positioned(
                bottom: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: checkGrid,
                  child: Text('Check'),
                ),
              ),
              // Reset button
              Positioned(
                bottom: constraints.maxHeight * 0.02,
                left: constraints.maxWidth * 0.3,
                right: constraints.maxWidth * 0.3,
                child: ElevatedButton(
                  onPressed: resetGrid,
                  child: Text('Reset'),
                ),
              ),
              // Completed Animation
              if (showCompletedAnimation)
                Positioned(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Lottie.asset(
                    'assets/completed.json',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class GridPainter26 extends CustomPainter {
  final List<Offset> tappedSquares;

  GridPainter26({required this.tappedSquares});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1) // Light blue color for grid lines
      ..strokeWidth = 3;

    final cellSize = cmToPixels(4);
    final borderRadius = BorderRadius.circular(cellSize / 2);

    // Draw vertical lines
    for (double i = 0; i < size.width; i += cellSize) {
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i, size.height), paint);
    }

    // Draw horizontal lines only in the bottom half
    for (double i = size.height / 2; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    final yellowPaint = Paint()..color = Colors.yellowAccent;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Adjust border width as needed

    for (final tappedSquare in tappedSquares) {
      final xIndex = (tappedSquare.dx / cellSize).floor();
      final yIndex = ((tappedSquare.dy - size.height / 2) / cellSize).floor();

      final x = xIndex * cellSize;
      final y = yIndex * cellSize + size.height / 2;

      final roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, cellSize, cellSize),
        Radius.circular(
            cellSize / 4), // Adjust the radius for desired roundness
      );

      // Draw yellow square
      canvas.drawRRect(roundedRect, yellowPaint);

      // Draw black border around the yellow square
      canvas.drawRRect(roundedRect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint to update the tapped squares
  }

  double cmToPixels(double cm) {
    return cm * 11.3779528; // 1 cm = 11.3779528 pixels (approx.)
  }
}
