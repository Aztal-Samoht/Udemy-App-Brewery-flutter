import 'package:clima/widgets/status_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool locationIsEnabled;
  LocationPermission permission;
  bool hasPermission;
  bool debugmode = false;
  var blank = '';
  void _getLocation() async {
    try {
      debugmode ? print('INFO -- trying to get location') : blank = '';
      locationIsEnabled = await Geolocator.isLocationServiceEnabled();
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        hasPermission = true;
      } else {
        hasPermission = false;
      }
      debugmode ? print('INFO -- checking permissions') : blank = '';
      if (!locationIsEnabled) {
        throw Exception('location is not enabled');
      }
      if (!hasPermission) {
        throw Exception('permission is not granted');
      }
      debugmode ? print('INFO -- getting position via giolocator') : blank = '';
      Position position = await Geolocator.getCurrentPosition();
      debugmode ? print('INFO -- printing position') : blank = '';
      print(position);
    } catch (e) {
      print("could not get location becaus'");
      print(e);
    }
  }

  void updateStatus() async {
    locationIsEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      hasPermission = true;
    } else {
      hasPermission = false;
    }
  }

  @override
  void initState() {
    super.initState();
    print('getting location');
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatusText(
              enabled: locationIsEnabled,
              permission: permission,
              debug: debugmode),
          TextButton(
            child: Text('request permission'),
            onPressed: () {
              setState(() {
                Geolocator.requestPermission();
                _getLocation();
              });
            },
          ),
          TextButton(
            child: Text('update status'),
            onPressed: () {
              setState(() {
                updateStatus();
              });
            },
          ),
          TextButton(
            child: Text('Get Location'),
            onPressed: () {
              _getLocation();
            },
          ),
          TextButton(
            child: Text('toggle debug'),
            onPressed: () {
              setState(() {
                debugmode = !debugmode;
                updateStatus();
              });
            },
          ),
        ],
      )),
    );
  }
}

// GEOLOCATION CREATOR DEMO!
// Future<Position> _determinePosition() async {
//   print("function accessed");
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//     return Future.error('Location services are disabled.');
//   }
//
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately.
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//
//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   Position place = await Geolocator.getCurrentPosition();
//   print(place);
//   return place;
// }
