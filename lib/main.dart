import 'package:flutter/material.dart';
import 'package:pebble/models/appinfo_list_model.dart';
import 'package:pebble/models/appusage_list_model.dart';
import 'package:pebble/pages/app_drawer_page.dart';
import 'package:pebble/pages/app_search_page.dart';
import 'package:pebble/pages/app_usage_page.dart';
import 'package:pebble/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppInfoListModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppUsageListModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pebble",
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        "app_drawer": (_) => const AppDrawerPage(),
        "app_searcher": (_) => const AppSearchPage(),
        "app_usage": (_) => const AppUsagePage(),
      },
    );
  }
}
