import 'package:flutter/material.dart';

class DictChordPage extends StatelessWidget {
  const DictChordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Dicionário de acordes'),
            bottom: const TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Maiores'),
                Tab(text: 'Menores'),
                Tab(text: 'Suspensos'),
                Tab(text: 'Extendidos'),
                Tab(text: 'Invertidos'),
              ],
            )),
        body: TabBarView(
          children: [
            majorChords(),
            minorChords(),
            suspendedChords(),
            extendedChords(),
            invertedChords(),
          ],
        ),
      ),
    );
  }

  Widget majorChords() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              columnSpacing: 0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Acordes Maiores'),
                ),
                DataColumn(
                  label: Text('Intervalos'),
                )
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Maior')),
                    DataCell(Text('T - 3M - 5J')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Maior com sexta')),
                    DataCell(Text('T - 3M - 5J - 6M')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Dominante')),
                    DataCell(Text('T - 3M - 5J - 7m')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Maior com sétima')),
                    DataCell(Text('T - 3M - 5J - 7M')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Aumentado')),
                    DataCell(Text('T - 3M - #5')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Aumentado com sétima')),
                    DataCell(Text('T - 3M - #5 - 7m')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Aumentado com sétima maior')),
                    DataCell(Text('T - 3M - #5 - 7M')),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            DataTable(
              columnSpacing: 120,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Exemplo'),
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
                    DataCell(Text('C6')),
                    DataCell(Text('C - E - G - A')),
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
                    DataCell(Text('Cmaj7')),
                    DataCell(Text('C - E - G - B')),
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
            ),
            const Padding(padding: EdgeInsets.all(15)),
          ],
        ),
      ),
    );
  }

  Widget minorChords() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              columnSpacing: 0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Acordes Menores'),
                ),
                DataColumn(
                  label: Text('Intervalos'),
                )
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor')),
                    DataCell(Text('T - 3m - 5J')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor com sexta')),
                    DataCell(Text('T - 3m - 5J - 6M')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor com sétima')),
                    DataCell(Text('T - 3m - 5J - 7m')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor com sétima maior')),
                    DataCell(Text('T - 3m - 5J - 7M')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Diminuto')),
                    DataCell(Text('T - 3m - b5')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Diminuto com sétima')),
                    DataCell(Text('T - 3m - b5 - 7m')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Meio diminuto')),
                    DataCell(Text('T - 3m - 5J - 7M')),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            DataTable(
              columnSpacing: 120,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Exemplo'),
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
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Cm7(b5)')),
                    DataCell(Text('C - Eb - Gb - Bb')),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }

  Widget suspendedChords() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              columnSpacing: 0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Acordes Suspensos'),
                ),
                DataColumn(
                  label: Text('Intervalos'),
                )
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Com quinta')),
                    DataCell(Text('T - 5J')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Segunda suspensa')),
                    DataCell(Text('T - 2M - 5J')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Quarta suspensa')),
                    DataCell(Text('T - 4J - 5J')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Segunda suspensa c/ sétima')),
                    DataCell(Text('T - 2M - 5J - 7m')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Quarta suspensa c/ sétima')),
                    DataCell(Text('T - 4J - 5J - 7m')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Quarta suspensa c/ nona')),
                    DataCell(Text('T - 4J - 5J - 7m - 9')),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            DataTable(
              columnSpacing: 110,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Exemplo'),
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
            ),
            const Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }

  Widget extendedChords() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              columnSpacing: 0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Acordes Extendidos'),
                ),
                DataColumn(
                  label: Text('Intervalos'),
                )
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Add nona')),
                    DataCell(Text('T - 3M - 5J - 9')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor add nona')),
                    DataCell(Text('T - 3m - 5J - 9')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Add onze')),
                    DataCell(Text('T - 3M - 5J - 11')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor add onze')),
                    DataCell(Text('T - 3m - 5J - 11')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sexta e nona')),
                    DataCell(Text('T - 3M - 5J - 6M - 9')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor sexta e nona')),
                    DataCell(Text('T - 3m - 5J - 6M - 9')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Dominante com nona')),
                    DataCell(Text('T - 3M - 5J - 7m - 9')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Maior com nona')),
                    DataCell(Text('T - 3M - 5J - 7M - 9')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor com nona')),
                    DataCell(Text('T - 3m - 5J - 7m - 9')),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Exemplo'),
                ),
                DataColumn(
                  label: Text('Notas'),
                )
              ],
              rows: const <DataRow>[
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
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('C9')),
                    DataCell(Text('C - E - G - Bb - D')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Cmaj9')),
                    DataCell(Text('C - E - G - B - D')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Cm9')),
                    DataCell(Text('C - Eb - G - Bb - D')),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }

  Widget invertedChords() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              columnSpacing: 0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Acordes Invertidos'),
                ),
                DataColumn(
                  label: Text('Intervalos'),
                )
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Maior 1ª inversão')),
                    DataCell(Text('T - 3m - #5')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Maior 2ª inversão')),
                    DataCell(Text('T - 4J - 6M')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor 1ª inversão')),
                    DataCell(Text('T - 3M - 6M')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Menor 2ª inversão')),
                    DataCell(Text('T - 4J - #5')),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Exemplo'),
                ),
                DataColumn(
                  label: Text('Notas'),
                )
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('C/E')),
                    DataCell(Text('E - G - C')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('C/G')),
                    DataCell(Text('G - C - E')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Cm/Eb')),
                    DataCell(Text('Eb - G - C')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Cm/G')),
                    DataCell(Text('G - C - Eb')),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }
}
