import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class AppDrawerPage extends StatefulWidget {
  const AppDrawerPage({super.key});

  @override
  State<AppDrawerPage> createState() => _AppDrawerPageState();
}

class _AppDrawerPageState extends State<AppDrawerPage> {
  List<Application> applications = [];

  void getApplications() async {
    final apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
    setState(() {
      applications = apps;
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
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          final application = applications[index] as ApplicationWithIcon;
          return ListTile(
            title: Text(
              application.appName,
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
    ;
  }
}