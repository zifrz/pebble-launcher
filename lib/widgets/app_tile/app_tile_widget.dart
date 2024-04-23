import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:pebble/models/appusage_list_model.dart';
import 'package:pebble/widgets/app_info_bottomsheet/app_info_detail.dart';
import 'package:provider/provider.dart';

class AppTile extends StatelessWidget {
  final AppInfo application;

  const AppTile({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    final appUsageNotifier =
        Provider.of<AppUsageListModel>(context, listen: true);

    var appUsagInMins =
        appUsageNotifier.onSearch(application.packageName).usage.inMinutes;
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        if (appUsagInMins > 15) {
          _dialogBuilder(context);
        } else {
          InstalledApps.startApp(application.packageName);
        }
      },
      onLongPress: () {
        showModalBottomSheet(
            // backgroundColor: const Color.fromRGBO(5, 5, 5, 1.0),
            context: context,
            builder: (BuildContext builder) {
              return AppInfoDetail(application: application);
            });
      },
      title: Text(
        application.name,
        style: const TextStyle(fontSize: 24),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("App Over Use"),
          content: Text(
              'You have used app ${application.name} for more than 15 mins. Do you want to continue.'),
          actions: [
            TextButton(
              onPressed: () {
                InstalledApps.startApp(application.packageName);
              },
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text("Continue"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text("Return"),
            ),
          ],
        );
      },
    );
  }
}
