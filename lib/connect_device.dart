import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'bluetooth.dart';

class BPage extends StatefulWidget {
  @override
  _BPageState createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  final BService _bluetoothService = BService();
  List<BluetoothDevice> _connectedDevices = [];
  List<BluetoothDevice> _availableDevices = [];

  @override
  void initState() {
    super.initState();
    _startScanning();
    _getConnectedDevices();
  }

  void _startScanning() {
    _bluetoothService.startScanning();
    _bluetoothService.scannedDevicesStream.listen((devices) {
      setState(() {
        _availableDevices = devices.where((device) => !_connectedDevices.contains(device)).toList();
      });
    });
  }

  void _getConnectedDevices() async {
    List<BluetoothDevice> connectedDevices = await _bluetoothService.getConnectedDevices();
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
        title: Text('Bluetooth Demo'),
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
                final device = _availableDevices[index];
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
