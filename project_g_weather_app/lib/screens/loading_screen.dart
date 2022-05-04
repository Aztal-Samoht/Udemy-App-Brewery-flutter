import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:clima/widgets/my_options.dart';
import 'dart:convert' as convert;

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
    var url = Uri.https('samples.openweathermap.org', '/data/2.5/weather', {
      'lat': '35',
      'lon': '139',
      'appid': 'b6907d289e10d714a6e88b30761fae22'
    });
    var response = await http.get(url);
    // path:
    //     'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'));

    // print(response.statusCode);
    String data = response.body;
    var convertedData = convert.jsonDecode(data);
    // convertedData.forEach((x, y) {
    //   print(x.toString() + ': ' + y.toString());
    // });
    double temp = convertedData['main']['temp'];
    String city = convertedData['name'];
    int condition = convertedData['weather'][0]['id'];
    print(convertedData['coord']['lat']);
    print('the current weather in london is: ' +
        convertedData['weather'][0]['description']);
    print(temp.toString() + 'Kalvin\n' + city + '\n' + condition.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Options(
      requestPermission: doRequestPermission,
      updateStatus: doUpdateStatus,
      toggle: doToggle,
      printWeather1: getWeather,
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
