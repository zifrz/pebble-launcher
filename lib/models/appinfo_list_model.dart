import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:app_install_events/app_install_events.dart';

class AppInfoListModel extends ChangeNotifier {
  List<AppInfo> _appInfoList = [];

  List<AppInfo> get appInfoList => _appInfoList;

  late AppIUEvents _appIUEvents;

  AppInfoListModel() {
    init();
  }

  Future<void> getApplications() async {
    try {
      List<AppInfo> installedApps = await InstalledApps.getInstalledApps();
      installedApps
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      _appInfoList = installedApps;
    } catch (e) {
      // Handle error if unable to fetch installed apps
      print('Error fetching installed apps: $e');
    }
    notifyListeners();
  }

  void init() async {
    // Fetch initial list of installed apps
    await getApplications();
    _appIUEvents = AppIUEvents();

    // Listen for app installation and uninstallation events
    _appIUEvents.appEvents.listen(
      (event) {
        if (event.type == IUEventType.installed ||
            event.type == IUEventType.uninstalled) {
          // Refresh the list of installed apps when an installation or uninstallation event occurs
          getApplications();
        }
      },
    );
  }

  @override
  void dispose() {
    // Dispose the model when the widget is disposed
    _appIUEvents.dispose();
    super.dispose();
  }
}
