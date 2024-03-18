import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/HomeScreen.dart';
import 'package:flutter_provider/streamBuilder/streamBuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true
      ),
      // home:const HomeScreen(), //for Provider
      home:streamBuilder(), //for streamBuilder
    );
  }
}
