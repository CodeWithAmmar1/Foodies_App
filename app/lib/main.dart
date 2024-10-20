import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/HomeScreens/home_screen.dart';
import 'package:app/HomeScreens/navbar.dart';
import 'package:app/Login&Signup/login.dart';

import 'package:app/firebase_options.dart';
import 'package:app/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
