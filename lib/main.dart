import 'package:flutter/material.dart';
import 'package:pebble/pages/AppDrawerPage.dart';
import 'package:pebble/pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pebble",
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "apps": (_) => AppDrawerPage(),
      },
    );
  }
}
