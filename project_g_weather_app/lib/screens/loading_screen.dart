import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:clima/widgets/options.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location currentLocation = Location();
  @override
  void initState() {
    super.initState();
    currentLocation.getLocation();
    print('getting location');
    Location.printPossition();
  }

  void getWeather() async {
    Response response = await get(
        Uri(path: 'api.openweathermap.org/data/2.5/weather?q=London'));
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Options(
      requestPermission: doRequestPermission,
      updateStatus: doUpdateStatus,
      toggle: doToggle,
    ));
  }

  void doRequestPermission() {
    setState(() {
      Geolocator.requestPermission();
      Location.printPossition();
    });
  }

  void doUpdateStatus() {
    setState(() {
      Location.updateStatus();
    });
  }

  void doToggle() {
    setState(() {
      Location.toggleDebugmode();
      Location.updateStatus();
    });
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
