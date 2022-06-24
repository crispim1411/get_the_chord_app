// Note { Symbol, Accidental }

enum Symbol { C, D, E, F, G, A, B }

enum Accidental { flat, normal, sharp }

// Interval { Name, Type }

enum IntervalName {
  tonic,
  second,
  third,
  fourth,
  fifth,
  sixth,
  seventh,
}

enum IntervalType {
  unison,
  major,
  minor,
  perfect,
  diminished,
  augmented,
}
