import 'package:flutter/material.dart';

class SimpleCustomWidget extends StatefulBuilder {
  final String title;
  final Color backgroundColor;
  const SimpleCustomWidget({
    super.key,
    required this.title,
    required this.backgroundColor, required super.builder,
  });
  @override
  _SimpleCustomWidget createState() => _SimpleCustomWidget();
}
class _SimpleCustomWidget extends State<SimpleCustomWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10.0)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '${widget.title}: $_counter',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _incrementCounter, 
            child: const Text('Increment'),
          ),
        ])
    );
  }
}