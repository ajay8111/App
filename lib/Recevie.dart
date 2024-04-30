import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'bluetooth.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESP32 Bluetooth Demo',
      home: ReceiveData(),
    );
  }
}

class ReceiveData extends StatefulWidget {
  @override
  _ReceiveDataState createState() => _ReceiveDataState();
}

class _ReceiveDataState extends State<ReceiveData> {
  late BluetoothCharacteristic characteristic;
  late BluetoothCharacteristic notifyCharacteristic;

  final BService _bluetoothService = BService();

  String _message = '';

  @override
  void initState() {
    super.initState();
    _getBluetoothData();
  }

  Future<void> _getBluetoothData() async {
    try {
      // get connected Bluetooth device from BService class
      BluetoothDevice device = await _bluetoothService.getConnectedDevice();
      _getServiceAndCharacteristic(device);
    } catch (e) {
      print(e);
    }
  }

  void _getServiceAndCharacteristic(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((char) {
        if (char.uuid.toString() == '2a19') {
          notifyCharacteristic = char;
        }
        if (char.uuid.toString() == '6e400003-b5a3-f393-e0a9-e50e24dcca9e') {
          characteristic = char;
          _listenCharacteristic();
        }
      });
    });

    // Set the notify characteristic to listen for magnetic field detection
    if (notifyCharacteristic != null) {
      await notifyCharacteristic.setNotifyValue(true);
      notifyCharacteristic.value.listen((value) {
        String message = String.fromCharCodes(value);
        if (message == 'Magnetic Field Detected') {
          setState(() {
            _message = 'magnetic detected';
          });
        }
      });
    }
  }

  void _listenCharacteristic() {
    Stream<List<int>> stream = characteristic.lastValueStream;
    if (stream != null) {
      stream.listen((value) {
        String message = String.fromCharCodes(value);
        if (message == 'Magnetic Field Detected') {
          setState(() {
            _message = 'magnetic detected';
          });
        }
      });
    }
  }

  void _handleCheckButtonPressed() {
    if (_message == 'magnetic detected') {
      setState(() {
        // Set the flag to true when the Check button is pressed
        _showAnimation = true;
      });
    }
  }

  bool _showAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESP32 Bluetooth Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _handleCheckButtonPressed();
                // Handle button press here
              },
              child: Text('Check'),
            ),
            if (_showAnimation)
              Lottie.asset(
                'assets/completed.json',
                width: 200,
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
