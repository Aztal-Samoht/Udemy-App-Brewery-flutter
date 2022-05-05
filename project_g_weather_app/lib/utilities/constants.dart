import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const String kAthority = 'api.openweathermap.org';
const String kPath = '/data/2.5/weather';
const String kApiKey = '005192781be89e95730673f06a521b2f';
