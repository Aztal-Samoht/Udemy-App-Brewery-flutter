import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  static bool _locationIsEnabled;
  static LocationPermission _permission;
  static bool _hasPermission;
  static bool _debugmode = false;
  static var _blank = '';

  static void updateStatus() async {
    _locationIsEnabled = await Geolocator.isLocationServiceEnabled();
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.always ||
        _permission == LocationPermission.whileInUse) {
      _hasPermission = true;
    } else {
      _hasPermission = false;
    }
  }

  static void _fillVars() async {
    _debugmode ? print('INFO -- asking if service is avalable') : _blank = '';
    _locationIsEnabled = await Geolocator.isLocationServiceEnabled();
    _debugmode ? print('INFO -- asking for permission status') : _blank = '';
    _permission = await Geolocator.checkPermission();
    _setHasPermission();
  }

  static void _setHasPermission() {
    if (_permission == LocationPermission.always ||
        _permission == LocationPermission.whileInUse) {
      _hasPermission = true;
    } else {
      _hasPermission = false;
    }
  }

  static void _checkPermissions() {
    _debugmode ? print('INFO -- checking permissions') : _blank = '';
    if (!_locationIsEnabled) {
      throw Exception('location is not enabled');
    }
    if (!_hasPermission) {
      throw Exception('permission is not granted');
    }
  }

  static Future<Position> getLocation() async {
    _debugmode ? print('INFO -- trying to get location') : _blank = '';
    try {
      _fillVars();
      _debugmode ? print('INFO -- asking if service is avalable') : _blank = '';
      _locationIsEnabled = await Geolocator.isLocationServiceEnabled();
      _debugmode ? print('INFO -- asking for permission status') : _blank = '';
      _permission = await Geolocator.checkPermission();

      _setHasPermission();
      // if (_permission == LocationPermission.always ||
      //     _permission == LocationPermission.whileInUse) {
      //   _hasPermission = true;
      // } else {
      //   _hasPermission = false;
      // }

      _checkPermissions();
      // _debugmode ? print('INFO -- checking permissions') : _blank = '';
      // if (!_locationIsEnabled) {
      //   throw Exception('location is not enabled');
      // }
      // if (!_hasPermission) {
      //   throw Exception('permission is not granted');
      // }

      _debugmode
          ? print('INFO -- getting position via giolocator')
          : _blank = '';
      return await Geolocator.getCurrentPosition();
      _debugmode ? print('INFO -- printing position') : _blank = '';
    } catch (e) {
      print("could not get location becaus'");
      print(e);
    }
  }

  static void printPossition() async {
    _debugmode ? print('INFO -- printing coordinates') : _blank = '';
    print(await getLocation());
  }

  static void toggleDebugmode() {
    _debugmode = !_debugmode;
  }

  static bool getLocationIsEnabled() {
    return _locationIsEnabled;
  }

  static LocationPermission getPermission() {
    return _permission;
  }

  static bool getDebugmode() {
    return _debugmode;
  }
}
