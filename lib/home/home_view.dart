import 'package:flutter/material.dart';
import 'package:get_chord_app/config.dart';
import 'package:get_chord_app/form/form_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final actionsAppBar = [
      IconButton(
          key: const Key('navDict'),
          icon: const Icon(Icons.menu_book),
          padding: const EdgeInsets.all(10),
          onPressed: () => Navigator.of(context).pushNamed('/dict')),
      IconButton(
        key: const Key('navAbout'),
        icon: const Icon(Icons.info),
        padding: const EdgeInsets.all(10),
        onPressed: () => Navigator.of(context).pushNamed('/about'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.music_note),
        title: const Text(Config.appName),
        actions: actionsAppBar,
      ),
      body: const FormView(),
    );
  }
}
