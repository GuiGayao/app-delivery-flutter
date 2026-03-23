import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _XanoAuthToken = prefs.getString('ff_XanoAuthToken') ?? _XanoAuthToken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _respEndPoint;
  dynamic get respEndPoint => _respEndPoint;
  set respEndPoint(dynamic value) {
    _respEndPoint = value;
  }

  dynamic _respEndPointError;
  dynamic get respEndPointError => _respEndPointError;
  set respEndPointError(dynamic value) {
    _respEndPointError = value;
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
  }

  String _XanoAuthToken = '';
  String get XanoAuthToken => _XanoAuthToken;
  set XanoAuthToken(String value) {
    _XanoAuthToken = value;
    prefs.setString('ff_XanoAuthToken', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
