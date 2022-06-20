import 'package:flutter/material.dart';
import 'find_chord.dart';
import 'models.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get the chord',
      home: MyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  final Map<int, Symbol> _selectedNotes = {};
  int _rowsCounter = 3;
  String _answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.music_note),
        title: const Text('Get the chord'),
        backgroundColor: Colors.yellow[300],
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            padding: const EdgeInsets.only(right: 15),
            onPressed: () {
              setState(() {
                _selectedNotes.clear();
                _rowsCounter = 3;
                _answer = '';
              });
            },
          ),
        ],
      ),
      body: bodyApp(),
    );
  }

  Widget bodyApp() {
    return ListView(padding: const EdgeInsets.all(20), children: <Widget>[
      // Notes
      ListView.builder(
        shrinkWrap: true,
        itemCount: _rowsCounter,
        itemBuilder: (context, index) => notesComboBox(index),
      ),
      // Padding
      const Padding(padding: EdgeInsets.all(10)),
      // Add note row, collapses if 4 notes
      Visibility(
        visible: _rowsCounter > 6 ? false : true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: const Icon(Icons.add_box, size: 30, color: Colors.green),
              onTap: () {
                setState(() {
                  _rowsCounter += 1;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Add note'),
            )
          ],
        ),
      ),
      // Padding
      const Padding(padding: EdgeInsets.all(10)),
      // Chord Button
      Container(
          height: 35,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: OutlinedButton(
              onPressed: _selectedNotes.length < 3
                  ? null
                  : () {
                      setState(() {
                        var notes = <Note>{};
                        _selectedNotes.forEach((key, value) {
                          // consertar duplicados
                          notes.add(Note(value, Accidental.normal));
                        });
                        _answer = Scale.getChord(notes.toList());
                      });
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.search, size: 30, color: Colors.black),
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(_selectedNotes.length < 3
                      ? 'Select the notes'
                      : 'Find the chord'),
                ],
              ))),
      // Padding
      const Padding(padding: EdgeInsets.all(10)),
      // Answer
      Visibility(
          visible: _answer.isEmpty ? false : true,
          child: LimitedBox(
            maxWidth: 30,
            child: Container(
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(_answer)),
          )),
    ]);
  }

  Widget notesComboBox(int index) {
    return DropdownButton(
      items: Symbol.values
          .map((note) => DropdownMenuItem(
                value: note,
                alignment: AlignmentDirectional.center,
                child: Text(note.toString().split('.').last),
              ))
          .toList(),
      value: _selectedNotes[index],
      isExpanded: true,
      onChanged: (Symbol? note) {
        setState(() {
          _selectedNotes[index] = note!;
        });
      },
    );
  }
}
