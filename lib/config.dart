import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Config {
  static const appName = 'Get the Chord';
  static const appDescription =
      'Quando está lendo uma partitura ou tablatura consegue ler as notas mas '
      'sente dificuldades em identificar o acorde resultante? \nPois seus '
      'problemas acabaram!';
  static const githubUrl = 'https://github.com/crispim1411/get_the_chord_app';
  static final appIcon = Image.asset('assets/images/app_icon.png');
  static late final PackageInfo kPackageInfo;
}
