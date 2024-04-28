import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceProvider with ChangeNotifier {
  BluetoothDevice? _connectedDevice;

  BluetoothDevice? get connectedDevice => _connectedDevice;

  void setConnectedDevice(BluetoothDevice device) {
    _connectedDevice = device;
    notifyListeners();
  }

  void clearConnectedDevice() {
    _connectedDevice = null;
    notifyListeners();
  }
}
