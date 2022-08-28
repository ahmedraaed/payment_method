import 'package:flutter/material.dart';
import 'package:payment/network/dio_helper.dart';
import 'package:payment/screens/kiosk.dart';
import 'package:payment/screens/registers.dart';
import 'package:payment/screens/toggel_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:RegisterScreen() ,
    );
  }
}

