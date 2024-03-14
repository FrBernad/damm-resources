import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: DiscardOrUpdate(),
    ),
  );
}

class DiscardOrUpdate extends StatefulWidget {
  final bool isLoading;
  final int counter;

  const DiscardOrUpdate({
    super.key,
    this.isLoading = false,
    this.counter = 0,
  });

  @override
  State<DiscardOrUpdate> createState() {
    return _DiscardOrUpdateState();
  }

  @override
  StatefulElement createElement() {
    debugPrint('createElement Discard');
    return super.createElement();
  }
}

class _DiscardOrUpdateState extends State<DiscardOrUpdate> {
  late bool _isLoading;
  late int _counter;

  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
    _counter = widget.counter;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild Discard');
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : CounterWidget(  // ----> CounterElement
                isLoading: _isLoading,
                counter: _counter,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonClicked,
      ),
    );
  }

  void onFloatingButtonClicked() {
    debugPrint('Button clicked!. Call setState method');
    setState(() {
      _counter++;
      if (_counter % 3 == 0) {
        _isLoading = true;
      } else {
        _isLoading = false;
      }
    });
  }
}

class CounterWidget extends StatelessWidget {
  final bool isLoading;
  final int counter;

  const CounterWidget({
    super.key,
    required this.isLoading,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild CounterWidget');
    return isLoading ? const CircularProgressIndicator() : Text('$counter');
  }

  @override
  StatelessElement createElement() {
    debugPrint('createElement CounterWidget');
    return super.createElement();
  }

}
