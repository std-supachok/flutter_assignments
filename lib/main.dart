//import 'package:first_app/Week3_Assignment.dart';
//import 'package:first_app/counter_widget.dart';
//import 'package:first_app/greeting_widget.dart';
//import 'package:first_ap  p/navigation_ex/first_page.dart';
//import 'package:first_app/navigation_ex/second_page.dart';
//import 'package:first_app/greeting_widget.dart';
//import 'package:first_app/form/form_input.dart';
//import 'package:first_app/api_example/api_example.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:first_app/simple_custom_widget.dart';
//import 'package:first_app/form/form_input.dart';
//import 'package:first_app/form/from_example1.dart';
import 'package:flutter/material.dart';
//import 'package:first_app/form/from_example1.dart';
import 'firebase_options.dart';
//import 'animeted_test.dart';
//import 'api_example/firestore_test.dart';
//import 'api_example/product_page.dart';
import 'traffig_light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const TraffigLight(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => FirstPage(),
        //'/second': (context) => SecondPage()
      //},
    );
  }
}