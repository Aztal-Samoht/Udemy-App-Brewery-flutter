import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class StatusText extends StatelessWidget {
  StatusText({this.enabled, this.permission});

  final bool enabled;
  final LocationPermission permission;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('location enabled: ' + enabled.toString()),
      Text('permission: ' + permission.toString())
    ]);
  }
}
