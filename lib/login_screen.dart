import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.red, // Set AppBar background color to transparent
        elevation: 0, // Remove app bar shadow
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Login Page!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your login logic here
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Background color
                  onPrimary: const Color.fromARGB(255, 16, 0, 0), // Text color
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add navigation to sign-up page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text("New here? Please sign up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
