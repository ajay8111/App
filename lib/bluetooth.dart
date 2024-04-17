import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class LoginPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<LoginPage> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  StreamSubscription<List<ScanResult>>? scanSubscription;
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? writeCharacteristic;
  BluetoothCharacteristic? notifyCharacteristic; // Added notifyCharacteristic
  List<BluetoothDevice> devices = []; // Declaration of devices list

  TextEditingController textEditingController = TextEditingController();
  String receivedData = ''; // Added to store received data

  @override
  void initState() {
    super.initState();
    // Check if there is already a connected device
    flutterBlue.connectedDevices.then((List<BluetoothDevice> connectedDevices) {
      if (connectedDevices.isNotEmpty) {
        setState(() {
          connectedDevice = connectedDevices.first;
        });
        discoverServices(connectedDevice!);
      } else {
        scanForDevices();
      }
    });
  }

  @override
  void dispose() {
    scanSubscription?.cancel();
    super.dispose();
  }

  void scanForDevices() {
    scanSubscription = flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (!devices.contains(result.device)) {
          setState(() {
            devices.add(result.device);
          });
        }
      }
    });
    flutterBlue.startScan();
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      discoverServices(device);
      setState(() {
        connectedDevice = device;
      });
      print('Connected to ${device.name}');
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  Future<void> discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((characteristic) {
        if (characteristic.properties.write) {
          writeCharacteristic = characteristic;
        }
        // Check if characteristic supports notify
        if (characteristic.properties.notify) {
          notifyCharacteristic = characteristic;
          notifyCharacteristic!.setNotifyValue(true); // Enable notifications
          notifyCharacteristic!.value.listen((data) {
            setState(() {
              receivedData = String.fromCharCodes(data);
            });
          });
        }
      });
    });
  }

  Future<void> disconnectFromDevice() async {
    if (connectedDevice != null) {
      await connectedDevice!.disconnect();
      setState(() {
        connectedDevice = null;
      });
      print('Disconnected from device');
    }
  }

  Future<void> sendDataToDevice(String data) async {
    if (connectedDevice != null && writeCharacteristic != null) {
      List<int> bytes = data.codeUnits;
      await writeCharacteristic!.write(bytes);
      print('Data sent to device: $data');
    } else {
      print('Not connected to any device or write characteristic not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Demo'),
      ),
      body: Column(
        children: [
          connectedDevice != null
              ? Text('Connected to: ${connectedDevice!.name}')
              : Text('Not connected'),
          ElevatedButton(
            onPressed: connectedDevice != null
                ? () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Disconnect from ${connectedDevice!.name}?'),
                          content: Text('Are you sure you want to disconnect?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                disconnectFromDevice();
                                Navigator.of(context).pop();
                              },
                              child: Text('Disconnect'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                : null,
            child: Text('Disconnect'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Enter text to send'),
                    content: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(hintText: 'Enter text'),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          sendDataToDevice(textEditingController.text);
                          Navigator.of(context).pop();
                        },
                        child: Text('Send'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Send Text'),
          ),
          Text(receivedData), // Display received data
          Expanded(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(devices[index].name),
                  subtitle: Text(devices[index].id.toString()),
                  onTap: () => connectToDevice(devices[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
