import 'package:chat/screens/Verify.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/Login Screen.dart';

class Firebasecontroller extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String customer = "";
  String accessToken = "";
  String idToken = "";

  Future<void> handleGoogleSignUp() async {
    try {
      Get.put(EasyLoading.show());
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        print(ActionCodeInfoOperation.emailSignIn);

        Get.to(() => MyHomePage());
        Get.put(EasyLoading.dismiss());
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String accessToken = googleAuth.accessToken!;
        final String idToken = googleAuth.idToken!;
        final String customer = googleUser.email!;
        print(customer);
        print(idToken);
        print(accessToken);
        // Use the access token and ID token to authenticate with your server or perform other actions
      } else {
        Get.snackbar("ChatBox", "Something went wrong");
        // Sign up was canceled
      }
    } catch (error) {
      Get.snackbar("ChatBox", error.toString());
      // Error occurred during sign up
    }
  }

  Future<void> checkuser(String email, String password) async {
    try {
      Get.put(EasyLoading.show());
      final FirebaseAuth _auth = FirebaseAuth.instance;
      if (_auth.currentUser != null) {
        Get.put(EasyLoading.dismiss());
        print('User is logged in');
        Get.snackbar("ChatBox", "Login Successful",
            snackPosition: SnackPosition.BOTTOM);
        Get.to(() => MyHomePage());
      } else {
        Get.put(EasyLoading.dismiss());
        print('User is not logged in');
        Get.snackbar("ChatBox", "Invalid Credentials");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logincheck(String email, String password) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) async {
      // Logged in successfully
      User? user = userCredential.user;
      String? idToken = await user?.getIdToken();

      // Get the ID token result, which includes the access token
      IdTokenResult? idTokenResult = await user?.getIdTokenResult();
      String? accessToken = idTokenResult?.token;
      print(accessToken);
      print(user);
      Get.snackbar("ChatBox", "Login Successful",
          snackPosition: SnackPosition.BOTTOM);
      Get.to(() => MyHomePage());
    }).catchError((error) {
      Get.snackbar("ChatBox", error.toString(),
          snackPosition: SnackPosition.BOTTOM);
      print(error);
    });
  }


  Future<void>forgotpassword(String email)async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.offAll(() => const LoginScreen());
      Get.snackbar("ChatBox", "Check your Mail",
          snackPosition: SnackPosition.BOTTOM);
    }catch(e){
      Get.snackbar("ChatBox", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }

  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());
    // Logged out successfully
    print('Logged out successfully');
  }
}
