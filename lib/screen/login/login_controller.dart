import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frameslab/services/common_widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  RxBool passwordText = true.obs;
  RxBool autoValidate = false.obs;
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

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      print(credential);

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  Future<User?> signInWithEmailAndPassword(context) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email.value.text, password: password.value.text);
      return credential.user;
    } catch (err) {
      if (err is FirebaseAuthException &&
          err.code == "INVALID_LOGIN_CREDENTIALS") {
        CommonWidget.message(context, "Invalid Login Credentials");
        return null;
      }
      if (err is FirebaseAuthException &&
          err.code == "invalid-email") {
        CommonWidget.message(context, "The email address is badly formatted");
        return null;
      }
      if(err is FirebaseAuthException && err.code == "invalid-credential"){
        CommonWidget.message(context, "user not found");
        return null;
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
