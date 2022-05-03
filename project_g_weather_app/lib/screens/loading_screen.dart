import 'package:clima/services/location.dart';
import 'package:clima/widgets/status_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('getting location');
    Location.printPossition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatusText(
              enabled: Location.getLocationIsEnabled(),
              permission: Location.getPermission(),
              debug: Location.getDebugmode()),
          TextButton(
            child: Text('request permission'),
            onPressed: () {
              setState(() {
                Geolocator.requestPermission();
                Location.printPossition();
              });
            },
          ),
          TextButton(
            child: Text('update status'),
            onPressed: () {
              setState(() {
                Location.updateStatus();
              });
            },
          ),
          TextButton(
            child: Text('Get Location'),
            onPressed: () {
              Location.printPossition();
            },
          ),
          TextButton(
            child: Text('toggle debug'),
            onPressed: () {
              setState(() {
                Location.toggleDebugmode();
                Location.updateStatus();
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
