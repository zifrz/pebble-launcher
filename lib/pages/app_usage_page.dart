import 'package:flutter/material.dart';
import 'package:pebble/models/appusage_list_model.dart';
import 'package:provider/provider.dart';

class AppUsagePage extends StatefulWidget {
  const AppUsagePage({super.key});

  @override
  State<AppUsagePage> createState() => _AppUsagePageState();
}

class _AppUsagePageState extends State<AppUsagePage> {
  @override
  Widget build(BuildContext context) {
    final appUsageNotifier =
        Provider.of<AppUsageListModel>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Total App Usage'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: appUsageNotifier.appUsageList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                appUsageNotifier.appUsageList[index].appName,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                appUsageNotifier.appUsageList[index].packageName.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Text(
                appUsageNotifier.appUsageList[index].usage.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appUsageNotifier.getUsageStats();
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.refresh_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
