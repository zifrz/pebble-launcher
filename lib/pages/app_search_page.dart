import 'package:flutter/material.dart';
import 'package:pebble/models/appinfo_list_model.dart';
import 'package:pebble/widgets/app_search_bar/app_search_bar_widget.dart';
import 'package:pebble/widgets/app_tile/app_tile_widget.dart';
import 'package:provider/provider.dart';

class AppSearchPage extends StatefulWidget {
  const AppSearchPage({super.key});

  @override
  State<AppSearchPage> createState() => _AppSearchPageState();
}

class _AppSearchPageState extends State<AppSearchPage> {
  @override
  Widget build(BuildContext context) {
    final appInfoNotifier =
        Provider.of<AppInfoListModel>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 32, top: 32, right: 32),
          child: Column(
            children: [
              AppSearchBar(onChanged: appInfoNotifier.onSearch),
              const SizedBox(height: 24),
              Flexible(
                child: appInfoNotifier.filteredAppInfoList.isEmpty
                    ? const Text('No apps found for your search')
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: appInfoNotifier.filteredAppInfoList.length,
                        itemBuilder: (context, index) {
                          if (appInfoNotifier.filteredAppInfoList.isEmpty) {
                            return const Text(
                              'No apps found for your search',
                              style: TextStyle(fontSize: 20),
                            ); // Display message for empty list
                          } else {
                            final application =
                                appInfoNotifier.filteredAppInfoList[index];
                            return AppTile(application: application);
                          }
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