import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final listTile = <Tile>[
    const Tile(
      color: Colors.blue,
      name: 'blue Tile',
      key: ValueKey(1),
    ),
    const Tile(
      color: Colors.red,
      name: 'red Tile',
      key: ValueKey(2),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'rebuild MyHomePage with listTile = ${listTile.map((e) => e.name)}');

    return Scaffold(
      body: Center(
        child: Row(
          children: listTile,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTwoTileWidget,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  void swapTwoTileWidget() {
    setState(() {
      listTile.insert(1, listTile.removeAt(0));
    });
  }
}

class Tile extends StatefulWidget {
  final Color color;
  final String name;

  const Tile({
    required this.color,
    required this.name,
    super.key,
  });

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  Color? _color;

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      width: 100,
      height: 100,
    );
  }
}
