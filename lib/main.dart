import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsf/authentication/authentication_controller.dart';
import 'package:rsf/authentication/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD-jTrQb7Td3GVi60-E7da1L_teZpgrXNo',
        appId: '1:229522913706:android:995acbb77fc15f5867d3d3',
        messagingSenderId: '229522913706',
        projectId: 'the-real-south-face',
      ),
    );
  } else {
    await Firebase.initializeApp().then((value) => null);
  }

  Get.put<AuthenticationController>(AuthenticationController());


  /*await Firebase.initializeApp().then((value) {

    Get.put<AuthenticationController>(AuthenticationController());
    //Get.lazyPut(()=>AuthenticationController());

  });*/
  // Alternatively, you can use lazyPut
  // Get.lazyPut(() => AuthenticationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Real South Face',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const LoginScreen(),
    );
  }
}
