import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/sign_up_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/get_navigation.dart';


class SignupWithEmailAndPasswordFailure {
  final String message;

  const SignupWithEmailAndPasswordFailure([this.message= "An Unknown Error has occured"]);

  factory SignupWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password': return SignupWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'email-already-in-use': return SignupWithEmailAndPasswordFailure('An account with this email already exists, please try another email!');
      case 'invalid-email': return SignupWithEmailAndPasswordFailure('Email is not valid or badly formatted, please enter another one!');
      case 'operation-not-allowed': return SignupWithEmailAndPasswordFailure('');
      case 'user-disabled': return SignupWithEmailAndPasswordFailure('This user account has been disabled, please contact us for help');

      default: return const SignupWithEmailAndPasswordFailure();
    }
  }
  
}