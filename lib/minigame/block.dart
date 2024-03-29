import 'dart:async';
import 'package:flutter/material.dart';

class TetrisBoard extends StatefulWidget {
  @override
  _TetrisBoardState createState() => _TetrisBoardState();
}

class _TetrisBoardState extends State<TetrisBoard> {
  final int width = 10;
  final int height = 20;
  final double controlAreaHeight = 100; // Height of the control area
  List<List<int>> board = [];
  List<List<int>> currentPiece = [];
  int currentPieceX = 0;
  int currentPieceY = 0;
  Timer? timer;
  bool isPlaying = false;

  List<List<List<int>>> blockShapes = [
    // Different block shapes
    [
      [1, 1],
      [1, 1],
    ],
    [
      [1, 1, 1],
      [0, 1, 0],
    ],
    [
      [1, 1, 1],
      [0, 0, 1],
    ],
    [
      [1, 1, 1, 1],
    ],
    [
      [1, 1, 0],
      [0, 1, 1],
    ],
    [
      [0, 1, 1],
      [1, 1, 0],
    ],
    [
      [1, 0, 0],
      [1, 1, 1],
    ],
  ];

  @override
  void initState() {
    super.initState();
    initBoard();
    startGame();
  }

  void initBoard() {
    board = List.generate(height, (y) => List.filled(width, 0));
  }

  void startGame() {
    isPlaying = true;
    generatePiece();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      movePieceDown();
    });
  }

  void endGame() {
    if (timer != null) {
      timer!.cancel();
    }
    setState(() {
      isPlaying = false;
    });
  }

  void movePieceDown() {
    if (isPlaying) {
      setState(() {
        if (canMovePiece(0, 1)) {
          currentPieceY++;
        } else {
          mergePiece();
          clearRows();
          generatePiece();
          if (!canMovePiece(0, 0)) {
            endGame();
          }
        }
      });
    }
  }

  void movePieceLeft() {
    if (canMovePiece(-1, 0)) {
      setState(() {
        currentPieceX--;
      });
    }
  }

  void movePieceRight() {
    if (canMovePiece(1, 0)) {
      setState(() {
        currentPieceX++;
      });
    }
  }

  void rotatePiece() {
    setState(() {
      List<List<int>> rotatedPiece =
          List.generate(currentPiece[0].length, (y) => List.filled(currentPiece.length, 0));
      for (int y = 0; y < currentPiece.length; y++) {
        for (int x = 0; x < currentPiece[y].length; x++) {
          rotatedPiece[x][currentPiece.length - y - 1] = currentPiece[y][x];
        }
      }
      if (canMovePiece(0, 0, piece: rotatedPiece)) {
        currentPiece = rotatedPiece;
      }
    });
  }

  bool canMovePiece(int offsetX, int offsetY, {List<List<int>>? piece}) {
    List<List<int>> targetPiece = piece ?? currentPiece;
    for (int y = 0; y < targetPiece.length; y++) {
      for (int x = 0; x < targetPiece[y].length; x++) {
        if (targetPiece[y][x] != 0) {
          int newX = currentPieceX + x + offsetX;
          int newY = currentPieceY + y + offsetY;
          if (newX < 0 || newX >= width || newY >= height || (newY >= 0 && board[newY][newX] != 0)) {
            return false;
          }
        }
      }
    }
    return true;
  }

  void mergePiece() {
    for (int y = 0; y < currentPiece.length; y++) {
      for (int x = 0; x < currentPiece[y].length; x++) {
        if (currentPiece[y][x] != 0) {
          board[currentPieceY + y][currentPieceX + x] = currentPiece[y][x];
        }
      }
    }
  }

  void generatePiece() {
    currentPieceX = width ~/ 2 - 1;
    currentPieceY = 0;
    currentPiece = blockShapes[DateTime.now().millisecondsSinceEpoch % blockShapes.length];
  }

  void clearRows() {
    List<int> fullRows = [];
    for (int y = 0; y < height; y++) {
      if (board[y].every((cell) => cell !=
      0)) {
        fullRows.add(y);
      }
    }
    if (fullRows.isNotEmpty) {
      for (int row in fullRows) {
        board.removeAt(row);
        board.insert(0, List.filled(width, 0));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double tileSize = MediaQuery.of(context).size.width / width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 1, 111),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight - controlAreaHeight - 10, // 20 for some padding
            child: Stack(
              children: [
                // Render board
                for (int y = 0; y < height; y++)
                  for (int x = 0; x < width; x++)
                    if (board[y][x] != 0)
                      Positioned(
                        left: x * tileSize,
                        top: (y * tileSize) + 10, // Adjust for some padding from the top
                        child: Container(
                          width: tileSize,
                          height: tileSize,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black), // Add borders to create block-like design
                          ),
                        ),
                      ),
                // Render current piece
                for (int y = 0; y < currentPiece.length; y++)
                  for (int x = 0; x < currentPiece[y].length; x++)
                    if (currentPiece[y][x] != 0)
                      Positioned(
                        left: (currentPieceX + x) * tileSize,
                        top: ((currentPieceY + y) * tileSize) + 10, // Adjust for some padding from the top
                        child: Container(
                          width: tileSize,
                          height: tileSize,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            border: Border.all(color: Colors.black), // Add borders to create block-like design
                          ),
                        ),
                      ),
                // Game Over text
                if (!isPlaying)
                  Center(
                    child: Text(
                      'Game Over',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            height: controlAreaHeight,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
  onPressed: movePieceLeft,
  icon: Icon(Icons.arrow_back, color: Colors.white, size: 40),
),
IconButton(
  onPressed: movePieceRight,
  icon: Icon(Icons.arrow_forward, color: Colors.white, size: 40),
),
IconButton(
  onPressed: movePieceDown,
  icon: Icon(Icons.arrow_downward, color: Colors.white, size: 40),
),
IconButton(
  onPressed: rotatePiece,
  icon: Icon(Icons.rotate_left, color: Colors.white, size: 40),
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
