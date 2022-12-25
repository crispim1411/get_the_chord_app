import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_chord_app/views/chord_dictionary.dart';
import 'package:get_chord_app/views/info.dart';
import 'views/form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Get the Chord',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow[300],
          foregroundColor: Colors.black,
        ),
        primaryColor: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const FormPage(),
        '/dict': (_) => const DictChordPage(),
        '/about': (_) => const InfoPage()
      },
    );
  }
  // [X] routes
  // [] theme colors
  // [] uncople logic from view
  // [] Model - View - Presenter
  // [] unitary tests
}
