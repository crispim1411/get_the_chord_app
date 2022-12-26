import 'package:flutter/material.dart';
import 'chord_dict_list.dart';

class DictChordPage extends StatelessWidget {
  const DictChordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dictList.keys.length,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Dicionário de acordes'),
            bottom: TabBar(
                isScrollable: true,
                labelPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                tabs: dictList.entries
                    .map((entry) => Tab(text: entry.key))
                    .toList())),
        body: TabBarView(
            key: const Key('DictPage'),
            physics: const NeverScrollableScrollPhysics(),
            children: dictList.entries
                .map((entry) => createChordTable(entry))
                .toList()),
      ),
    );
  }

  Widget createChordTable(MapEntry<String, dynamic> entry) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        DataTable(
            columnSpacing: 0,
            columns: [
              DataColumn(
                label: Text('Acordes ${entry.key}'),
              ),
              const DataColumn(
                label: Text('Intervalos'),
              )
            ],
            rows: entry.value['intervals'].entries
                .map<DataRow>((i) => DataRow(
                      cells: [DataCell(Text(i.key)), DataCell(Text(i.value))],
                    ))
                .toList()),
        const Padding(padding: EdgeInsets.all(10)),
        DataTable(
            columnSpacing: 0,
            columns: const [
              DataColumn(
                label: Text('Exemplo'),
              ),
              DataColumn(
                label: Text('Intervalos'),
              )
            ],
            rows: entry.value['examples'].entries.map<DataRow>((i) {
              return DataRow(
                cells: [DataCell(Text(i.key)), DataCell(Text(i.value))],
              );
            }).toList()),
        const Padding(padding: EdgeInsets.all(15)),
      ]),
    );
  }
}
