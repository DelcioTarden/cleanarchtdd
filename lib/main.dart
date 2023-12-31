import 'package:flutter/material.dart';

import 'core/Screens/splash_screen.dart';
import 'core/services/app_service.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture TDD',
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      navigatorKey: AppService.instance.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
  
}