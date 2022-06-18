import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get the chord',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  final List<String> _notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  final Map<int, String> _selectedNotes = {};
  int _rowsCounter = 3;

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
            padding: const EdgeInsets.only(right: 10),
            onPressed: () {
              setState(() {
                _selectedNotes.clear();
                _rowsCounter = 3;
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
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
            visible: _rowsCounter > 3 ? false : true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child:
                      const Icon(Icons.add_box, size: 30, color: Colors.green),
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
          // Chord
          OutlinedButton(
            onPressed: _selectedNotes.length < 3
                ? null
                : () {
                    print('Search for chord with notes: $_selectedNotes');
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.search, size: 30, color: Colors.black),
                Padding(padding: EdgeInsets.all(10)),
                Text('Find the chord'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget notesComboBox(int index) {
    return DropdownButton(
      items: _notes
          .map((s) => DropdownMenuItem(value: s, child: Text(s)))
          .toList(),
      value: _selectedNotes[index],
      onChanged: (String? note) {
        setState(() {
          _selectedNotes[index] = note.toString();
        });
      },
    );
  }
}
