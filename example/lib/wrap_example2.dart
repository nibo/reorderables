import 'package:flutter/material.dart';

import 'package:reorderables/reorderables.dart';

class WrapExample extends StatefulWidget {
  @override
  _WrapExampleState createState() => _WrapExampleState();
}

class _WrapExampleState extends State<WrapExample> {
  final double _iconSize = 90;
  List<Widget> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = <ReorderableWidgetWithDragArea>[
      ReorderableWidgetWithDragArea(
        reorderable: true,
        key: ValueKey(0),
        dragArea: Icon(
          Icons.android,
          size: 50,
        ),
        child: Icon(Icons.filter_1, size: _iconSize),
      ),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(1),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_2, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(2),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_3, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(3),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_4, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(4),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_5, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(5),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_6, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(6),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_7, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(7),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_8, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(8),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_9, size: _iconSize)),
      ReorderableWidgetWithDragArea(
        reorderable: true,
        key: ValueKey(9),
        dragArea: Icon(
          Icons.android,
          size: 50,
        ),
        child: Icon(Icons.filter_1, size: _iconSize),
      ),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(10),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_2, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(11),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_3, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(12),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_4, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(13),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_5, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(14),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_6, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(15),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_7, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(16),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_8, size: _iconSize)),
      ReorderableWidgetWithDragArea(
          reorderable: true,
          key: ValueKey(17),
          dragArea: Icon(
            Icons.android,
            size: 50,
          ),
          child: Icon(Icons.filter_9, size: _iconSize)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
        spacing: 8.0,
        runSpacing: 4.0,
        padding: const EdgeInsets.all(8),
        needsLongPressDraggable: false,
        children: _tiles,
        onReorder: _onReorder,
        onNoReorder: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
        },
        onReorderStarted: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
        });

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        wrap,
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.add_circle),
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                var newTile = Icon(Icons.filter_9_plus, size: _iconSize);
                setState(() {
                  _tiles.add(newTile);
                });
              },
            ),
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.remove_circle),
              color: Colors.teal,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                setState(() {
                  _tiles.removeAt(0);
                });
              },
            ),
          ],
        ),
      ],
    );

    return SingleChildScrollView(
      child: column,
    );
  }
}
