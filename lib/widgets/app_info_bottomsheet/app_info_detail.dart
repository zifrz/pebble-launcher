import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:pebble/models/appusage_list_model.dart';
import 'package:provider/provider.dart';

class AppInfoDetail extends StatelessWidget {
  final AppInfo application;

  const AppInfoDetail({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    final appUsageNotifier =
    Provider.of<AppUsageListModel>(context, listen: true);
    return ListView(
        padding: const EdgeInsets.all(32),
        shrinkWrap: true,
        children: [
          ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Text(
              application.name,
              style: const TextStyle(fontSize: 24),
              overflow: TextOverflow.ellipsis,
            ),
            leading: Text("${appUsageNotifier.onSearch(application.packageName)?.usage}"),
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded, color: Colors.white,),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text(
              'App Info',
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              InstalledApps.openSettings(application.packageName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_rounded, color: Colors.white,),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text(
              'Uninstall',
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              InstalledApps.uninstallApp(application.packageName);
            },
          )
        ]);
  }
}
