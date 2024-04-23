import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GestureDetector(
          onVerticalDragUpdate: (details) {
            int sensitivity = 4;
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
                        digitalClockTextColor:
                            Theme.of(context).colorScheme.onBackground,
                        datetime: DateTime.now()),
                    const SizedBox(height: 32),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onTap: () => openUrl("camera:"),
                      title: const Text(
                        "Camera",
                        style: TextStyle(fontSize: 28),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onTap: () => openUrl("tel:"),
                      title: const Text(
                        "Phone Dialer",
                        style: TextStyle(fontSize: 28),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onTap: () => openUrl("sms:"),
                      title: const Text(
                        "Messages",
                        style: TextStyle(fontSize: 28),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onTap: () => openUrl("https://www.google.com/"),
                      title: const Text(
                        "Browser",
                        style: TextStyle(fontSize: 28),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                // const Spacer(),

                // App Drawer Icons
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "apps");
                  },
                  padding: const EdgeInsets.all(32),
                  iconSize: 40,
                  icon: Icon(
                    Icons.arrow_upward_rounded,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // Handle error when the camera cannot be opened
    }
  }
}
