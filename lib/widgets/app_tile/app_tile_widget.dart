import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class AppTile extends StatelessWidget {
  final AppInfo application;
  const AppTile({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
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
  }
}
