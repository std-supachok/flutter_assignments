import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class AnimatedTest extends StatefulWidget{
  const AnimatedTest({super.key});

  @override
  State<AnimatedTest> createState() => _AnimatedTestState();
} 

class _AnimatedTestState extends State<AnimatedTest> {
double _size = 100;
Color _color = Colors.blue;
double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacity,
              child: Container(
                height: _size,
                width: _size,
                color : _color,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
              setState(() {
                _size = _size == 100 ? 200 : 100;
                _color = _color == Colors.blue ? Colors.red : Colors.blue;
                _opacity = _opacity == 1.0 ? 0.5 : 1.0;
              });
            }, 
            child: Text("Animated Box"))
          ],
        ),
      ),
    );
  }
}