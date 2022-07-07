import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'chord_dictionary.dart';
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
            icon: const Icon(Icons.menu_book),
            padding: const EdgeInsets.all(10),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DictChordPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            padding: const EdgeInsets.all(10),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const InfoPage()));
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
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        // Notes
        ListView.builder(
          shrinkWrap: true,
          itemCount: _rowsCounter,
          itemBuilder: (context, index) => notesSelector(index),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        addRowButton(),
        const Padding(padding: EdgeInsets.all(5)),
        searchButton(),
        const Padding(padding: EdgeInsets.all(10)),
        answerBox(),
      ],
    );
  }

  Widget addRowButton() {
    return Visibility(
      visible: _rowsCounter > 4 ? false : true,
      child: GestureDetector(
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
      ),
    );
  }

  Widget searchButton() {
    final isEnabled = _selectedNotes.length >= 2;
    return Row(
      children: [
        const Spacer(),
        Wrap(
          children: [
            Container(
              height: 55,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                  isEnabled ? 'Pesquisar acorde' : 'Selecione as notas',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                height: 55,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  onPressed: restoreStatus,
                  child: const Text('Limpar', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
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
          child: AnimatedSize(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.bounceOut,
            child: Container(
              height: _answer.isEmpty ? 0 : (350 - _rowsCounter * 30),
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
                  style: const TextStyle(
                      fontSize: 80, fontStyle: FontStyle.italic),
                ),
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
            hint: index == 0 ? const Text('Nota mais grave aqui...') : null,
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
          onSelected: (bool value) {
            setState(() {
              _selectedNotes[index]?.accidental =
                  flatSelected ? Accidental.normal : Accidental.flat;
            });
          },
        ),
        FilterChip(
          label: const Text('#'),
          selected: sharpSelected,
          onSelected: (bool value) {
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
