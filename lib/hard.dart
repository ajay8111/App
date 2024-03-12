import 'package:flutter/material.dart';

import 'package:flutter_application_1/monument.dart';


class hard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/hardbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 1, 15).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SparkSpirit()),
                    );
                  },
                  child: Center(
                    child: Image.asset(
                      'assets/building.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SparkSpirit()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'SparkSpirit',
                    style: TextStyle(
                      color: Color.fromARGB(255, 39, 156, 240),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ProtestRiot',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
