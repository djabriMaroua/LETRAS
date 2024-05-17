
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_3/WelcomeScreen.dart';
import 'package:flutter_application_3/authentication_repository.dart';
import 'package:flutter_application_3/firebase_options.dart';
import 'package:flutter_application_3/login.dart';
import 'package:flutter_application_3/sign_up.dart';
import 'package:flutter_application_3/sign_up_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_application_3/auth.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_application_3/login_phone.dart';
import 'package:flutter_application_3/otp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String Username;
  final String email;
  final String phoneNum;
  final String password;
  final bool isVerified;

  const UserModel({
    this.uid,
    required this.email,
    required this.password,
    required this.Username,
    required this.phoneNum,
    required this.isVerified,

  });

  toJson(){
    return {
      "Username": Username,
      "Email": email,
      "Phone" : phoneNum,
      "Password" : password,
      "isVerified" : isVerified,
    };

  }
}


createUser(UserModel user) async{
  await FirebaseFirestore.instance.collection("Users").add(user.toJson());
}