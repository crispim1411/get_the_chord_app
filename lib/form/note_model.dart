import 'package:flutter/foundation.dart';
import 'enums.dart';

class NoteModel {
  Symbol symbol;
  Accidental accidental;

  NoteModel(this.symbol, this.accidental);

  @override
  bool operator ==(other) {
    return (other is NoteModel) &&
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

  static NoteModel getNextNote(NoteModel note) {
    var index = note.symbol.index;
    Symbol nextSymbol =
        index == Symbol.values.length - 1 ? Symbol.C : Symbol.values[index + 1];

    switch (note.accidental) {
      case Accidental.flat:
        return NoteModel(note.symbol, Accidental.normal);
      case Accidental.sharp:
        return NoteModel(nextSymbol, Accidental.normal);
      default:
        {
          if ([Symbol.E, Symbol.B].contains(note.symbol)) {
            return NoteModel(nextSymbol, Accidental.normal);
          } else {
            return NoteModel(note.symbol, Accidental.sharp);
          }
        }
    }
  }

  static NoteModel getSharpEq(NoteModel note) {
    switch (note.symbol) {
      case Symbol.C:
        return NoteModel(Symbol.B, Accidental.normal);
      case Symbol.D:
        return NoteModel(Symbol.C, Accidental.sharp);
      case Symbol.E:
        return NoteModel(Symbol.D, Accidental.sharp);
      case Symbol.F:
        return NoteModel(Symbol.E, Accidental.normal);
      case Symbol.G:
        return NoteModel(Symbol.F, Accidental.sharp);
      case Symbol.A:
        return NoteModel(Symbol.G, Accidental.sharp);
      case Symbol.B:
        return NoteModel(Symbol.A, Accidental.sharp);
      default:
        return note;
    }
  }

  static NoteModel checkEnarmonics(NoteModel note) {
    if (note.accidental == Accidental.flat) return NoteModel.getSharpEq(note);

    if ([Symbol.B, Symbol.E].contains(note.symbol) &&
        note.accidental == Accidental.sharp) return NoteModel.getNextNote(note);

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

  static final chromaticScale = [
    NoteModel(Symbol.C, Accidental.normal),
    NoteModel(Symbol.C, Accidental.sharp),
    NoteModel(Symbol.D, Accidental.normal),
    NoteModel(Symbol.D, Accidental.sharp),
    NoteModel(Symbol.E, Accidental.normal),
    NoteModel(Symbol.F, Accidental.normal),
    NoteModel(Symbol.F, Accidental.sharp),
    NoteModel(Symbol.G, Accidental.normal),
    NoteModel(Symbol.G, Accidental.sharp),
    NoteModel(Symbol.A, Accidental.normal),
    NoteModel(Symbol.A, Accidental.sharp),
    NoteModel(Symbol.B, Accidental.normal),
  ];

  // listar demais acordes
  late final Map<List<Interval>, String> chordShapes = {
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

  final List<NoteModel> notes;
  final List<NoteModel> scale;

  Scale(this.notes, this.scale);

  static Scale from(List<NoteModel> notes) {
    NoteModel tonic = notes[0];
    tonic = NoteModel.checkEnarmonics(tonic);
    var index = chromaticScale.indexOf(tonic);
    var scale = [
      ...chromaticScale.sublist(index),
      ...chromaticScale.sublist(0, index)
    ];
    return Scale(notes, scale);
  }

  String getInversionString(String inv) {
    switch (inv) {
      case 'major 1st inversion':
        return '${scale[8].toString()}/${notes[0].toString()}';
      case 'major 2st inversion':
        return '${scale[5].toString()}/${notes[0].toString()}';
      case 'minor 1st inversion':
        return '${scale[9].toString()}m/${notes[0].toString()}';
      case 'minor 2st inversion':
        return '${scale[5].toString()}m/${notes[0].toString()}';
      default:
        return inv;
    }
  }

  List<Interval> getIntervals() {
    List<Interval> intervals = [];
    for (var note in notes) {
      note = NoteModel.checkEnarmonics(note);
      intervals.add(mapToInterval(note));
    }
    intervals.sort();
    return intervals;
  }

  Interval mapToInterval(NoteModel note) {
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

  String getChord() {
    var intervals = getIntervals();

    var chordQuery =
        chordShapes.entries.where((e) => listEquals(e.key, intervals));
    if (chordQuery.isEmpty) {
      return "Nenhum acorde encontrado";
    }

    var chordString = chordQuery.first.value;
    if (chordString.contains('inversion')) {
      return getInversionString(chordString);
    }

    var chordSymbol = notes[0].symbol.toString().split('.').last;
    String chordAcc = '';
    if (notes[0].accidental == Accidental.flat) chordAcc = 'b';
    if (notes[0].accidental == Accidental.sharp) chordAcc = '#';

    return '$chordSymbol$chordAcc$chordString';
  }
}
