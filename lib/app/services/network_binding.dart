 
import 'package:get/get.dart';
import 'package:trendingapp/presentations/home/controller/home_controller.dart';
 

import 'network_manager.dart';

class NetworkBinding extends Bindings { 
  @override
  void dependencies() {
    Get.put(GetXNetworkManager(), permanent: true);
    Get.lazyPut(() => HomeController());
   
  }
}
