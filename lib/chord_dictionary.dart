import 'package:flutter/material.dart';

class DictChordPage extends StatelessWidget {
  const DictChordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Dicionário de acordes'),
            bottom: const TabBar(
              labelPadding: EdgeInsets.all(0),
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Maiores'),
                Tab(text: 'Menores'),
                Tab(text: 'Suspensos'),
                Tab(text: 'Extendidos'),
              ],
            )),
        body: TabBarView(
          children: [
            majorChords(),
            minorChords(),
            suspendedChords(),
            extendedChords(),
          ],
        ),
      ),
    );
  }

  Widget majorChords() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Acordes Maiores'),
        ),
        DataColumn(
          label: Text('Notas'),
        )
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C')),
            DataCell(Text('C - E - G')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Caug')),
            DataCell(Text('C - E - G#')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C6')),
            DataCell(Text('C - E - G - A')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cmaj7')),
            DataCell(Text('C - E - G - B')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C7')),
            DataCell(Text('C - E - G - Bb')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Caug7')),
            DataCell(Text('C - E - G# - Bb')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('CaugM7')),
            DataCell(Text('C - E - G# - B')),
          ],
        ),
      ],
    );
  }

  Widget minorChords() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Acordes Menores'),
        ),
        DataColumn(
          label: Text('Notas'),
        )
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cm')),
            DataCell(Text('C - Eb - G')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cm6')),
            DataCell(Text('C - Eb - G - A')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cm7')),
            DataCell(Text('C - Eb - G - Bb')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('CmM7')),
            DataCell(Text('C - Eb - G - B')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cm7(b5)')),
            DataCell(Text('C - Eb - Gb - Bb')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cdim')),
            DataCell(Text('C - Eb - Gb')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cdim7')),
            DataCell(Text('C - Eb - Gb - Bbb(A)')),
          ],
        ),
      ],
    );
  }

  Widget suspendedChords() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Acordes Suspensos'),
        ),
        DataColumn(
          label: Text('Notas'),
        )
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C5')),
            DataCell(Text('C - G')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Csus2')),
            DataCell(Text('C - D - G')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Csus4')),
            DataCell(Text('C - F - G')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C7sus2')),
            DataCell(Text('C - D - G - Bb')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C7sus4')),
            DataCell(Text('C - F - G - Bb')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C9sus4')),
            DataCell(Text('C - F - G - Bb - D')),
          ],
        ),
      ],
    );
  }

  Widget extendedChords() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Acordes Extendidos'),
        ),
        DataColumn(
          label: Text('Notas'),
        )
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('CM9')),
            DataCell(Text('C - E - G - B - D')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cm9')),
            DataCell(Text('C - Eb - G - Bb - D')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C9')),
            DataCell(Text('C - E - G - Bb - D')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cadd9')),
            DataCell(Text('C - E - G - D')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cm(add9)')),
            DataCell(Text('C - Eb - G - D')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cadd11')),
            DataCell(Text('C - E - G - F')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cm(add11)')),
            DataCell(Text('C - Eb - G - F')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('C6/9')),
            DataCell(Text('C - E - G - A - D')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cm6/9')),
            DataCell(Text('C - Eb - G - A - D')),
          ],
        ),
      ],
    );
  }
}
