import 'dart:convert'; // Import the dart:convert library for utf8 codec
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class SendMessagePage extends StatefulWidget {
  @override
  _SendMessagePageState createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  TextEditingController _controller = TextEditingController();
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter message',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _sendMessage(_controller.text);
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendMessage(String message) async {
    // Find the connected Bluetooth device
    BluetoothDevice? device = await _findDevice();
    if (device == null) {
      print('No connected device found');
      return;
    }

    // Connect to the device
    await device.connect();

    // Find the service and characteristic for sending data
    List<BluetoothService> services = await device.discoverServices();
    BluetoothCharacteristic? characteristic;
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic c in service.characteristics) {
        if (c.uuid.toString() == '00002a19-0000-1000-8000-00805f9b34fb') {
          characteristic = c;
          break;
        }
      }
    }

    if (characteristic == null) {
      print('Characteristic not found');
      return;
    }

    // Send the message
    await characteristic.write(utf8.encode(message));
    print('Message sent: $message');

    // Disconnect from the device
    await device.disconnect();
  }

  Future<BluetoothDevice?> _findDevice() async {
    // Get the first connected device
    List<BluetoothDevice> devices = await flutterBlue.connectedDevices;
    if (devices.isNotEmpty) {
      return devices.first;
    } else {
      return null;
    }
  }
}
