import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothScanner extends StatefulWidget {
  @override
  _BluetoothScannerState createState() => _BluetoothScannerState();
}

class _BluetoothScannerState extends State<BluetoothScanner> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devices = [];
  Map<BluetoothDevice, bool> connectedDevices = {};
  Map<BluetoothDevice, bool> connectingDevices = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bluetooth Scanner',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'ProtestRiot',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade500],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  if (await flutterBlue.isOn) {
                    scanForDevices();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Bluetooth Not Enabled'),
                        content: Text('Please enable Bluetooth and try again.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text(
                  'Scan for Devices',
                  style: TextStyle(fontSize: 15, fontFamily: 'ProtestRiot'),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text(
                devices.isEmpty ? 'No devices found' : 'Devices:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'ProtestRiot',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      elevation: 4.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text(devices[index].name ?? 'Unknown Device'),
                        subtitle: Text(devices[index].id.id),
                        trailing: _buildTrailingWidget(devices[index]),
                        onTap: () {
                          connectToDevice(devices[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrailingWidget(BluetoothDevice device) {
    final bool isConnecting = connectingDevices.containsKey(device) ? connectingDevices[device]! : false;
    final bool isConnected = connectedDevices.containsKey(device) ? connectedDevices[device]! : false;

    if (isConnecting) {
      return CircularProgressIndicator();
    } else if (isConnected) {
      return Text('Connected', style: TextStyle(color: Colors.green));
    } else {
      return Text('Not Connected', style: TextStyle(color: Colors.red));
    }
  }

  void scanForDevices() {
    setState(() {
      devices.clear();
    });

    flutterBlue.startScan(timeout: Duration(seconds: 4));

    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (!devices.contains(result.device)) {
          setState(() {
            devices.add(result.device);
          });
        }
      }
    });

    flutterBlue.stopScan();
  }

  void connectToDevice(BluetoothDevice device) async {
    setState(() {
      connectingDevices[device] = true;
    });

    try {
      await device.connect();
      setState(() {
        connectedDevices[device] = true;
      });
      print('Connected to ${device.name}');
    } catch (e) {
      print('Error connecting to device: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Connection Error'),
          content: Text('Could not connect to the device. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        connectingDevices[device] = false;
      });
    }
  }

  @override
  void dispose() {
    flutterBlue.stopScan();
    super.dispose();
  }
}
