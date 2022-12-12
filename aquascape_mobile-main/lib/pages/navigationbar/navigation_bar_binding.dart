import 'package:aquascape_mobile/pages/navigationbar/navigation_bar_controller.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';
import '../profile/profile_controller.dart';

class NavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationBarController>(() => NavigationBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
