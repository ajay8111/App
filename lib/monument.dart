import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SparkSpirit extends StatelessWidget {
  final List<Map<String, dynamic>> iconData = [
    {'image': 'house.png', 'label': 'House'},
    {'image': 'helicopter.png', 'label': 'Helicopter'},
    {'image': 'mountian.png', 'label': 'Mountain'},
    {'image': 'thunder.png', 'label': 'Thunder'},
    {'image': 'car.png', 'label': 'Car'},
    {'image': 'bird.png', 'label': 'Bird'},
    {'image': 'airplane.png', 'label': 'Aeroplane'},
    {'image': 'umberlla.png', 'label': 'Umbrella'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellowAccent, Colors.lightBlueAccent],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: iconData.map((data) => buildImage(context, data)).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context, Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () {
        // Handle image click
        print('${data['label']} clicked!');
        navigateToPage(context, data['label']);
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/${data['image']}',
              width: 60,
              height: 60,
              // color: data['color'], // Note: 'color' property is not defined in your data
            ),
            SizedBox(height: 12.0),
            Text(
              data['label'],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cartoon',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToPage(BuildContext context, String label) {
    switch (label) {
      case 'House':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HousePage()),
        );
        break;
      case 'Helicopter':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HelicopterPage()),
        );
        break;
      case 'Mountain':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MountainPage()),
        );
        break;
      case 'Thunder':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThunderPage()),
        );
        break;
        case 'Car':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CarPage()),
        );
        break;
        case 'Bird':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BirdPage()),
        );
        break;
        case 'Aeroplane':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AeroPage()),
        );
        break;
        case 'Umbrella':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UmbrellaPage()),
        );
        break;
      // Add cases for other items as needed
      default:
        break;
    }
  }
}

class HousePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'HOUSE',
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/house.json', // Adjust the file path
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 40),
                        Image.asset(
                          'assets/house2.png', // Adjust the file path
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        elevation: 0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                iconSize: 40.0,
                onPressed: () {
                  // Show message with unique pop-up style
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (BuildContext context, _, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ProtestRiot',
                                  color: Colors.blue,
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Construct this house \u{1F3E0}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class HelicopterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'HELICOPTER',
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
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 25, 212, 156),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/helicopter.json', // Adjust the file path
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 80),
                        Image.asset(
                          'assets/helicopter2.png', // Adjust the file path
                          width: 250,
                          height: 250,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 25, 212, 156),
        elevation: 0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                iconSize: 40.0,
                onPressed: () {
                  // Show message with unique pop-up style
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (BuildContext context, _, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ProtestRiot',
                                  color: Color.fromARGB(255, 25, 212, 156),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Build a helicopter \u{1F681}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Color.fromARGB(255, 25, 212, 156),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MountainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'MOUNTAIN',
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/mountian.json', // Adjust the file path
                          width: 340,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 40),
                        Image.asset(
                          'assets/mountian2.png', // Adjust the file path
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                iconSize: 40.0,
                onPressed: () {
                  // Show message with unique pop-up style
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (BuildContext context, _, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ProtestRiot',
                                  color: Color.fromARGB(255, 230, 154, 47),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Make a Mountain \u{1F3D4}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Color.fromARGB(255, 230, 154, 47),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThunderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'THUNDER',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'ProtestRiot',
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 36, 103, 139),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/thunder.json', // Adjust the file path
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 40),
                        Image.asset(
                          'assets/thunder2.png', // Adjust the file path
                          width: 250,
                          height: 250,
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 36, 103, 139),
        elevation: 0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                iconSize: 40.0,
                onPressed: () {
                  // Show message with unique pop-up style
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (BuildContext context, _, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ProtestRiot',
                                  color: Color.fromARGB(255, 36, 103, 139),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Make a splash Lightning \u{26A1}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Color.fromARGB(255, 36, 103, 139),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'CAR',
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
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 15, 197, 57),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/car.json', // Adjust the file path
                          width: 260,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Image.asset(
                          'assets/car2.png', // Adjust the file path
                          width: 230,
                          height: 230,
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 15, 197, 57),
        elevation: 0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  
                ),
                iconSize: 40.0,
                onPressed: () {
                  // Show message with unique pop-up style
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (BuildContext context, _, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ProtestRiot',
                                  color: Color.fromARGB(255, 15, 197, 57),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Make this car as fast \u{1F697}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Color.fromARGB(255, 15, 197, 57),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'BIRD',
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
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(177, 193, 113, 32),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/bird.json', // Adjust the file path
                          width: 260,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Image.asset(
                          'assets/bird2.png', // Adjust the file path
                          width: 230,
                          height: 230,
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(177, 193, 113, 32),
        elevation: 0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  
                ),
                iconSize: 40.0,
                onPressed: () {
                  // Show message with unique pop-up style
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (BuildContext context, _, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ProtestRiot',
                                  color: Color.fromARGB(177, 193, 113, 32),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Draw this feathered sentianal creature  \u{1F426}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Color.fromARGB(177, 193, 113, 32),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'AEROPLANE',
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
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(176, 32, 166, 193),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/airplane.json', // Adjust the file path
                          width: 260,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Image.asset(
                          'assets/airplane2.png', // Adjust the file path
                          width: 230,
                          height: 230,
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(176, 32, 166, 193),
        elevation: 0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  
                ),
                iconSize: 40.0,
                onPressed: () {
                  // Show message with unique pop-up style
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (BuildContext context, _, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ProtestRiot',
                                  color: Color.fromARGB(123, 32, 86, 193),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Soar through the sky like a superhero \u{2708}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Color.fromARGB(176, 32, 166, 193),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class UmbrellaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'UMBRELLA',
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
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(142, 193, 32, 102),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 70),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/umbrella.json', // Adjust the file path
                          width: 260,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Image.asset(
                          'assets/umberlla2.png', // Adjust the file path
                          width: 230,
                          height: 230,
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(142, 193, 32, 102),
        elevation: 0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  
                ),
                iconSize: 40.0,
                onPressed: () {
                  // Show message with unique pop-up style
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (BuildContext context, _, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ProtestRiot',
                                  color: Color.fromARGB(142, 193, 32, 102),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'When the raindrops dance, our trusty umbrella is there to play along \u{1F302}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProtestRiot',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8),
                                  decoration: TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Color.fromARGB(142, 193, 32, 102),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Add similar pages for Car, Bird, Aeroplane, and Umbrella as needed
