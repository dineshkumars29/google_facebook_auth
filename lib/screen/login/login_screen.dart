import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frameslab/route/app_route.dart';
import 'package:frameslab/screen/login/login_controller.dart';
import 'package:frameslab/services/common_widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:swarnam/services/phone_number_code.json';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Obx(() {
          return ModalProgressHUD(
              inAsyncCall: controller.inAsync.value,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img1.png',
                          width: 180,
                          height: 180,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Welcome back!",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Glad to see you, Again!",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                cursorColor: Colors.blue,
                                controller: controller.email.value,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white),
                                    counterStyle:
                                        TextStyle(color: Colors.white),
                                    labelStyle: TextStyle(color: Colors.white)),

                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    cursorColor: Colors.blue,
                                    controller: controller.password.value,
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: controller.passwordText.value,
                                    decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            controller.toggle();
                                          },
                                          child: Icon(
                                            controller.passwordText.value
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 15.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: const TextStyle(color: Colors.white),
                                        counterStyle:
                                        const TextStyle(color: Colors.white),
                                        labelStyle: const TextStyle(color: Colors.white)),

                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: ()  async{
                              if (controller.email.value.text.trim() == "" ||
                                  controller.password.value.text.trim() == "" || controller.email.value.text.isEmpty || controller.password.value.text.isEmpty) {
                                CommonWidget.message(context, "Enter Your Login Credentials Correctly");
                                return;
                              }
                              CommonWidget().checkPassword(context,controller.password.value.text);
                              if (CommonWidget().validateEmail(controller.email.value.text) != null) {
                                CommonWidget.message(context, "Enter a valid email address");
                                return;
                              }

                                User? userDetails = await controller
                                    .signInWithEmailAndPassword(
                                    context);

                                if (userDetails?.uid != null) {
                                  final Map<String, String> value = {
                                    "email": userDetails!.email.toString()
                                  };

                                  Get.toNamed(AppRoutes.homeScreen,
                                      parameters: value);
                                }


                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber[400],
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  )),
                            )),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.registerScreen);
                          },
                          child: const Text("SignUp Here", style: TextStyle(color: Colors.white,
                              decoration: TextDecoration.underline,decorationColor: Colors.white, decorationStyle: TextDecorationStyle.dashed),textAlign: TextAlign.end,),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        InkWell(
                            onTap: () async{
                              final UserCredential result = await controller.signInWithGoogle();
                              if(result.additionalUserInfo!.profile!["email"] != null ||  result.additionalUserInfo!.profile!["email"] != ""){
                                Get.offAllNamed(AppRoutes.homeScreen, arguments: result);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 0.5),borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                              height: 50,
                                child: ClipOval(child: Image.asset("assets/google.jpg",height: 40,))),
                                                )
                      ],
                    ),
                  ),
                ),
              ));
        }));
  }
}
