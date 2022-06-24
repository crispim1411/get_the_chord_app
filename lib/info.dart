import 'package:flutter/material.dart';

class ChordInfo extends StatelessWidget {
  const ChordInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicionário de acordes'),
        bottom: const Tab(
          height: 20,
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text('by Crispim',
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              majorChords(),
              const Padding(padding: EdgeInsets.only(bottom: 10, top: 10)),
              minorChords(),
              const Padding(padding: EdgeInsets.only(bottom: 10, top: 10)),
              suspendedChords()
            ],
          ),
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
            DataCell(Text('C5')),
            DataCell(Text('C - G')),
          ],
        ),
      ],
    );
  }
}
