import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'find_chord.dart';
import 'info.dart';
import 'models/enums.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormPage();
}

class _FormPage extends State<FormPage> {
  final Map<int, Note> _selectedNotes = {};
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
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            padding: const EdgeInsets.all(15),
            onPressed: restoreStatus,
          ),
          IconButton(
            icon: const Icon(Icons.info),
            padding: const EdgeInsets.all(15),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChordInfo()));
            },
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
          itemBuilder: (context, index) => notesSelector(index),
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
    final isEnabled = _selectedNotes.length >= 2;
    return Row(
      children: [
        const Spacer(),
        Container(
          height: 55,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 230, 35, 35)),
            onPressed: isEnabled
                ? () {
                    setState(() {
                      _answer = Scale.getChord(
                          _selectedNotes.values.toSet().toList());
                    });
                  }
                : null,
            child: Text(
              isEnabled ? 'Select the notes' : 'Search the chord',
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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: AutoSizeText(
                _answer,
                maxLines: 1,
                style:
                    const TextStyle(fontSize: 80, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }

  Widget notesSelector(int index) {
    final flatSelected = _selectedNotes[index]?.accidental == Accidental.flat;
    final sharpSelected = _selectedNotes[index]?.accidental == Accidental.sharp;
    return Row(
      children: [
        Expanded(
          child: DropdownButton(
            itemHeight: 60,
            items: Symbol.values
                .map((symbol) => DropdownMenuItem(
                      value: symbol,
                      alignment: AlignmentDirectional.center,
                      child: Text(symbol.toString().split('.').last,
                          style: const TextStyle(fontSize: 25)),
                    ))
                .toList(),
            value: _selectedNotes[index]?.symbol,
            isExpanded: true,
            onChanged: (Symbol? symbol) {
              setState(() {
                _selectedNotes[index] = Note(symbol!, Accidental.normal);
              });
            },
          ),
        ),
        FilterChip(
          label: const Text('b'),
          selected: flatSelected,
          onSelected:
              [Symbol.C, Symbol.F].contains(_selectedNotes[index]?.symbol)
                  ? null
                  : (bool value) {
                      setState(() {
                        _selectedNotes[index]?.accidental =
                            flatSelected ? Accidental.normal : Accidental.flat;
                      });
                    },
        ),
        FilterChip(
          label: const Text('#'),
          selected: sharpSelected,
          onSelected: [Symbol.B, Symbol.E]
                  .contains(_selectedNotes[index]?.symbol)
              ? null
              : (bool value) {
                  setState(() {
                    _selectedNotes[index]?.accidental =
                        sharpSelected ? Accidental.normal : Accidental.sharp;
                  });
                },
        ),
      ],
    );
  }
}
