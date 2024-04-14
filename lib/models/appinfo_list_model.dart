import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class AppInfoListModel extends ChangeNotifier {
  List<AppInfo> _appInfoList = [];

  List<AppInfo> get appInfoList => _appInfoList;

  AppInfoListModel(){
    getApplications();
  }

  void getApplications() async {
    _appInfoList = await InstalledApps.getInstalledApps();
    _appInfoList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    notifyListeners();
  }
}
