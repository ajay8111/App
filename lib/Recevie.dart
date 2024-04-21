import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ReceiveData extends StatefulWidget {
  @override
  _ReceiveDataState createState() => _ReceiveDataState();
}

class _ReceiveDataState extends State<ReceiveData> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice; // Nullable
  BluetoothCharacteristic? characteristic; // Nullable
  String receivedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (connectedDevice != null)
              Text(
                connectedDevice!.name,
                style: TextStyle(fontSize: 24),
              ),
            SizedBox(height: 20),
            Text(
              receivedData,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    connectToDevice();
  }

  void connectToDevice() async {
    // Start scanning for devices
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // Listen for scan results
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      // Do something with scan results
      for (ScanResult result in results) {
        if (result.device.name == "ESP32 Server") {
          print('Found device: ${result.device.name}');
          setState(() {
            connectedDevice = result.device;
          });
          connectToDeviceAndDiscoverServices(result.device);
          return; // Exit the loop after finding the device
        }
      }
    });
  }

  void connectToDeviceAndDiscoverServices(BluetoothDevice device) async {
    // Stop scanning
    flutterBlue.stopScan();

    // Connect to the device
    await device.connect();

    // Discover services and characteristics
    List<BluetoothService> services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic c in service.characteristics) {
        if (c.uuid.toString() == "00002a19-0000-1000-8000-00805f9b34fb") {
          characteristic = c;
          break;
        }
      }
    }

    // Start listening for notifications
    if (characteristic != null) {
      await characteristic!.setNotifyValue(true);
      characteristic!.value.listen((value) {
        // Handle received data from ESP32
        String data = String.fromCharCodes(value);
        setState(() {
          receivedData = data;
        });
        print('Received data from ESP32: $data');
      });
    }
  }
}
