import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:app_install_events/app_install_events.dart';
import 'package:app_usage/app_usage.dart';

class AppUsageListModel extends ChangeNotifier {
  List<AppUsageInfo> _appUsageList = [];

  List<AppUsageInfo> get appUsageList => _appUsageList;

  late AppIUEvents _appIUEvents;

  AppUsageListModel() {
    init();
  }

  Future<void> getUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day);
      List<AppUsageInfo> infoList =
          await AppUsage().getAppUsage(startDate, endDate);
      infoList.sort(
          (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
      print(_appUsageList);
      for (var info in infoList) {
        // print(info.toString());
      }
    } on AppUsageException catch (exception) {
      print(">>> Exception: $exception");
    }

    notifyListeners();
  }

  // Future<void> getApplications() async {
  //   try {
  //     _appInfoList.clear();
  //     List<AppUsageInfo> installedApps = await InstalledApps.getInstalledApps();
  //     installedApps
  //         .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  //     _appInfoList = installedApps;
  //     _filteredAppInfoList.addAll(_appInfoList);
  //   } catch (e) {
  //     // Handle error if unable to fetch installed apps
  //     // print('Error fetching installed apps: $e');
  //   }
  //   notifyListeners();
  // }

  void init() async {
    // Fetch initial list of app usage
    await getUsageStats();
    _appIUEvents = AppIUEvents();

    // Listen for app installation and uninstallation events
    _appIUEvents.appEvents.listen(
      (event) async {
        if (event.type == IUEventType.installed ||
            event.type == IUEventType.uninstalled) {
          // Refresh the list of app usage when an installation or uninstallation event occurs
          await getUsageStats();
        }
      },
    );
  }

  AppUsageInfo? onSearch(String value) {
    AppUsageInfo application =
        _appUsageList.firstWhere((element) => element.packageName == value);
    return application;
  }
}
