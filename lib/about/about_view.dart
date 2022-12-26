import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import 'package:get_chord_app/config.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: _about(),
    );
  }

  Widget _about() {
    final header = Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: Config.appIcon.image,
                )),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(Config.appName, style: TextStyle(fontSize: 18)),
            Text(
              Config.kPackageInfo.version,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        )
      ],
    );

    final listTiles = [
      const ListTile(title: Text(Config.appDescription)),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.code),
        title: const Text('Source code on GitHub'),
        onTap: () => url_launcher.launchUrl(Uri.parse(Config.githubUrl)),
      ),
      ListTile(
        leading: const Icon(Icons.bug_report),
        title: const Text('Report issue on GitHub'),
        onTap: () =>
            url_launcher.launchUrl(Uri.parse('${Config.githubUrl}/issues')),
      ),
      const ListTile(),
      const ListTile(
        title: Text(
          '- Crispim Corporations -',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      )
    ];

    return ListView(children: [header, ...listTiles]);
  }
}
