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

  void restoreStatus() {
    setState(() {
      _selectedNotes.clear();
      _rowsCounter = 3;
      _answer = '';
    });
  }

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
            icon: const Icon(Icons.undo),
            padding: const EdgeInsets.only(right: 15),
            onPressed: restoreStatus,
          ),
        ],
      ),
      body: bodyApp(),
    );
  }

  Widget bodyApp() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        // Notes
        ListView.builder(
          shrinkWrap: true,
          itemCount: _rowsCounter,
          itemBuilder: (context, index) => notesComboBox(index),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Visibility(
          visible: _rowsCounter > 3 ? false : true,
          child: addRowButton(),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        searchButton(),
        const Padding(padding: EdgeInsets.all(10)),
        Visibility(
          visible: _answer.isEmpty ? false : true,
          child: answerBox(),
        ),
      ],
    );
  }

  Widget addRowButton() {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(Icons.add, size: 30),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Add row', style: TextStyle(fontSize: 18)),
          )
        ],
      ),
      onTap: () {
        setState(() {
          _rowsCounter += 1;
        });
      },
    );
  }

  Widget searchButton() {
    return Row(
      children: [
        const Spacer(),
        Container(
          height: 55,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 230, 35, 35)),
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
            child: Text(
              _selectedNotes.length < 3
                  ? 'Select the notes'
                  : 'Search the chord',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }

  Widget answerBox() {
    return Row(
      children: [
        const Spacer(),
        Flexible(
          flex: 15,
          child: Container(
            height: 350 - _rowsCounter * 20,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              _answer,
              style: TextStyle(
                  fontSize: _answer.length > 10 ? 30 : 80,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }

  Widget notesComboBox(int index) {
    return DropdownButton(
      itemHeight: 60,
      items: Symbol.values
          .map((note) => DropdownMenuItem(
                value: note,
                alignment: AlignmentDirectional.center,
                child: Text(note.toString().split('.').last,
                    style: const TextStyle(fontSize: 25)),
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
