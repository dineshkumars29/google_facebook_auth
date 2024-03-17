import 'package:frameslab/screen/home_screen/home_screen.dart';
import 'package:frameslab/screen/home_screen/home_screen_bindings.dart';
import 'package:frameslab/screen/login/login_bindings.dart';
import 'package:frameslab/screen/login/login_screen.dart';
import 'package:frameslab/screen/register/register_bindings.dart';
import 'package:frameslab/screen/register/register_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage(
      name: "/loginScreen",
      page: () => const LoginScreen(),
      binding: LoginBindings(),
      preventDuplicates: true,
    ),
    GetPage(
      name: "/registerScreen",
      page: () => const RegisterScreen(),
      binding: RegisterBindings(),
      preventDuplicates: true,
    ),
    GetPage(
      name: "/homeScreen",
      page: () => const HomeScreen(),
      binding: HomeScreenBindings(),
      preventDuplicates: true,
    ),
  ];
}
