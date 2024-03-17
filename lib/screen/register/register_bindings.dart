import 'package:frameslab/screen/login/login_controller.dart';
import 'package:frameslab/screen/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }
}
