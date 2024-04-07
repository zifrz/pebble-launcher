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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, "apps");
        //   },
        //   isExtended: true,
        //   elevation: 0,
        //   backgroundColor: Colors.black87,
        //   child: const Icon(
        //     Icons.arrow_upward_rounded,
        //     color: Colors.white,
        //     size: 40,
        //   ),
        // ),
        body: GestureDetector(
          onVerticalDragDown: (DragDownDetails details) {
            Navigator.pushNamed(context, "apps");
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
