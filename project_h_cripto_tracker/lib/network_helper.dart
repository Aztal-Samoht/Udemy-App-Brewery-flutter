/*reauires HTTP 0.13.4 to be added to pubspec.yml*/

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'constants.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final Uri url;

  Future<dynamic> getData() async {
    var response = await http.get(this.url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getDatafromURL(Uri uri) async {
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  static Future<dynamic> staticGetData(Uri url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  static Future<dynamic> returnPrice(Uri url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body)['rate'];

      return data;
    } else {
      print(response.statusCode);
    }
    return staticGetData(url);
  }

  static Uri buildUrl(String path, String cur) {
    return Uri.https(kUrlAuth, path + cur, kUrlArgs);
  }
}
