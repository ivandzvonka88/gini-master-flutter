import 'package:flutter/material.dart';
import 'package:gini/components/authentication/status/status.dart';
import 'package:gini/theme/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AngelinaApp extends StatelessWidget {
  AngelinaApp({@required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightTheme(),
        home: AuthStatus(sharedPreferences: sharedPreferences),
        debugShowCheckedModeBanner: false);
  }
}
