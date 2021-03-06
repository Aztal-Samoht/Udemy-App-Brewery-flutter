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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
