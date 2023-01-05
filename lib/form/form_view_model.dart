import 'package:flutter/material.dart';

import 'note_model.dart';

class FormViewModel extends ChangeNotifier {
  final Map<int, NoteModel> selectedNotes = {};
  int rowsCounter = 3;
  String answer = '';

  bool get isButtonEnable {
    return selectedNotes.length > 1;
  }

  bool get showAddRow => rowsCounter < 5;

  void setNote(index, value) {
    selectedNotes[index] = value;
    notifyListeners();
  }

  void setAccident(index, value) {
    selectedNotes[index]?.accidental = value;
    notifyListeners();
  }

  void addRow() {
    rowsCounter += 1;
    notifyListeners();
  }

  void restore() {
    rowsCounter = 3;
    answer = '';
    selectedNotes.clear();
    notifyListeners();
  }

  void setAnswer() {
    answer = Scale.getChord(notes: selectedNotes.values.toSet().toList());
    notifyListeners();
  }
}
