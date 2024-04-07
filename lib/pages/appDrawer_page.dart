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
      applications.sort(
          (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
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
            final application = applications[index] as ApplicationWithIcon;
            return ListTile(
              onTap: () {
                DeviceApps.openApp(application.packageName);
              },
              onLongPress: () {
                DeviceApps.openAppSettings(application.packageName);
              },
              title: Text(
                application.appName,
                style: const TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
    ;
  }
}
