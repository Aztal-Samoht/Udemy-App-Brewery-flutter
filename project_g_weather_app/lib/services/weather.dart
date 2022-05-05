import 'package:clima/utilities/constants.dart';
import 'package:clima/services/location.dart';
import 'networking.dart';

class WeatherModel {
  static Future<dynamic> getLocationWeatherData() async {
    Location location = Location();
    await location.getLocation();
    Uri url = buildLocationUrl(location);
    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  static Future<dynamic> getLocationWeatherDataFor(String typedName) async {
    Uri url = buildCityUrl(typedName);
    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  static Uri buildLocationUrl(Location x) {
    return Uri.https(kAthority, kPath, {
      'lat': x.getLatidude().toString(),
      'lon': x.getlongitude().toString(),
      'units': 'metric',
      'appid': kApiKey
    });
  }

  static Uri buildCityUrl(String cityName) {
    return Uri.https(
        kAthority, kPath, {'q': cityName, 'units': 'metric', 'appid': kApiKey});
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
