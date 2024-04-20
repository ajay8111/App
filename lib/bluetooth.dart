import 'dart:async';
import 'package:flutter_blue/flutter_blue.dart';

class BService {
  final FlutterBlue _flutterBlue = FlutterBlue.instance;
  StreamSubscription<List<ScanResult>>? _scanSubscription;
  BluetoothDevice? _connectedDevice;

  // List to store scanned devices
  List<BluetoothDevice> _scannedDevices = [];
  List<BluetoothDevice> get scannedDevices => _scannedDevices;

  // Stream controller for scanned devices
  final StreamController<List<BluetoothDevice>> _scannedDevicesController =
      StreamController<List<BluetoothDevice>>.broadcast();
  Stream<List<BluetoothDevice>> get scannedDevicesStream =>
      _scannedDevicesController.stream;

  // Stream controller for connected device
  final StreamController<BluetoothDevice> _connectedDeviceController =
      StreamController<BluetoothDevice>.broadcast();
  Stream<BluetoothDevice> get connectedDeviceStream =>
      _connectedDeviceController.stream;

  // Method to start scanning for devices
  void startScanning() {
    _scanSubscription = _flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (!_scannedDevices.contains(result.device)) {
          _scannedDevices.add(result.device);
          _scannedDevicesController.add(_scannedDevices); // Update scanned devices stream
        }
      }
    });
    _flutterBlue.startScan();
  }

  // Method to stop scanning for devices
  void stopScanning() {
    _flutterBlue.stopScan();
    _scanSubscription?.cancel();
  }

  // Method to connect to a device
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      _connectedDevice = device;
      _connectedDeviceController.add(device);
      _scannedDevicesController.add(_scannedDevices); // Update scanned devices stream
      print('Connected to ${device.name}');
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  // Method to disconnect from the connected device
  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    try {
      await device.disconnect();
      _connectedDevice = null; // Clear the connected device
      _connectedDeviceController.addError('Disconnected');
      print('Disconnected from device');
    } catch (e) {
      print('Error disconnecting from device: $e');
    }
  }

  // Method to retrieve the list of connected devices
  Future<List<BluetoothDevice>> getConnectedDevices() async {
    try {
      List<BluetoothDevice> connectedDevices = await _flutterBlue.connectedDevices;
      return connectedDevices;
    } catch (e) {
      print('Error retrieving connected devices: $e');
      return [];
    }
  }

  // Getter for connectedDevice
  BluetoothDevice? get connectedDevice => _connectedDevice;
}
