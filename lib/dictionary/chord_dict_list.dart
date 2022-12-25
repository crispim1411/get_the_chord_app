const Map<String, dynamic> dictList = {
  'Maiores': {
    'intervals': {
      'Maior': 'T - 3M - 5J',
      'Aumentado': 'T - 3M - #5',
      'Maior com sexta': 'T - 3M - 5J - 6M',
      'Maior com sétima': 'T - 3M - 5J - 7M',
      'Dominante': 'T - 3M - 5J - 7m',
      'Aumentado com sétima': 'T - 3M - #5 - 7m',
      'Aumentado com sétima maior': 'T - 3M - #5 - 7M'
    },
    'examples': {
      'C': 'C - E - G',
      'Caug': 'C - E - G#',
      'C6': 'C - E - G - A',
      'Cmaj7': 'C - E - G - B',
      'C7':'C - E - G - Bb',
      'Caug7': 'C - E - G# - Bb',
      'CaugM7': 'C - E - G# - B'
    }
  },
  'Menores': {
    'intervals': {
      'Menor': 'T - 3m - 5J',
      'Menor com sexta': 'T - 3m - 5J - 6M',
      'Menor com sétima': 'T - 3m - 5J - 7m',
      'Menor com sétima maior': 'T - 3m - 5J - 7M',
      'Diminuto': 'T - 3m - b5',
      'Diminuto com sétima': 'T - 3m - b5 - 7m',
      'Meio diminuto': 'T - 3m - 5J - 7M'
    },
    'examples': {
      'Cm': 'C - Eb - G',
      'Cm6': 'C - Eb - G - A',
      'Cm7': 'C - Eb - G - Bb',
      'CmM7': 'C - Eb - G - B',
      'Cdim': 'C - Eb - Gb',
      'Cdim7': 'C - Eb - Gb - Bbb(A)',
      'Cm7(b5)': 'C - Eb - Gb - Bb'
    }
  },
  'Suspensos': {
    'intervals': {
      'Power chord': 'T - 5J', 
      'Segunda suspensa': 'T - 2M - 5J',
      'Quarta suspensa': 'T - 4J - 5J',
      'Segunda suspensa c/ sétima': 'T - 2M - 5J - 7m',
      'Quarta suspensa c/ sétima': 'T - 4J - 5J - 7m',
      'Quarta suspensa c/ nona': 'T - 4J - 5J - 7m - 9'
    },
    'examples': {
      'C5': 'C - G',
      'Csus2': 'C - D - G',
      'Csus4': 'C - F - G',
      'C7sus2': 'C - D - G - Bb',
      'C7sus4': 'C - F - G - Bb',
      'C9sus4': 'C - F - G - Bb - D'
    }
  },
  'Extendidos': {
    'intervals': {
      'Add nona': 'T - 3M - 5J - 9',
      'Menor add nona': 'T - 3m - 5J - 9',
      'Add dec primeira': 'T - 3M - 5J - 11',
      'Menor add dec primeira': 'T - 3m - 5J - 11',
      'Sexta e nona': 'T - 3M - 5J - 6M - 9',
      'Menor sexta e nona': 'T - 3m - 5J - 6M - 9',
      'Dominante com nona': 'T - 3M - 5J - 7m - 9',
      'Maior com nona': 'T - 3M - 5J - 7M - 9',
      'Menor com nona': 'T - 3m - 5J - 7m - 9'
    },
    'examples': {
      'Cadd9': 'C - E - G - D',
      'Cm(add9)': 'C - Eb - G - D',
      'Cadd11': 'C - E - G - F',
      'Cm(add11)': 'C - Eb - G - F',
      'C6/9': 'C - E - G - A - D',
      'Cm6/9': 'C - Eb - G - A - D',
      'C9': 'C - E - G - Bb - D',
      'Cmaj9': 'C - E - G - B - D',
      'Cm9': 'C - Eb - G - Bb - D'
    },
  },
  'Invertidos': {
    'intervals': {
      'Maior 1ª inversão': 'T - 3m - #5',
      'Maior 2ª inversão': 'T - 4J - 6M',
      'Menor 1ª inversão': 'T - 3M - 6M',
      'Menor 2ª inversão': 'T - 4J - #5'
    },
    'examples': {
      'C/E': 'E - G - C',
      'C/G': 'G - C - E',
      'Cm/Eb': 'Eb - G - C',
      'Cm/G': 'G - C - Eb'
    }
  }
};


