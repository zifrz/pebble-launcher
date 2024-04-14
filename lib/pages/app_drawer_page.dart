import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class AppDrawerPage extends StatefulWidget {
  const AppDrawerPage({super.key});

  @override
  State<AppDrawerPage> createState() => _AppDrawerPageState();
}

class _AppDrawerPageState extends State<AppDrawerPage> {
  List<AppInfo> applications = [];

  void getApplications() async {
    final apps = await InstalledApps.getInstalledApps();

    setState(() {
      applications = apps;
      applications.sort(
              (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      // applications.sort(
      //     (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
      // applications.sort()
    });
  }

  @override
  void initState() {
    super.initState();
    getApplications();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: ListView.builder(
          padding:
              const EdgeInsets.only(left: 32, top: 32, right: 32, bottom: 96),
          itemCount: applications.length,
          itemBuilder: (context, index) {
            final application = applications[index];
            return ListTile(
              onTap: () {
                InstalledApps.startApp(application.packageName);
              },
              onLongPress: () {
                InstalledApps.openSettings(application.packageName);
              },
              title: Text(
                application.name,
                style: const TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
