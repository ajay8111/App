import 'package:flutter/material.dart';

class DataReceiver extends StatefulWidget {
  final void Function(String) sendTextCallback; // Receive the callback function
  DataReceiver({required this.sendTextCallback});

  @override
  _DataReceiverState createState() => _DataReceiverState();
}

class _DataReceiverState extends State<DataReceiver> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Receiver Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: 'Enter text'),
            ),
            ElevatedButton(
              onPressed: () {
                // Call the callback function with the entered text
                widget.sendTextCallback(textEditingController.text);
                Navigator.pop(context); // Close the page
              },
              child: Text('Send Text'),
            ),
          ],
        ),
      ),
    );
  }
}
