
/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_3/WelcomeScreen.dart';
import 'package:flutter_application_3/firebase_options.dart';
import 'package:flutter_application_3/main.dart';
import 'login.dart';
import 'sign_up.dart';
import 'package:get/get.dart';
import 'WelcomeScreen.dart';



class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance =>  Get.find();


  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  

  @override
  void onReady(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    //
    print((_auth.currentUser)!.uid);
    //
    ever(firebaseUser, _setInitialScreen);
  }
  _setInitialScreen(User? user){
    user == null ? Get.offAll( () => welcomeScreen()): Get.offAll( () =>MyHomePage(title: 'home'));

  }
  
  Future<void> createUserWithEmailandPassword (String email, String password) async {
    try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser.value != null ? Get.offAll(() => const SignUpScreen()) : Get.to(() => MyHomePage(title: 'home',));
    print((_auth.currentUser)!.uid);
  }
  on FirebaseAuthException catch(e){
  } catch (_){}
  }


  Future<void> loginWithEmailandPassword (String email, String password) async {
    try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    firebaseUser.value != null ? Get.offAll(() => LoginDemo()) : Get.to(() => MyHomePage(title: 'home',));
  }
  on FirebaseAuthException catch(e){
  } catch (_){}
  }

  Future<void> logout() async => await _auth.signOut(); 

}
*/