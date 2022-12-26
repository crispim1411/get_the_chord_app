import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_chord_app/config.dart';
import 'package:get_chord_app/dictionary/chord_dictionary.dart';
import 'package:get_chord_app/about/about_view.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'form/form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config.kPackageInfo = await PackageInfo.fromPlatform();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Get the Chord',
      theme: _appTheme,
      initialRoute: '/',
      routes: {
        '/': (_) => const FormPage(),
        '/dict': (_) => const DictChordPage(),
        '/about': (_) => const AboutPage()
      },
    );
  }
  // [X] routes
  // [x] theme colors
  // [ ] Model - View - Presenter
  //   [X] Folders
  //   [ ] Decoupling logic from view
  // [ ] unitary tests
  //   [X] pages
  //   [ ] chord search
  //   [ ]
}

final _appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.yellow[300],
    foregroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.indigo,
  ),
  tabBarTheme: const TabBarTheme(labelColor: Colors.black),
);
