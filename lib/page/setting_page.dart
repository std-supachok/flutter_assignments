import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SharedPreferences? prefs;

  void setNotification() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool('_turnOnnoti', _turnOnnoti);
    setState(() {
      
    });
  }

  bool _turnOnnoti = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting Page")),
        body: ListView(
          children: [
            SwitchListTile(
              title: Text("notification"),
              secondary: Icon(Icons.notifications),
              value: prefs?.getBool('_turnOnnoti') ?? false, 
              onChanged: (bool? value) {  },)
          ],
        )
      );
  }
}