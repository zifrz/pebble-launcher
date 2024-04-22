import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:pebble/pages/app_usage_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AppUsagePage()));
          },
        ),
        body: GestureDetector(
          onVerticalDragUpdate: (details) {
            int sensitivity = 8;
            if (details.delta.dy > sensitivity) {
              // Down Swipe
              Navigator.pushNamed(context, "app_searcher");
            } else if (details.delta.dy < -sensitivity) {
              // Up Swipe
              Navigator.pushNamed(context, "app_drawer");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Column Containing Clock and Favourite Apps
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48),
                    DigitalClock(
                        textScaleFactor: 2,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        showSeconds: false,
                        isLive: true,
                        digitalClockTextColor: Colors.white,
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

                // App Drawer Icons
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "apps");
                  },
                  padding: const EdgeInsets.all(32),
                  iconSize: 40,
                  icon: const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
