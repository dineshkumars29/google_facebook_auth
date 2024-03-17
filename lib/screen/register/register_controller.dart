import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> confirmPassword = TextEditingController().obs;
  RxBool passwordText = true.obs;
  RxBool confirmPasswordText = true.obs;
  RxString phoneCode = "91".obs;
  List<String> simNumbers = [];
  bool isSupported = true;
  RxBool inAsync = false.obs;
  RxBool isPhoneNumberClicked = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  // -----
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  toggle() {
    passwordText.value = !passwordText.value;
  }
  confirmToggle() {
    confirmPasswordText.value = !confirmPasswordText.value;
  }

  Future<User?> signUpWithEmailAndPassword(context) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email.value
          .text, password: password.value.text);
      // return credential.user;
      if (credential.user != null && credential.user?.uid != null) {
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Registration was successful"),
        ));
      }
    } catch (err) {
      if (err is FirebaseAuthException &&
          err.code == "INVALID_LOGIN_CREDENTIALS") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.message.toString()),
        ));
        return null;
      }
      if (err is FirebaseAuthException &&
          err.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
          Text(err.message.toString()),
        ));
        return null;
      }
      if (err is FirebaseAuthException &&
          err.code == "invalid-email") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
          Text(err.message.toString()),
        ));
      }
      if (err is FirebaseAuthException &&
          err.code == "network-request-failed") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('A network error has occurred.'),
        ));
        return null;
      }
      if (err is FirebaseAuthException &&
          err.code == "unknown") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Connection error has occurred.'),
        ));
        return null;
      }
    }
    return null;
  }

}
