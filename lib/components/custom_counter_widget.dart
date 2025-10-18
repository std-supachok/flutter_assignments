import 'package:flutter/material.dart';

class CustomCounterWidget extends StatefulWidget{
  final String title;
  final Color backgroundColor;
  const CustomCounterWidget({
    super.key,
    required this.title,
    required this.backgroundColor,
  });

  @override
  State<CustomCounterWidget> createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
       color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
       child: Column(
        children: [
          Text('TEAM A'),
          const SizedBox(height: 16),
          Text(
            '$_counter',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment'),
          ),
        ],
       ),
    );
  }
}