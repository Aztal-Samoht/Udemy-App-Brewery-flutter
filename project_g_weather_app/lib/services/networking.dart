import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
}
//
// static
//
// static double getTemp(dynamic data) {
// return data['main']['temp'];
// }
//
// static String getCity(dynamic data) {
// return data['name'];
// }
//
// static int getCondition(dynamic data) {
// return data['weather'][0]['id'];
// }
