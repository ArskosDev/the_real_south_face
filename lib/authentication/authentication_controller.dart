import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rsf/authentication/login_screen.dart';
import 'package:rsf/global.dart';
import 'user.dart' as userModel;

class AuthenticationController extends GetxController {
  static AuthenticationController instanceAuth = Get.find();

  // ignore: prefer_final_fields
  Rx<File?> _pickedFile = Rx<File?>(null);
  File? get profileImage => _pickedFile.value;

  void chooseImageFromGallery() async {
    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImageFile != null) {
      Get.snackbar(
        "Profile image",
        "You have successfully selected your profile image.",
      );
    }

    _pickedFile.value = File(pickedImageFile!.path);
  }

  void captureImageFromCamera() async {

    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImageFile != null) {
      Get.snackbar(
        "Profile image",
        "You have successfully captured your profile image.",
      );
    }

    _pickedFile.value = File(pickedImageFile!.path);
  }

  Future<void> createAccountForNewUser(File profileImage,String userName, String userEmail, String userPassword)
  async {
    try{
      // Implement your account creation logic using the selected profile image and user details

      //1. create user in the firebase authentication

      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      //2. save the user profile image in the firebase storage

      String imageDownloadUrl = await uploadImageToStorage(profileImage);

      //3. save user data to the firestore database

      userModel.User user = userModel.User(
        name: userName,
        email: userEmail,
        image: imageDownloadUrl,
        uid: credential.user!.uid,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set(user.toJason());
    }
    catch(error){

      // Use specific exceptions for better error handling
      if (error is FirebaseAuthException) {
        Get.snackbar("Authentication Error", error.message ?? "Error occurred while creating user account");
      } else if (error is FirebaseException) {
        Get.snackbar("Firebase Storage Error", error.message ?? "Error occurred while uploading image");
      } else {
        Get.snackbar("Account creation unsuccessful", "Error occurred while creating user account");
      }
      showProgressBar = false;
      Get.to(() => const LoginScreen());
      //Get.to(const LoginScreen());

    }



  }

  Future<String> uploadImageToStorage(File? profileImage)
  async {

    try {
      if (profileImage == null) {
        throw Exception("Profile image is null");
      }

      if (!profileImage.existsSync()) {
        throw Exception("Profile image file does not exist");
      }

     Reference reference = FirebaseStorage.instance.ref()
         .child("Profile Images")
         .child(FirebaseAuth.instance.currentUser!.uid);

     UploadTask uploadTask = reference.putFile(profileImage);
     TaskSnapshot taskSnapshot = await uploadTask;

     String downloadUrlOfUploadedImage = await taskSnapshot.ref.getDownloadURL();

     return downloadUrlOfUploadedImage;

    } catch (e) {
      // Handle specific exceptions for better error messaging
      if (kDebugMode) {
        print("Error uploading image: $e");
      }
      throw FirebaseException(message: "Error uploading image", plugin: '');
    }
  }
}
