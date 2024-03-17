import 'package:frameslab/screen/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeScreenController>(HomeScreenController());
  }
}
