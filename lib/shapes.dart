import 'package:flutter/material.dart';
import 'package:flutter_application_1/rectangle.dart';
import 'package:flutter_application_1/square.dart';
import 'package:flutter_application_1/triangle.dart';

class Shapes extends StatelessWidget {
  final List<String> shapes = ['Square', 'Rectangle', 'Triangle',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/shapesbg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 180),
              itemCount: shapes.length,
              itemBuilder: (context, index) {
                return ClickableList(shapes[index]);
              },
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text(
                'SHAPES',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'ProtestRiot'),
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

class ClickableList extends StatelessWidget {
  final String shapeName;

  ClickableList(this.shapeName);

  void onListPressed(BuildContext context) {
    switch (shapeName) {
      case 'Square':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Square()),
        );
        break;
      case 'Rectangle':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Rectangle()),
        );
        break;
      case 'Triangle':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Triangle()),
        );

        break;    
         default:
        print('Invalid shape: $shapeName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        tileColor: Colors.white.withOpacity(0.0),
        title: Text(
          shapeName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 39, 156, 240),
            fontFamily: 'ProtestRiot',
          ),
        ),
        onTap: () => onListPressed(context),
      ),
    );
  }
}
