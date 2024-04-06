import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

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
        body: GestureDetector(
          onVerticalDragDown: (DragDownDetails details) {
            Navigator.pushNamed(context, "apps");
          },
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const SizedBox(height: 48),
                DigitalClock(
                    textScaleFactor: 2,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    showSeconds: false,
                    isLive: true,
                    digitalClockTextColor: Colors.white,
                    // decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     shape: BoxShape.rectangle,
                    //     borderRadius: BorderRadius.all(Radius.circular(15))),
                    datetime: DateTime.now()),
                const SizedBox(height: 32),
                const Text(
                  "Fav App 1",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Fav App 2",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Fav App 3",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
