import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';

class AppUsagePage extends StatefulWidget {
  const AppUsagePage({super.key});

  @override
  State<AppUsagePage> createState() => _AppUsagePageState();
}

class _AppUsagePageState extends State<AppUsagePage> {
  List<AppUsageInfo> _infos = [];

  @override
  void initState() {
    super.initState();
  }

  void getUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day);
      // DateTime startDate = endDate.subtract(const Duration(hours: 1));
      List<AppUsageInfo> infoList =
          await AppUsage().getAppUsage(startDate, endDate);
      infoList.sort(
          (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
      setState(() => _infos = infoList);

      for (var info in infoList) {
        print(info.toString());
      }
    } on AppUsageException catch (exception) {
      print(">>> Exception: $exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('App Usage Example'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: _infos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _infos[index].appName,
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                _infos[index].packageName.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              trailing: Text(
                _infos[index].usage.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: getUsageStats,
        child: const Icon(Icons.file_download),
      ),
    );
  }
}
