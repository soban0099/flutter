import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendingapp/app/services/network_binding.dart';
import 'package:trendingapp/presentations/home/home_screen.dart';
import 'package:trendingapp/theme/app_theme.dart';

import '../routes/app_routing.dart';
import '../utils/scroll_behavior.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MyScrollBehavior(),
      debugShowCheckedModeBanner: false,
      initialBinding: NetworkBinding(),
      getPages: RoutingModule().routingList,
      title: 'Trending Repositories',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
