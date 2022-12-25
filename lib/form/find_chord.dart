import 'package:flutter/foundation.dart';
import 'enums.dart';

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
  int get hashCode {
    return symbol.hashCode ^ accidental.hashCode;
  }

  @override
  String toString() {
    String chordAcc = '';
    if (accidental == Accidental.flat) {
      chordAcc = 'b';
    } else if (accidental == Accidental.sharp) {
      chordAcc = '#';
    }
    return '${symbol.toString().split('.').last}$chordAcc';
  }

  static Note getNextNote(Note note) {
    var index = note.symbol.index;
    Symbol nextSymbol =
        index == Symbol.values.length - 1 ? Symbol.C : Symbol.values[index + 1];

    switch (note.accidental) {
      case Accidental.flat:
        return Note(note.symbol, Accidental.normal);
      case Accidental.sharp:
        return Note(nextSymbol, Accidental.normal);
      default:
        {
          if ([Symbol.E, Symbol.B].contains(note.symbol)) {
            return Note(nextSymbol, Accidental.normal);
          } else {
            return Note(note.symbol, Accidental.sharp);
          }
        }
    }
  }

  static Note getSharpEq(Note note) {
    switch (note.symbol) {
      case Symbol.C:
        return Note(Symbol.B, Accidental.normal);
      case Symbol.D:
        return Note(Symbol.C, Accidental.sharp);
      case Symbol.E:
        return Note(Symbol.D, Accidental.sharp);
      case Symbol.F:
        return Note(Symbol.E, Accidental.normal);
      case Symbol.G:
        return Note(Symbol.F, Accidental.sharp);
      case Symbol.A:
        return Note(Symbol.G, Accidental.sharp);
      case Symbol.B:
        return Note(Symbol.A, Accidental.sharp);
      default:
        return note;
    }
  }

  static Note checkEnarmonics(Note note) {
    if (note.accidental == Accidental.flat) return Note.getSharpEq(note);

    if ([Symbol.B, Symbol.E].contains(note.symbol) &&
        note.accidental == Accidental.sharp) return Note.getNextNote(note);

    return note;
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
  final fifthDiminished = Interval(IntervalName.fifth, IntervalType.diminished);
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

    tonic = Note.checkEnarmonics(tonic);

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
      [tonic, thirdMajor, fifthDiminished, seventhMinor]: "7b5",
      // Acordes menores
      [tonic, thirdMinor, fifthPerfect]: "m",
      [tonic, thirdMinor, fifthPerfect, sixthMajor]: "m6",
      [tonic, thirdMinor, fifthPerfect, seventhMinor]: "m7",
      [tonic, thirdMinor, fifthPerfect, seventhMajor]: "mM7",
      [tonic, thirdMinor, fifthDiminished, seventhMinor]: "m7b5",
      [tonic, thirdMinor, fifthDiminished]: "dim",
      [tonic, thirdMinor, fifthDiminished, sixthMajor]: "dim7",
      // Acordes suspensos
      [tonic, fifthPerfect]: "5",
      [tonic, secondMajor, fifthPerfect]: "sus2",
      [tonic, fourthPerfect, fifthPerfect]: "sus4",
      [tonic, secondMajor, fifthPerfect, seventhMinor]: "7sus2",
      [tonic, fourthPerfect, fifthPerfect, seventhMinor]: "7sus4",
      [tonic, secondMajor, fourthPerfect, fifthPerfect, seventhMinor]: "9sus4",
      // Acordes extendidos
      [tonic, secondMajor, thirdMajor, fifthPerfect, seventhMajor]: "maj9",
      [tonic, secondMajor, thirdMinor, fifthPerfect, seventhMinor]: "m9",
      [tonic, secondMajor, thirdMajor, fifthPerfect, seventhMinor]: "9",
      [tonic, secondMajor, thirdMajor, fifthPerfect]: "add9",
      [tonic, secondMajor, thirdMinor, fifthPerfect]: "m(add9)",
      [tonic, thirdMajor, fourthPerfect, fifthPerfect]: "add11",
      [tonic, thirdMinor, fourthPerfect, fifthPerfect]: "m(add11)",
      [tonic, secondMajor, thirdMajor, fifthPerfect, sixthMajor]: "6/9",
      [tonic, secondMajor, thirdMinor, fifthPerfect, sixthMajor]: "m6/9",
      // Acordes invertidos
      [tonic, thirdMinor, fifthAugmented]: "major 1st inversion",
      [tonic, fourthPerfect, sixthMajor]: "major 2st inversion",
      [tonic, thirdMajor, sixthMajor]: "minor 1st inversion",
      [tonic, fourthPerfect, fifthAugmented]: "minor 2st inversion",
    };
  }

  String getInversionString(String inv) {
    switch (inv) {
      case 'major 1st inversion':
        return '${scale[8].toString()}/${scale[0].toString()}';
      case 'major 2st inversion':
        return '${scale[5].toString()}/${scale[0].toString()}';
      case 'minor 1st inversion':
        return '${scale[9].toString()}m/${scale[0].toString()}';
      case 'minor 2st inversion':
        return '${scale[5].toString()}m/${scale[0].toString()}';
      default:
        return inv;
    }
  }

  List<Interval> getIntervals() {
    List<Interval> intervals = [];
    for (var note in notes) {
      note = Note.checkEnarmonics(note);
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
        return fifthDiminished;
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
    for (var pair in chordShapes.entries) {
      if (listEquals(pair.key, intervals)) {
        chordString = pair.value;
        break;
      }
    }
    if (chordString == null) return "Nenhum acorde encontrado";

    if (chordString.contains('inversion')) {
      return scale.getInversionString(chordString);
    }

    var chordSymbol = notes[0].symbol.toString().split('.').last;
    String chordAcc = '';
    if (notes[0].accidental == Accidental.flat) chordAcc = 'b';
    if (notes[0].accidental == Accidental.sharp) chordAcc = '#';

    return '$chordSymbol$chordAcc$chordString';
  }
}
