import 'package:flutter/material.dart';


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
                for (var letter = 'A'; letter.compareTo('Z') <= 0; letter = String.fromCharCode(letter.codeUnitAt(0) + 1))
                    ClickableLetterWidget(letter, onLetterTap: () => navigateToPage(context, letter)),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageA()));
        break;
      case 'B':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageB()));
        break;
      case 'C':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageC()));
        break;
      case 'D':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageD()));
        break;
      case 'E':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageE()));
        break;
      case 'F':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageF()));
        break;
      case 'G':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageG()));
        break;
      case 'H':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageH()));
        break;
      case 'I':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageI()));
        break;
      case 'J':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageJ()));
        break;
      case 'K':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageK()));
        break;
      case 'L':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageL()));
        break;
      case 'M':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageM()));
        break;
      case 'N':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageN()));
        break;
      case 'O':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageO()));
        break;
      case 'P':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageP()));
        break;
      case 'Q':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageQ()));
        break;
      case 'R':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageR()));
        break;
      case 'S':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageS()));
        break;
      case 'T':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageT()));
        break;
      case 'U':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageU()));
        break;
      case 'V':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageV()));
        break;
      case 'W':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageW()));
        break;
      case 'X':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageX()));
        break;
      case 'Y':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageY()));
        break;
      case 'Z':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageZ()));
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
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
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
class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Aletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Bletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Cletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Dletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Eletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Fletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Gletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Hletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Iletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageJ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Jletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Kletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Lletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Mletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Nletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Oletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Pletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Qletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Rletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Sletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Tletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Uletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Vletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Wletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Xletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageY extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Yletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageZ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/A.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: 'letterHero',
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent, // Set color to transparent
                  child: Image.asset(
                    'assets/Zletter.png', // Replace with your image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}