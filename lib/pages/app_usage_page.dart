import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';
import 'package:pebble/models/appusage_list_model.dart';
import 'package:provider/provider.dart';

class AppUsagePage extends StatefulWidget {
  const AppUsagePage({super.key});

  @override
  State<AppUsagePage> createState() => _AppUsagePageState();
}

class _AppUsagePageState extends State<AppUsagePage> {
  // List<AppUsageInfo> _infos = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  // }

  // void getUsageStats() async {
  //   try {
  //     DateTime endDate = DateTime.now();
  //     DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day);
  //     // DateTime startDate = endDate.subtract(const Duration(hours: 1));
  //     List<AppUsageInfo> infoList =
  //         await AppUsage().getAppUsage(startDate, endDate);
  //     infoList.sort(
  //         (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
  //     setState(() => _infos = infoList);
  //
  //     for (var info in infoList) {
  //       print(info.toString());
  //     }
  //   } on AppUsageException catch (exception) {
  //     print(">>> Exception: $exception");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final appUsageNotifier =
    Provider.of<AppUsageListModel>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('App Usage Example'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: appUsageNotifier.appUsageList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                appUsageNotifier.appUsageList[index].appName,
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                appUsageNotifier.appUsageList[index].packageName.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              trailing: Text(
                appUsageNotifier.appUsageList[index].usage.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appUsageNotifier.getUsageStats();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }
}
