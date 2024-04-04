import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothScanner extends StatefulWidget {
  const BluetoothScanner({Key? key}) : super(key: key);

  @override
  _BluetoothScannerState createState() => _BluetoothScannerState();
}

class _BluetoothScannerState extends State<BluetoothScanner> {
  bool _isScanning = false;
  final FlutterBluePlus flutterBluePlus = FlutterBluePlus();
  List<BluetoothDeviceWithStatus> _discoveredDevices = [];
  String _connectedDeviceId = ''; // Declare _connectedDeviceId here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Bluetooth',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: _toggleScanning,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isScanning
                        ? const Color(0xFFFF006E)
                        : const Color(0xFF8338EC),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _isScanning ? 'Stop Scanning' : 'Start Scanning',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: _buildDeviceList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceList() {
    if (_isScanning) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (_discoveredDevices.isEmpty) {
        return Center(
          child: Text(
            'No Bluetooth devices found.',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        );
      } else {
        return ListView.builder(
          itemCount: _discoveredDevices.length,
          itemBuilder: (context, index) {
            final device = _discoveredDevices[index].device;
            // Check if device name is not empty
            if (device.name.isNotEmpty) {
              return ListTile(
                title: Text(
                  device.name,
                  style: TextStyle(
                    color: device.remoteId.str == _connectedDeviceId
                        ? Colors.blue
                        : Colors.black,
                  ),
                ),
                subtitle: Text(device.remoteId.str),
                onTap: () async {
                  try {
                    if (device.remoteId.str == _connectedDeviceId) {
                      await device.disconnect();
                      setState(() {
                        _connectedDeviceId = '';
                        updateStatus(false);
                      });
                      print('disconnect successful');
                    } else {
                      await device.connect();
                      print('Connected to device: ${device.name}');
                      updateStatus(true);
                      setState(() {
                        _connectedDeviceId = device.remoteId.str;
                      });
                    }
                  } catch (e) {
                    print('Connection error: $e');
                  }
                },
              );
            } else {
              // Display "Unknown Device" for devices with empty names
              return ListTile(
                title: Text(
                  'Unknown Device',
                  style: TextStyle(
                    color: device.remoteId.str == _connectedDeviceId
                        ? Colors.blue
                        : Colors.black,
                  ),
                ),
                subtitle: Text(device.remoteId.str),
                onTap: () async {
                  try {
                    if (device.remoteId.str == _connectedDeviceId) {
                      await device.disconnect();
                      setState(() {
                        _connectedDeviceId = '';
                        updateStatus(false);
                      });
                      print('disconnect successful');
                    } else {
                      await device.connect();
                      print('Connected to device: Unknown Device');
                      updateStatus(true);
                      setState(() {
                        _connectedDeviceId = device.remoteId.str;
                      });
                    }
                  } catch (e) {
                    print('Connection error: $e');
                  }
                },
              );
            }
          },
        );
      }
    }
  }

  void _toggleScanning() {
    setState(() {
      _isScanning = !_isScanning;
    });

    if (_isScanning) {
      _startScanning();
    } else {
      _stopScanning();
    }
  }

  Future<void> _startScanning() async {
    _discoveredDevices.clear();

    await _requestBluetoothPermission();

    print("Scanning started...");
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 30)); 

    StreamSubscription<List<ScanResult>>? subscription;
    subscription = FlutterBluePlus.scanResults.listen((List<ScanResult> scanResults) {
      setState(() {
        _discoveredDevices = scanResults
            .where((result) => result.device.name.isNotEmpty) 
            .map((result) => BluetoothDeviceWithStatus(device: result.device))
            .toList();
      });
    }, onError: (error) {
      print("Error during scanning: $error");
      subscription!.cancel();
    });

    await Future.delayed(const Duration(seconds: 10));
    FlutterBluePlus.stopScan(); 
    setState(() {
      _isScanning = false;
    });
    subscription!.cancel();
  }

  void _stopScanning() {
    FlutterBluePlus.stopScan(); 
    setState(() {
      _isScanning = false;
    });
  }

  void _connectToDevice(BluetoothDevice device) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Connecting to ${device.name ?? 'Unknown Device'}...'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );

    device.connect().then((_) {
      Navigator.pop(context);
      setState(() {
        final index = _discoveredDevices
            .indexWhere((element) => element.device.id == device.id);
        if (index != -1) {
          _discoveredDevices[index].isConnected = true;
        }
      });
      print('Connected to ${device.name}');
      // Navigate to next screen or perform other actions after connection
    }).catchError((error) {
      Navigator.pop(context);
      print('Error connecting to ${device.name}: $error');
    });
  }

  Future<void> _requestBluetoothPermission() async {
    if (!await Permission.bluetoothScan.isGranted) {
      await Permission.bluetoothScan.request();
    }
  }

  // Placeholder updateStatus function
  void updateStatus(bool status) {
    // Implement your logic here
  }
}

class BluetoothDeviceWithStatus {
  final BluetoothDevice device;
  bool isConnected;

  BluetoothDeviceWithStatus({required this.device, this.isConnected = false});
}

void main() {
  runApp(const MaterialApp(
    home: BluetoothScanner(),
  ));
}