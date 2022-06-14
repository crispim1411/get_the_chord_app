import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get the chord',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  List<Widget> _rows = [];
  Color _color = Colors.green;
  final List<String> _notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  Map<int, String> _selectedNotes = {};
  int _counterNotes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get the chord'),
          backgroundColor: Colors.yellow[300],
          foregroundColor: Colors.black,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            _rows.isEmpty
                ? Text('No items')
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _rows.length,
                    itemBuilder: (context, index) {
                      return DropdownButton(
                        items: _notes.map((s) {
                          return DropdownMenuItem(child: Text(s), value: s);
                        }).toList(),
                        value: _selectedNotes[index],
                        onChanged: (String? a) {
                          setState(() {
                            _selectedNotes[index] = a.toString();
                          });
                        },
                      );
                    },
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Icon(Icons.add_box, size: 30, color: _color),
                  onTap: () {
                    addRow();
                  },
                ),
                const Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Add note'),
                )
              ],
            ),
          ],
        ));
  }

  void addRow() {
    setState(() {
      _counterNotes += 1;
      _color == Colors.green ? Colors.red : Colors.green;
      _rows.add(Container(
        color: Colors.red[_rows.length * 100],
        width: 40,
        height: 20,
      ));
      print('notes: $_selectedNotes');
    });
  }
}
