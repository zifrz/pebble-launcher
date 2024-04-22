import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:pebble/widgets/app_info_bottomsheet/app_info_detail.dart';

class AppTile extends StatelessWidget {
  final AppInfo application;

  const AppTile({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        InstalledApps.startApp(application.packageName);
      },
      onLongPress: () {
        showModalBottomSheet(
            // isScrollControlled: true,
            backgroundColor: const Color.fromRGBO(5, 5, 5, 1.0),
            context: context,
            builder: (BuildContext builder) {
              return AppInfoDetail(application: application);
            });
        // InstalledApps.openSettings(application.packageName);
      },
      title: Text(
        application.name,
        style: const TextStyle(fontSize: 24),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
