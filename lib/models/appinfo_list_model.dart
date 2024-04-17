import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:app_install_events/app_install_events.dart';
// import 'package:app_install_events/';

class AppInfoListModel extends ChangeNotifier {
  List<AppInfo> _appInfoList = [];

  List<AppInfo> get appInfoList => _appInfoList;

  late AppIUEvents _appIUEvents;

  void getApplications() async {
    _appInfoList = await InstalledApps.getInstalledApps();
    _appInfoList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    notifyListeners();
  }

  AppInfoListModel() {
    _appIUEvents = AppIUEvents();
    getApplications();

    _appIUEvents.appEvents.listen((event) {
      // Check if the event is an install event
      if (event.type == IUEventType.installed) {
        print("App installed: ${event.packageName}");
        getApplications();
      }

      // Check if the event is an uninstall event
      if (event.type == IUEventType.uninstalled) {
        print("App uninstalled: ${event.packageName}");
        getApplications();
      }
    });
  }
}
