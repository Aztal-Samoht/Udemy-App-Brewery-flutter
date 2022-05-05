import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Location() {
    _obtainPossition();
  }
  Position _here;

  void _obtainPossition() async {
    this._here = await Geolocator.getCurrentPosition();
  }

  double getLatidude() {
    return this._here.latitude;
  }

  double getlongitude() {
    return this._here.longitude;
  }

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
    await _setLocationIsEnabled();
    await _setPermission();
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
    _debugmode
        ? print('DEBUG -- !_locationIsEnabled => ' +
            (!_locationIsEnabled).toString())
        : _blank = '';
    if (!_locationIsEnabled) {
      throw Exception('location is not enabled');
    }
    _debugmode
        ? print('DEBUG -- !_hasPermission => ' + (!_hasPermission).toString())
        : _blank = '';
    if (_hasPermission == null) {
      throw Exception('permission is not granted');
    }
  }

  static void _setLocationIsEnabled() async {
    _debugmode ? print('INFO -- asking if service is avalable') : _blank = '';
    _locationIsEnabled = await Geolocator.isLocationServiceEnabled();
    _debugmode
        ? print('DEBUG -- _locationIsEnabled: ' + _locationIsEnabled.toString())
        : _blank = '';
  }

  static void _setPermission() async {
    _debugmode ? print('INFO -- asking for permission status') : _blank = '';
    _permission = await Geolocator.checkPermission();
    _debugmode
        ? print('DEBUG -- _permission: ' + _permission.toString())
        : _blank = '';
  }

  static Future<Position> staticGetLocation() async {
    _debugmode ? print('INFO -- trying to get location') : _blank = '';
    try {
      await _fillVars();
      // await _setLocationIsEnabled();
      // _setPermission();
      // _setHasPermission();
      _checkPermissions();
      _debugmode
          ? print('INFO -- getting position via giolocator')
          : _blank = '';
      return await Geolocator.getCurrentPosition();
      _debugmode ? print('INFO -- printing position') : _blank = '';
    } catch (e) {
      print("could not get location becaus:");
      print(e);
    }
  }

  static void printPossition() async {
    _debugmode ? print('INFO -- printing coordinates') : _blank = '';
    print(await staticGetLocation());
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
