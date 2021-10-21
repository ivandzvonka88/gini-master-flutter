import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gini/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(AngelinaApp(sharedPreferences: sharedPreferences));
}
