import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frameslab/route/app_page.dart';
import 'package:frameslab/route/app_route.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // firebase core

  Platform.isAndroid
      ? await Firebase.initializeApp(
          // Replace with actual values
          options: const FirebaseOptions(
            apiKey: "AIzaSyBl7AlB95r0kUq_ao2j1VQRkf-NMU1cVF4",
            appId: "1:297220374848:android:ca2911a21798c988413aa5",
            messagingSenderId: "297220374848",
            projectId: "facebook-auth-143ff",
          ),
        )
      : Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.loginScreen,
    );
  }
}
