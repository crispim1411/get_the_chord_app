import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: Container(
        key: const Key('AboutPage'),
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.white, Colors.blue.shade100])),
        child: Column(
          children: <Widget>[
            const Spacer(),
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                    image: AssetImage('assets/images/app_icon.png'))),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                  'Quando está lendo uma partitura ou tablatura sente dificuldades '
                  'em identificar o acorde resultante? Pois seus problemas acabaram!',
                  style: TextStyle(fontSize: 20)),
            ),
            const Spacer(flex: 2),
            const Text('- Crispim Corporations -',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
