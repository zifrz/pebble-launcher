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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Total App Usage'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: ListView.builder(
          itemCount: appUsageNotifier.appUsageList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                appUsageNotifier.appUsageList[index].appName,
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                appUsageNotifier.appUsageList[index].packageName.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              ),
              trailing: Text(
                appUsageNotifier.appUsageList[index].usage.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appUsageNotifier.getUsageStats();
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.refresh_rounded,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
