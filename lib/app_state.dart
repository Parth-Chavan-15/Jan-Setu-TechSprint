import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _disclaimerAccepted = false;
  bool get disclaimerAccepted => _disclaimerAccepted;
  set disclaimerAccepted(bool value) {
    _disclaimerAccepted = value;
  }
}
