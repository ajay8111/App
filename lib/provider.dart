import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceProvider extends ChangeNotifier {
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
