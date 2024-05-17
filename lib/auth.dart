
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Onboarding.dart';
import 'package:flutter_application_3/WelcomeScreen.dart';
import 'package:flutter_application_3/authentication_repository.dart';
//import 'package:flutter_application_3/homepage%20(1).dart';
import 'package:flutter_application_3/login.dart';
import 'package:flutter_application_3/logopage.dart';
import 'package:flutter_application_3/main.dart';

class Auth extends StatelessWidget{
  const Auth({super.key});
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            if (!(FirebaseAuth.instance.currentUser!.emailVerified)){
              FirebaseAuth.instance.currentUser!.sendEmailVerification();
            }
            return Homepage();
          }
          
        else {
          return Logopage();
        }
        },
      ),
    );
  }
}