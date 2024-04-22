import 'package:flutter/material.dart';
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
      _appUsageList = infoList;
      notifyListeners(); // Notify listeners about the data update
    } catch (exception) {
      // Handle error if unable to fetch apps usage
      // print('Error fetching apps usage: $exception');
    }
  }

  AppUsageInfo onSearch(String value) {
    for (var info in _appUsageList) {
      if (info.packageName.compareTo(value) == 0) {
        return info; // Return the matching AppUsageInfo object
      }
    }
    DateTime endDate = DateTime.now();
    DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day);
    return AppUsageInfo("none", 0, startDate, startDate,
        startDate); // Return if no match is found
  }

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
}
