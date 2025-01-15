import 'package:get/get.dart';
import 'package:trendingapp/presentations/home/binding/home_binding.dart';
import 'package:trendingapp/presentations/home/home_screen.dart';

import 'app_routes.dart';

class RoutingModule {
  List<GetPage> routingList = [
    GetPage(
      name: Routes.home,
      page: () =>  HomeScreen(),
      binding: HomeBinding(),
    ),
   
  ];
}
