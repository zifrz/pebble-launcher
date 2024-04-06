import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "apps");
          },
          elevation: 0,
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.apps,
            color: Colors.black87,
          ),
        ),
        body: const Center(
          child: Text(
            "Home page",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
