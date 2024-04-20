import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart'; // Import provider package
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BluetoothManager(), // Provide BluetoothManager at the root of your app
      child: MaterialApp(
        title: 'Your App',
        home: BluetoothManagePage(),
      ),
    ),
  );
}


class BluetoothManager extends ChangeNotifier {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devicesList = [];
  BluetoothDevice? connectedDevice;
  bool isScanning = false;

  BluetoothManager() {
    // Start scanning for devices when the manager is initialized
    startScan();
  }

  void startScan() {
    isScanning = true;
    devicesList.clear(); // Clear previous list of devices
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (!devicesList.contains(result.device)) {
          devicesList.add(result.device); // Update the devices list
        }
      }
      notifyListeners();
    });
    // Stop scanning after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      flutterBlue.stopScan();
      isScanning = false;
      notifyListeners();
    });
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    // Connect to the selected device
    try {
      await device.connect();
      connectedDevice = device;
      notifyListeners();
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }
}

class BluetoothManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Devices'),
      ),
      body: Consumer<BluetoothManager>(
        builder: (context, manager, child) {
          return Column(
            children: [
              manager.isScanning
                  ? LinearProgressIndicator()
                  : SizedBox(),
              Expanded(
                child: ListView.builder(
                  itemCount: manager.devicesList.length,
                  itemBuilder: (context, index) {
                    BluetoothDevice device = manager.devicesList[index];
                    return ListTile(
                      title: Text(device.name ?? 'Unknown Device'),
                      subtitle: Text(device.id.toString()),
                      onTap: () {
                        manager.connectToDevice(device);
                      },
                    );
                  },
                ),
              ),
              manager.connectedDevice != null
                  ? Text('Connected to: ${manager.connectedDevice!.name}')
                  : SizedBox(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<BluetoothManager>(context, listen: false).startScan();
        },
        child: Icon(Icons.bluetooth_searching),
      ),
    );
  }
}
