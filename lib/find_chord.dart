import 'package:flutter/foundation.dart';
import 'models.dart';

class Note {
  Symbol symbol;
  Accidental accidental;

  Note(this.symbol, this.accidental);

  @override
  bool operator ==(other) {
    return (other is Note) &&
        other.symbol == symbol &&
        other.accidental == accidental;
  }

  @override
  String toString() => '[$symbol, $accidental]';

  static Note getNextNote(Note note) {
    var index = note.symbol.index;

    Symbol nextSymbol;
    if (index == 6) {
      nextSymbol = Symbol.C;
    } else {
      nextSymbol = Symbol.values[index + 1];
    }

    switch (note.accidental) {
      case Accidental.flat:
        return Note(note.symbol, Accidental.normal);
      case Accidental.normal:
        {
          if ([Symbol.E, Symbol.B].contains(note.symbol)) {
            return Note(nextSymbol, Accidental.normal);
          } else {
            return Note(note.symbol, Accidental.sharp);
          }
        }
      case Accidental.sharp:
        return Note(nextSymbol, Accidental.normal);
    }
  }
}

class Interval extends Comparable {
  IntervalName name;
  IntervalType type;
  Interval(this.name, this.type);

  @override
  int compareTo(other) {
    return name.index.compareTo(other.name.index);
  }
}

class Scale {
  final tonic = Interval(IntervalName.tonic, IntervalType.unison);
  final secondMinor = Interval(IntervalName.second, IntervalType.minor);
  final secondMajor = Interval(IntervalName.second, IntervalType.major);
  final thirdMinor = Interval(IntervalName.third, IntervalType.minor);
  final thirdMajor = Interval(IntervalName.third, IntervalType.major);
  final fourthPerfect = Interval(IntervalName.fourth, IntervalType.perfect);
  final fourthAugmented = Interval(IntervalName.fourth, IntervalType.augmented);
  final fifthPerfect = Interval(IntervalName.fifth, IntervalType.perfect);
  final fifthAugmented = Interval(IntervalName.fifth, IntervalType.augmented);
  final sixthMajor = Interval(IntervalName.sixth, IntervalType.major);
  final seventhMinor = Interval(IntervalName.seventh, IntervalType.minor);
  final seventhMajor = Interval(IntervalName.seventh, IntervalType.major);

  List<Note> notes = [];
  List<Note> scale = [];

  void fillUp(List<Note> notes) {
    Note tonic = notes[0];
    List<Note> scale = [];
    var cursor = tonic;
    do {
      var nextNote = Note.getNextNote(cursor);
      scale.add(cursor);
      cursor = nextNote;
    } while (cursor != tonic);

    this.notes = notes;
    this.scale = scale;
  }

  // listar demais acordes
  Map<List<Interval>, String> getChordShapes() {
    return {
      // Acordes maiores
      [tonic, thirdMajor, fifthPerfect]: "",
      [tonic, thirdMajor, fifthAugmented]: "aug",
      [tonic, thirdMajor, fifthPerfect, sixthMajor]: "6",
      [tonic, thirdMajor, fifthPerfect, seventhMajor]: "maj7",
      [tonic, thirdMajor, fifthAugmented, seventhMajor]: "augM7",
      [tonic, thirdMajor, fifthPerfect, seventhMinor]: "7",
      [tonic, thirdMajor, fifthAugmented, seventhMinor]: "aug7",
      // Acordes menores
      [tonic, thirdMinor, fifthPerfect]: "m",
      [tonic, thirdMinor, sixthMajor]: "m6",
      [tonic, thirdMinor, fifthPerfect, sixthMajor]: "m6",
      [tonic, thirdMinor, fifthPerfect, seventhMinor]: "maj7",
      [tonic, thirdMinor, fifthPerfect, seventhMajor]: "m(maj7)",
      [tonic, thirdMinor, fourthAugmented, seventhMinor]: "m7(b5)",
      [tonic, thirdMinor, fourthAugmented]: "dim",
      [tonic, thirdMinor, fourthAugmented, sixthMajor]: "dim7",

      // Acordes suspensos
      [tonic, secondMajor, fifthPerfect]: "sus2",
      [tonic, fourthPerfect, fifthPerfect]: "sus4",
    };
  }

  List<Interval> getIntervals() {
    List<Interval> intervals = [];
    for (var note in notes) {
      intervals.add(mapToInterval(note));
    }
    intervals.sort();
    return intervals;
  }

  Interval mapToInterval(Note note) {
    var index = scale.indexOf(note);
    switch (index) {
      case 0:
        return tonic;
      case 1:
        return secondMinor;
      case 2:
        return secondMajor;
      case 3:
        return thirdMinor;
      case 4:
        return thirdMajor;
      case 5:
        return fourthPerfect;
      case 6:
        return fourthAugmented;
      case 7:
        return fifthPerfect;
      case 8:
        return fifthAugmented;
      case 9:
        return sixthMajor;
      case 10:
        return seventhMinor;
      case 11:
        return seventhMajor;
      default:
        return tonic;
    }
  }

  static String getChord(List<Note> notes) {
    var scale = Scale();
    scale.fillUp(notes);
    var intervals = scale.getIntervals();
    var chordShapes = scale.getChordShapes();

    String? chordString;
    chordShapes.forEach((key, value) {
      if (listEquals(key, intervals)) {
        chordString = value;
      }
    });
    if (chordString == null) return "No chord found";

    var chordSymbol = notes[0].symbol.toString().split('.').last;
    return '$chordSymbol$chordString';
  }
}
