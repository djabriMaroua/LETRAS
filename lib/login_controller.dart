import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_3/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final Username = TextEditingController();
  final phoneNum = TextEditingController();

  void loginUser(String email, String password) {
    
  }
}
