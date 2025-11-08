import 'package:flutter/material.dart';

class TraffigLight extends StatefulWidget {
  const TraffigLight({super.key});

  @override
  State<TraffigLight> createState() => _TraffigLightState();
}

class _TraffigLightState extends State<TraffigLight> {
   // ฟังก์ชันสร้างวงกลม
  Widget buildCircle(Color color) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
    );
  }
  double opacityRed = 1.0;
  double opacityYellow = 0.3;
  double opacityGreen = 0.3;
  void ChangeLight() {
    setState(() {
      if (opacityRed == 1.0) {
        opacityRed = 0.3;
        opacityYellow = 1.0;
        opacityGreen = 0.3;
      } else if (opacityYellow == 1.0) {
        opacityRed = 0.3;
        opacityYellow = 0.3;
        opacityGreen = 1.0;
      } else {
        opacityRed = 1.0;
        opacityYellow = 0.3;
        opacityGreen = 0.3;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Light'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacityRed,
              duration: const Duration(seconds: 1),
              child: buildCircle(Colors.red),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: opacityYellow,
              duration: const Duration(seconds: 1),
              child: buildCircle(Colors.yellow),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: opacityGreen,
              duration: const Duration(seconds: 1),
              child: buildCircle(Colors.green),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: ChangeLight, child: Text("ChangLight"))
          ],
        ),
      )
    );
  }
}