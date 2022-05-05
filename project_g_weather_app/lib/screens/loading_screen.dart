import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() async {
    super.initState();
    Location.printPossition();
    dynamic nextLocation = await getLocationWeather();
    while (nextLocation != null) {
      nextLocation = await getCityWeather(nextLocation);
    }
  }

  Future<dynamic> getLocationWeather() async {
    dynamic weatherData = await WeatherModel.getLocationWeatherData();

    return Navigator.push(
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

  Future<dynamic> getCityWeather(String city) async {
    dynamic weatherData = await WeatherModel.getLocationWeatherDataFor(city);

    return Navigator.push(
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
      'units': 'metric',
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
