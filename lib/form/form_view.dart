import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

import 'note_model.dart';
import 'enums.dart';
import 'form_view_model.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormPage();
}

class _FormPage extends State<FormView> {
  final _model = FormViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Consumer<FormViewModel>(
        builder: (_, model, __) => Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            key: const Key('FormPage'),
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: model.rowsCounter,
                itemBuilder: (_, index) => _noteSelector(index),
              ),
              const SizedBox(height: 5),
              _addRow(),
              const SizedBox(height: 15),
              _buttons(),
              const SizedBox(height: 10),
              _answerBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addRow() {
    return Visibility(
      visible: _model.showAddRow,
      child: GestureDetector(
        onTap: _model.addRow,
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
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
            onPressed: _model.isButtonEnable ? _model.setAnswer : null,
            child: Text(
              _model.isButtonEnable ? 'Pesquisar acorde' : 'Selecione as notas',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            height: 55,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
              onPressed: _model.restore,
              child: const Text('Limpar', style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _answerBox() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceOut,
        child: Container(
          height: _model.answer.isEmpty ? 0 : 350 - _model.rowsCounter * 30,
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
              _model.answer,
              maxLines: 1,
              style: const TextStyle(fontSize: 80, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }

  Widget _noteSelector(int index) {
    final note = _model.selectedNotes[index];
    var flatSelected = note?.accidental == Accidental.flat;
    var sharpSelected = note?.accidental == Accidental.sharp;
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
            value: note?.symbol,
            isExpanded: true,
            onChanged: (Symbol? symbol) {
              if (symbol == null) return;
              _model.setNote(index, NoteModel(symbol, Accidental.normal));
            },
          ),
        ),
        Visibility(
          visible: ![Symbol.F, Symbol.C].contains(note?.symbol),
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: FilterChip(
            label: const Text('b'),
            selected: flatSelected,
            onSelected: (value) {
              _model.setAccident(
                  index, value ? Accidental.flat : Accidental.normal);
            },
          ),
        ),
        Visibility(
          visible: ![Symbol.E, Symbol.B].contains(note?.symbol),
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: FilterChip(
            label: const Text('#'),
            selected: sharpSelected,
            onSelected: (value) {
              _model.setAccident(
                  index, value ? Accidental.sharp : Accidental.normal);
            },
          ),
        ),
      ],
    );
  }
}
