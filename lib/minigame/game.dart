import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInfo {
  
  final String subtitle;
  final String imagePath; // Add imagePath property

  AppInfo({
   
    required this.subtitle,
    required this.imagePath,
  });
}

class Gamepage extends StatelessWidget {
  final List<AppInfo> apps = [
    AppInfo(
      
      subtitle: 'Snake Lite',
      imagePath: 'assets/snake.jpg', // Replace with your image path
    ),
    AppInfo(
      
      subtitle: 'Block Blast',
      imagePath: 'assets/brick.jpg', // Replace with your image path
    ),
    AppInfo(
      
      subtitle: 'Packman',
      imagePath: 'assets/packman.jpg', // Replace with your image path
    ),
    AppInfo(
      
      subtitle: 'Dino Game',
      imagePath: 'assets/dinogame.jpg', // Replace with your image path
    ),
    AppInfo(
     
      subtitle: 'Flappy Bird',
      imagePath: 'assets/flappybird.jpg', // Replace with your image path
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Make the status bar transparent
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent, // Make the background transparent
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HorizontalAppContainerList(apps: apps),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text(
                'MINI GAMES',
                style: TextStyle(
                  color: Color.fromARGB(255, 188, 169, 24),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProtestRiot',
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 100.0, // Adjust the height of the AppBar
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalAppContainerList extends StatefulWidget {
  final List<AppInfo> apps;

  HorizontalAppContainerList({required this.apps});

  @override
  _HorizontalAppContainerListState createState() =>
      _HorizontalAppContainerListState();
}

class _HorizontalAppContainerListState
    extends State<HorizontalAppContainerList> {
  final PageController _pageController =
      PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight * 0.6, // Adjust the height of the container
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.apps.length,
            itemBuilder: (context, index) {
              final appInfo = widget.apps[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: AppContainer(
                        appInfo: appInfo,
                        onTap: () {
                          print('tapped!');
                        },
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      appInfo.subtitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0, // Adjust the font size
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProtestRiot',
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class AppContainer extends StatelessWidget {
  final AppInfo appInfo;
  final VoidCallback onTap;

  AppContainer({required this.appInfo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Adjust the radius for rounded corners
        ),
        child: Container(
          width: double.infinity,
          height: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    appInfo.imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // SizedBox(height: 8.0),
              // Text(
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 18.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
