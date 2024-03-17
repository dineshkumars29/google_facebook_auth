import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frameslab/route/app_route.dart';
import 'package:frameslab/screen/home_screen/home_screen_controller.dart';
import 'package:frameslab/services/common_widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 219, 233, 199),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 219, 233, 199),
          elevation: 0.0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: Text('Hello ${controller.args != null ? controller.args?.additionalUserInfo!.profile!["given_name"] : "Buddy"}'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                controller.userProfileImage.value != "" ? ClipOval(child: Image.network(controller.userProfileImage.toString(),)) : Container(),
                const SizedBox(height: 20,),
                controller.userName.value
                != ""
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("User Name:" ,textAlign: TextAlign.start,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width /1.8 ,
                        child: Text(controller.userName.toString()))
                  ],
                ) : Container(),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("User Email:",textAlign: TextAlign.start,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /1.8 ,
                        child: Text(controller.userMailId.toString()))
                  ],
                ),
                const SizedBox(height: 50,),
                ElevatedButton(onPressed: () async{
                  if(controller.args != null) {
                    var result = await controller.signOutFromGoogle();
                    if (result == true) {
                      Get.offAllNamed(AppRoutes.loginScreen);
                      CommonWidget.message(
                          context, "You have successfully logged out!");
                    }
                  } else {
                    Get.offAllNamed(AppRoutes.loginScreen);
                    CommonWidget.message(
                        context, "You have successfully logged out!");
                  }
                }, child: const Text("Sign Out"))
              ],
            ),
          ),
        ));
  }
}
