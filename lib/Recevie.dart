import 'package:flutter/material.dart';
import 'package:flutter_application_1/bluetooth.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ReceiveData extends StatefulWidget {
  @override
  _ReceiveDataState createState() => _ReceiveDataState();
}

class _ReceiveDataState extends State<ReceiveData> {
  final BService bluetoothService = BService();
  BluetoothDevice? _device;
  List<String> _receivedMessages = [];
  
  get flutterBlue => null;

  @override
  void initState() {
    super.initState();
    _startScanning();
  }

  Future<void> _startScanning() async {
    try {
      // Start scanning for devices
      flutterBlue.startScan(timeout: Duration(seconds: 4));

      // Listen for scan results
      flutterBlue.scanResults.listen((List<ScanResult> results) {
        for (ScanResult result in results) {
          // Check if the device you're interested in is found
          if (result.device.name == 'MindSpark') {
            // Stop scanning
            flutterBlue.stopScan();

            // Connect to the device
            _connectToDevice(result.device);
            break;
          }
        }
      });
    } catch (e) {
      print('Error scanning for devices: $e');
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      // Connect to the device
      await device.connect();

      // Discover services and characteristics
      List<BluetoothService> services = await device.discoverServices();
      services.forEach((service) {
        service.characteristics.forEach((characteristic) {
          // Subscribe to characteristic notifications
          if (characteristic.uuid.toString() == "00002A19-0000-1000-8000-00805F9B34FB") {
            characteristic.setNotifyValue(true);
            characteristic.value.listen((value) {
              // Convert the received value to a string
              String receivedMessage = String.fromCharCodes(value);
              // Update the UI with the received message
              setState(() {
                _receivedMessages.add(receivedMessage);
              });
            });
          }
        });
      });
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive Data'),
      ),
      body: ListView.builder(
        itemCount: _receivedMessages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_receivedMessages[index]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // Disconnect from the device when the widget is disposed
    if (_device != null) {
      _device!.disconnect();
    }
    super.dispose();
  }
}
