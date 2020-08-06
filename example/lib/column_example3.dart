import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class ColumnExample3 extends StatefulWidget {
  @override
  _ColumnExample3State createState() => _ColumnExample3State();
}

class _ColumnExample3State extends State<ColumnExample3> {
  List<Widget> _rows;

  @override
  void initState() {
    super.initState();

    _rows = List<ReorderableWidgetWithDragArea>.generate(
        50,
        (int index) => ReorderableWidgetWithDragArea(
              dragArea: Icon(Icons.android, size: 24),
              reorderable: true,
              key: ValueKey(index),
              child: Text('This is row $index', textScaleFactor: 1.5),
            ));
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _rows.removeAt(oldIndex);
        _rows.insert(newIndex, row);
      });
    }

    return ReorderableColumn(
      header: Text('THIS IS THE HEADER ROW'),
      footer: Text('THIS IS THE FOOTER ROW'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _rows,
      onReorder: _onReorder,
      onNoReorder: (int index) {
        //this callback is optional
        debugPrint(
            '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      },
    );
  }
}
