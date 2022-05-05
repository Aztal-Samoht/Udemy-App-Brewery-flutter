import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:clima/utilities/constants.dart';

class NetworkHelper {
  static Future<dynamic> getData(Uri url) async {
    var response = await http.get(url);
    return convert.jsonDecode(response.body);
  }

  static double getTemp(dynamic data) {
    return data['main']['temp'];
  }

  static String getCity(dynamic data) {
    return data['name'];
  }

  static int getCondition(dynamic data) {
    return data['weather'][0]['id'];
  }
}
