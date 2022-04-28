import 'package:flutter/material.dart';

ThemeData myBMItheme() {
  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark().copyWith(
      primary: Color(0xff0a0e21),
    ),
    scaffoldBackgroundColor: Color(0xff0a0e21),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.green),
      bodyText2: TextStyle(color: Colors.white),
    ),
  );
}

// ThemeData customLightTheme() {
//   TextTheme _customLightThemesTextTheme(TextTheme base) {
//     return base.copyWith(
//       headline1: base.headline1.copyWith(
//         fontFamily: 'Roboto',
//         fontSize: 30.0,
//         color: Colors.green,
//       ),
//       headline6: base.headline6.copyWith(fontSize: 15.0, color: Colors.orange),
//       headline4: base.headline1.copyWith(
//         fontSize: 32.0,
//         color: Colors.white,
//       ),
//       headline3: base.headline1.copyWith(
//         fontSize: 30.0,
//         color: Colors.grey,
//       ),
//       caption: base.caption.copyWith(
//         color: Color(0xFFCCC5AF),
//       ),
//       bodyText2: base.bodyText2.copyWith(color: Color(0xFF807A6B)),
//       bodyText1: base.bodyText1.copyWith(color: Colors.brown),
//     );
//   }
//
//   final ThemeData lightTheme = ThemeData.light();
//   return lightTheme.copyWith(
//     textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
//     colorScheme: ColorScheme.light().copyWith(
//       primary: Color(0xffce107c),
//       secondary: Color(0xFFFFF8E1),
//     ),
//     indicatorColor: Color(0xFF807A6B),
//     scaffoldBackgroundColor: Color(0xFFF5F5F5),
//     primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
//       color: Colors.white,
//       size: 20,
//     ),
//     iconTheme: lightTheme.iconTheme.copyWith(
//       color: Colors.white,
//     ),
//     buttonColor: Colors.white,
//     backgroundColor: Colors.white,
//     tabBarTheme: lightTheme.tabBarTheme.copyWith(
//       labelColor: Color(0xffce107c),
//       unselectedLabelColor: Colors.grey,
//     ),
//     buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Colors.red),
//     cursorColor: Colors.deepPurple,
//     errorColor: Colors.red,
//   );
// }

// ThemeData customDarkTheme() {
//   final ThemeData darkTheme = ThemeData.dark();
//   return darkTheme.copyWith(
//     primaryColor: Colors.black38,
//     indicatorColor: Color(0xFF807A6B),
//     accentColor: Color(0xFFFFF8E1),
//     primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
//       color: Colors.green,
//       size: 20,
//     ),
//     cursorColor: Colors.green,
//   );
// }
