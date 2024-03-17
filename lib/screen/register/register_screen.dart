import 'package:flutter/material.dart';
import 'package:frameslab/route/app_route.dart';
import 'package:frameslab/screen/register/register_controller.dart';
import 'package:frameslab/services/common_widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Obx(() {
          return ModalProgressHUD(
              inAsyncCall: controller.inAsync.value,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Image.asset(
                        'assets/img2.png',
                        width: 180,
                        height: 180,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Hello!",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Register to get started",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 55,
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
                              style: TextStyle(color: Colors.white),
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
                        height: 55,
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
                                  style: TextStyle(color: Colors.white),
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
                                      hintStyle: TextStyle(color: Colors.white),
                                      counterStyle:
                                      TextStyle(color: Colors.white),
                                      labelStyle: TextStyle(color: Colors.white)
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 55,
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
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.blue,
                                  controller: controller.confirmPassword.value,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: controller.confirmPasswordText.value,
                                  decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          controller.confirmToggle();
                                        },
                                        child: Icon(
                                          controller.confirmPasswordText.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: 15.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Confirm Password",
                                      counterStyle:
                                      TextStyle(color: Colors.white),
                                      hintStyle: TextStyle(color: Colors.white),
                                      labelStyle: TextStyle(color: Colors.white)),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 43, 200, 221),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              if (controller.email.value.text.trim() == "" ||
                                  controller.password.value.text.trim() == "" ||
                                  controller.email.value.text.isEmpty ||
                                  controller.password.value.text.isEmpty) {
                                CommonWidget.message(context, "Enter Your Login Credentials Correctly");
                                return;
                              }
                              if(controller.password.value.text != controller.confirmPassword.value.text){
                                CommonWidget.message(context, "Password and confirm password does not match");
                                return;
                              }
                              CommonWidget().checkPassword(context,controller.password.value.text);
                              CommonWidget().checkPassword(context,controller.confirmPassword.value.text);
                              if (CommonWidget().validateEmail(controller.email.value.text) != null) {
                                CommonWidget.message(context, "Enter a valid email address");
                                return;
                              }
                              controller.signUpWithEmailAndPassword(context);
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: const Text("Already have a Account...", style: TextStyle(color: Colors.white),),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                    ],
                  ),
                ),
              ));
        }));
  }
}
