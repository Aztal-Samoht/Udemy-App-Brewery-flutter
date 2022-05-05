import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Location.printPossition();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();
    Uri url = buildUrl(location);
    NetworkHelper networkHelper = NetworkHelper(url);
    dynamic weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  Uri buildUrl(Location x) {
    return Uri.https(kAthority, kPath, {
      'lat': x.getLatidude().toString(),
      'lon': x.getlongitude().toString(),
      'appid': kApiKey
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
