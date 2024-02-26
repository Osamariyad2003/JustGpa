import 'package:flutter/material.dart';
import 'package:gpa/modules/semeterNumber.dart';
import 'package:gpa/spalsh.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor:  Colors.indigo.shade800),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}


 