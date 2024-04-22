import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BService {
  StreamSubscription<List<ScanResult>>? _scanSubscription;
  BluetoothDevice? _connectedDevice;
  bool _isConnected = false;

  List<BluetoothDevice> _scannedDevices = [];
  List<BluetoothDevice> get scannedDevices => _scannedDevices;

  final StreamController<List<BluetoothDevice>> _scannedDevicesController =
      StreamController<List<BluetoothDevice>>.broadcast();
  Stream<List<BluetoothDevice>> get scannedDevicesStream =>
      _scannedDevicesController.stream;

  final StreamController<BluetoothDevice> _connectedDeviceController =
      StreamController<BluetoothDevice>.broadcast();
  Stream<BluetoothDevice> get connectedDeviceStream =>
      _connectedDeviceController.stream;

  // Add a stream controller and a stream getter for received data
  final StreamController<String> _dataStreamController =
      StreamController<String>.broadcast();
  Stream<String> get dataStream => _dataStreamController.stream;

  bool get isConnected => _isConnected;

  set isConnected(bool value) {
    _isConnected = value;
  }

  void startScanning() {
    _scanSubscription = FlutterBluePlus.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (!_scannedDevices.contains(result.device)) {
          _scannedDevices.add(result.device);
          _scannedDevicesController.add(_scannedDevices);
        }
      }
    });
    FlutterBluePlus.startScan();
  }

  void stopScanning() {
    FlutterBluePlus.stopScan();
    _scanSubscription?.cancel();
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      _connectedDevice = device;
      _connectedDeviceController.add(device);
      _scannedDevicesController.add(_scannedDevices);
      print('Connected to ${device.name}');
      isConnected = true; // Set isConnected to true
      _startListeningForData(); // Start listening for data after connecting
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    try {
      await device.disconnect();
      _connectedDevice = null;
      _connectedDeviceController.addError('Disconnected');
      isConnected = false; // Set isConnected to false
      print('Disconnected from device');
    } catch (e) {
      print('Error disconnecting from device: $e');
    }
  }

  Future<void> _startListeningForData() async {
    try {
      if (_connectedDevice != null) {
        // Get the services of the connected device
        List<BluetoothService> services = await _connectedDevice!.discoverServices();
        for (BluetoothService service in services) {
          // Find the characteristic that corresponds to receiving data
          for (BluetoothCharacteristic characteristic in service.characteristics) {
            // Adjust the UUID to match your receiving characteristic
            if (characteristic.uuid.toString() == "YOUR_RECEIVE_CHARACTERISTIC_UUID") {
              // Listen for notifications from this characteristic
              characteristic.setNotifyValue(true);
              characteristic.value.listen((value) {
                // Convert the received value to a string
                String receivedData = String.fromCharCodes(value);
                // Add the received data to the data stream
                _dataStreamController.add(receivedData);
              });
            }
          }
        }
      }
    } catch (e) {
      print('Error starting to listen for data: $e');
    }
  }

  void sendData(String data) {
    if (_connectedDevice != null) {
      _connectedDevice!.discoverServices().then((services) {
        services.forEach((service) {
          service.characteristics.forEach((characteristic) {
            // Adjust the UUID to match your sending characteristic
            if (characteristic.uuid.toString() == "00002A19-0000-1000-8000-00805F9B34FB") {
              // Write data to the characteristic
              characteristic.write(data.codeUnits);
            }
          });
        });
      });
    }
  }

  BluetoothDevice? get connectedDevice => _connectedDevice;
}
