import 'package:flutter/material.dart';
import 'package:pebble/models/appinfo_list_model.dart';
import 'package:pebble/widgets/app_tile/app_tile_widget.dart';
import 'package:provider/provider.dart';

class AppDrawerPage extends StatefulWidget {
  const AppDrawerPage({super.key});

  @override
  State<AppDrawerPage> createState() => _AppDrawerPageState();
}

class _AppDrawerPageState extends State<AppDrawerPage> {
  @override
  Widget build(BuildContext context) {
  final appInfoNotifier = Provider.of<AppInfoListModel>(context, listen:true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 32, top: 32, right: 32),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: appInfoNotifier.appInfoList.length,
                  itemBuilder: (context, index) {
                    final application = appInfoNotifier.appInfoList[index];
                    return AppTile(application: application);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}