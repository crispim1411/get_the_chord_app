import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Get the chord',
      home: const FormPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow[300],
          foregroundColor: Colors.black,
        ),
        primaryColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
