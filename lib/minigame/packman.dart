import 'package:flutter/material.dart';

enum Direction { up, down, left, right }

class PacManGame extends StatefulWidget {
  @override
  _PacManGameState createState() => _PacManGameState();
}

class _PacManGameState extends State<PacManGame> {
  static const int gridSize = 10;
  static const double cellSize = 30.0;
  static const int numRows = 20;
  static const int numCols = 15;
  static const double pacManSpeed = 3.0;

  Direction _direction = Direction.right;
  List<List<bool>> _grid = List.generate(
      numRows, (i) => List.generate(numCols, (j) => false));

  double _pacManX = (numCols ~/ 2) * cellSize;
  double _pacManY = (numRows ~/ 2) * cellSize;

  @override
  void initState() {
    super.initState();
    _direction = Direction.right;
  }

  void _movePacMan() {
    setState(() {
      switch (_direction) {
        case Direction.up:
          if (_pacManY > 0) _pacManY -= pacManSpeed;
          break;
        case Direction.down:
          if (_pacManY < numRows * cellSize - cellSize) _pacManY += pacManSpeed;
          break;
        case Direction.left:
          if (_pacManX > 0) _pacManX -= pacManSpeed;
          break;
        case Direction.right:
          if (_pacManX < numCols * cellSize - cellSize) _pacManX += pacManSpeed;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pac-Man Game'),
      ),
      body: GestureDetector(
        onTap: () {
          _movePacMan();
        },
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 0) {
            _direction = Direction.down;
          } else if (details.delta.dy < 0) {
            _direction = Direction.up;
          }
        },
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            _direction = Direction.right;
          } else if (details.delta.dx < 0) {
            _direction = Direction.left;
          }
        },
        child: Center(
          child: Stack(
            children: [
              Container(
                color: Colors.black,
              ),
              _buildGrid(),
              Positioned(
                left: _pacManX,
                top: _pacManY,
                child: Image.asset(
                  'assets/pacman.png', // Replace with your Pac-Man image path
                  width: cellSize,
                  height: cellSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid() {
    List<Widget> children = [];
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        children.add(Positioned(
          left: j * cellSize,
          top: i * cellSize,
          child: Container(
            width: cellSize,
            height: cellSize,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade800),
            ),
          ),
        ));
      }
    }
    return Stack(children: children);
  }
}
