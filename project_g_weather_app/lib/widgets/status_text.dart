import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class StatusText extends StatelessWidget {
  StatusText({this.enabled, this.permission, this.debug});

  final bool enabled;
  final LocationPermission permission;
  final bool debug;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('location enabled: ' + enabled.toString()),
      Text('permission: ' + permission.toString()),
      Text('debug mode: ' + debug.toString()),
    ]);
  }
}
