import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'bluetooth.dart';

class BPage extends StatefulWidget {
  @override
  _BPageState createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  final BService _bluetoothService = BService();
  List<BluetoothDevice> _connectedDevices = [];
  List<BluetoothDevice> _availableDevices = []; // Update this line

  @override
  void initState() {
    super.initState();
    _startScanning();
    _getConnectedDevices();
  }

  void _startScanning() {
    _bluetoothService.startScanning();
    _bluetoothService.scannedDevicesStream.listen(
      (List<BluetoothDevice> devices) {
        // Update the type of the callback parameter
        setState(() {
          _availableDevices = devices.where((device) {
            // Filter out already connected devices
            return !_connectedDevices
                .any((connectedDevice) => connectedDevice.id == device.id);
          }).toList();
        });
      },
      onError: (error) {
        // Handle errors from the stream, if any
        print('Error in scanning: $error');
      },
    );
  }

  void _getConnectedDevices() async {
    List<BluetoothDevice> connectedDevices =
        await FlutterBluePlus.connectedDevices;
    setState(() {
      _connectedDevices = connectedDevices;
    });
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await _bluetoothService.connectToDevice(device);
    _getConnectedDevices();
  }

  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await _bluetoothService.disconnectFromDevice(device);
    _getConnectedDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect'),
      ),
      body: Column(
        children: [
          Text(
            'Connected Devices',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _connectedDevices.length,
              itemBuilder: (context, index) {
                final device = _connectedDevices[index];
                return ListTile(
                  title: Text(device.name),
                  subtitle: Text(device.id.toString()),
                  trailing: ElevatedButton(
                    onPressed: () => disconnectFromDevice(device),
                    child: Text('Disconnect'),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Text(
            'Available Devices',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _availableDevices.length,
              itemBuilder: (context, index) {
                final device = _availableDevices[index]; // Update this line
                return ListTile(
                  title: Text(device.name),
                  subtitle: Text(device.id.toString()),
                  onTap: () => connectToDevice(device),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
