import 'dart:math';

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
  final listTile = <Padding>[
    const Padding(
      padding: EdgeInsets.all(8.0),
      key: ValueKey(1),
      child: Tile(
        color: Colors.blue,
        name: 'blue Tile',
      ),
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      key: ValueKey(2),
      child: Tile(
        color: Colors.red,
        name: 'red Tile',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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

  @override
  StatefulElement createElement() {
    debugPrint('rebuild tile $name');
    return super.createElement();
  }
}

class _TileState extends State<Tile> {
  Color? _color;

  Color generateRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
  }

  @override
  void initState() {
    super.initState();
    _color = generateRandomColor();
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
