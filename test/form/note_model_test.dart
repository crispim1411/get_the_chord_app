import 'package:flutter_test/flutter_test.dart';
import 'package:get_chord_app/form/enums.dart';
import 'package:get_chord_app/form/note_model.dart';

void main() {
  final noteC = NoteModel(Symbol.C, Accidental.normal);
  final noteCs = NoteModel(Symbol.C, Accidental.sharp);
  final noteDb = NoteModel(Symbol.D, Accidental.flat);
  final noteD = NoteModel(Symbol.D, Accidental.normal);
  final noteDs = NoteModel(Symbol.D, Accidental.sharp);
  final noteEb = NoteModel(Symbol.E, Accidental.flat);
  final noteE = NoteModel(Symbol.E, Accidental.normal);
  final noteF = NoteModel(Symbol.F, Accidental.normal);
  final noteFs = NoteModel(Symbol.F, Accidental.sharp);
  final noteGb = NoteModel(Symbol.G, Accidental.flat);
  final noteG = NoteModel(Symbol.G, Accidental.normal);
  final noteGs = NoteModel(Symbol.G, Accidental.sharp);
  final noteAb = NoteModel(Symbol.A, Accidental.flat);
  final noteA = NoteModel(Symbol.A, Accidental.normal);
  final noteAs = NoteModel(Symbol.A, Accidental.sharp);
  final noteBb = NoteModel(Symbol.B, Accidental.flat);
  final noteB = NoteModel(Symbol.B, Accidental.normal);
  group('getNextNote test', () {
    test('Normal notes', () async {
      // normal
      expect(NoteModel.getNextNote(noteC), noteCs);
      expect(NoteModel.getNextNote(noteD), noteDs);
      expect(NoteModel.getNextNote(noteE), noteF);
      expect(NoteModel.getNextNote(noteF), noteFs);
      expect(NoteModel.getNextNote(noteG), noteGs);
      expect(NoteModel.getNextNote(noteA), noteAs);
      expect(NoteModel.getNextNote(noteB), noteC);
    });
    test('Sharp notes', () async {
      // sharp
      expect(NoteModel.getNextNote(noteCs), noteD);
      expect(NoteModel.getNextNote(noteDs), noteE);
      expect(NoteModel.getNextNote(noteFs), noteG);
      expect(NoteModel.getNextNote(noteGs), noteA);
      expect(NoteModel.getNextNote(noteAs), noteB);
    });
    test('Flat notes', () async {
      // flat
      expect(NoteModel.getNextNote(noteDb), noteD);
      expect(NoteModel.getNextNote(noteEb), noteE);
      expect(NoteModel.getNextNote(noteGb), noteG);
      expect(NoteModel.getNextNote(noteAb), noteA);
      expect(NoteModel.getNextNote(noteBb), noteB);
    });
  });

  group('getChord test', () {
    test('chords', () {
      expect(Scale.from([noteC, noteEb, noteG]).getChord(), 'Cm');
      expect(Scale.from([noteC, noteDs, noteG]).getChord(), 'Cm');
      expect(Scale.from([noteE, noteGs, noteC]).getChord(), 'Eaug');
      expect(Scale.from([noteE, noteAb, noteC]).getChord(), 'Eaug');
      expect(Scale.from([noteGs, noteC, noteDs, noteCs]).getChord(), 'G#add11');
      expect(Scale.from([noteGb, noteBb, noteDb, noteB]).getChord(), 'Gbadd11');
      expect(Scale.from([noteEb, noteAb, noteBb, noteF, noteDb]).getChord(),
          'Eb9sus4');
      expect(Scale.from([noteDs, noteGs, noteAs, noteF, noteCs]).getChord(),
          'D#9sus4');
    });
    test('mix notes', () {
      expect(Scale.from([noteGs, noteCs, noteC, noteDs]).getChord(), 'G#add11');
      expect(Scale.from([noteDs, noteGs, noteCs, noteAs, noteF]).getChord(),
          'D#9sus4');
      expect(Scale.from([noteE, noteC, noteAb]).getChord(), 'Eaug');
    });
    test('Inverted chord', () {
      expect(Scale.from([noteEb, noteC, noteG]).getChord(), 'Cm/Eb');
      expect(Scale.from([noteDb, noteFs, noteA]).getChord(), 'F#m/Db');
      expect(Scale.from([noteAb, noteE, noteCs]).getChord(), 'C#m/Ab');
      expect(Scale.from([noteBb, noteG, noteEb]).getChord(), 'Ebm/Bb');
      expect(Scale.from([noteF, noteDb, noteBb]).getChord(), 'Bbm/F');
      expect(Scale.from([noteF, noteDb, noteAs]).getChord(), 'A#m/F');
    });
  });
}
