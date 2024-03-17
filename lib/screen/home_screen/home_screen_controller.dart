import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  Rx<TextEditingController> country = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;

  RxBool isRunning = false.obs;
  UserCredential? args;
  var params;
  RxString userProfileImage = "".obs;
  RxString userMailId = "".obs;
  RxString userName = "".obs;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments;
    params = Get.parameters;
    if(args != null){
      userProfileImage.value = args!.additionalUserInfo!.profile?["picture"];
      userMailId.value = args!.additionalUserInfo!.profile?["email"];
      userName.value = args!.additionalUserInfo!.profile?["name"];
    } else if(params !=null){
      userMailId.value = params["email"];
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  clearAllTextField() {
    country.value.text = "";
    phone.value.text = "";
    email.value.text = "";
  }
}
