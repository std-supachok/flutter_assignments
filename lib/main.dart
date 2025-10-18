import 'package:flutter/material.dart';
import 'components/profile_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Widget Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CustomWidgetPage(),
    );
  }
}

class CustomWidgetPage extends StatelessWidget {
  const CustomWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Widget')),
      body: Center(
        child: ProfileCard(
          name: 'Supachok Hangnak',
          position: 'Gamer',
          email: 'hangnak_s@silpakorn.edu',
          phoneNumber: '0632690967',
          imageAsset: 'assets/image/me.jpg',
        ),
      ),
    );
  }
}
