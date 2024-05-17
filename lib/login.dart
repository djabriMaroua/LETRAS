//===================================================
// Declaration des bibliotheques et fichiers externes
//===================================================

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sign_up.dart';
//===================================================
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth.dart';
import 'package:flutter_application_3/login_controller.dart';
import 'main.dart';
import 'package:get/get.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:get/get_navigation/get_navigation.dart';


    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final _formKey1 = GlobalKey<FormState>();

class LoginDemo extends StatefulWidget {
  LoginDemo({Key? key}) : super(key: key);
  @override
  _LiState createState() => _LiState(); // _LiState : _Log in State
}

class _LiState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery =
        MediaQuery.of(context); // declaration des variables du MediaQuery.
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    

    @override
    void dispose() {
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
    }

    Future signIn() async {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((userCredential) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Auth()));
      }).catchError((e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No user found for that email'),
              backgroundColor: Color(0xffFBBC05),
              duration: Duration(seconds: 3),
            ),
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Wrong password provided for that user'),
              backgroundColor: Color(0xffFBBC05),
              duration: Duration(seconds: 3),
            ),
          );
        }
      });
    }

    return Scaffold(
        body: SingleChildScrollView(
      // SingleChildScrollView means that the page could be scrolled when necessary.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(left: width * 0.6620),
                  child: SvgPicture.asset(
                    "images/bs2.svg", // svg du carré bleu en haut a droite de la page.
                  )),
              Container(
                margin:
                    EdgeInsets.only(top: height * 0.1990, left: width * 0.0611),
                child: Text("Log in", // text en haut a gauche de la page.
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40,
                        color: Color(0xFF081956))),
              ),
            ],
          ),
          Container(
            // title of the box where you can enter your username.
            margin: EdgeInsets.only(left: width * 0.0611),
            child: Text("Username",
                style: TextStyle(
                    fontFamily: 'Poppins2',
                    fontSize: 16,
                    color: Color(0xFF081956))),
          ),
          Container(
            // the box where you can enter your username.
            margin: EdgeInsets.only(top: height * 0.0062, left: width * 0.0611),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFFE7E5E5).withOpacity(0.45)),
            child: Padding(
              padding: const EdgeInsets.only(left: 0.4),
              child: TextField(
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Color(0xFF081956),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      top: height * 0.019,
                      left: width * 0.1018,
                      right: width * 0.0509),
                  prefixIcon: Container(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "images/user.svg",
                        ),
                      )),
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(
                    color: Color(0xff7A9197),
                    fontFamily: 'Poppins1',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Container(
            // title of the box where you can enter your email.
            margin: EdgeInsets.only(top: height * 0.0348, left: width * 0.0611),
            child: Text("Email",
                style: TextStyle(
                    fontFamily: 'Poppins2',
                    fontSize: 16,
                    color: Color(0xFF081956))),
          ),
          Container(
            // the box where you can enter your email.
            margin: EdgeInsets.only(top: height * 0.0062, left: width * 0.0611),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFFE7E5E5).withOpacity(0.45)),
            child: Padding(
              padding: const EdgeInsets.only(left: 0.4),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Color(0xFF081956),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      top: height * 0.019,
                      left: width * 0.1018,
                      right: width * 0.0509),
                  prefixIcon: Container(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "images/mail.svg", // l'icon du mail
                        ),
                      )),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Color(0xff7A9197),
                    fontFamily: 'Poppins1',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Container(
            // title of the box where you can enter your password.
            margin: EdgeInsets.only(top: height * 0.0348, left: width * 0.0611),
            child: Text("Password",
                style: TextStyle(
                    fontFamily: 'Poppins2',
                    fontSize: 16,
                    color: Color(0xFF081956))),
          ),
          Container(
            // the box where you can enter your password.
            margin: EdgeInsets.only(top: height * 0.0062, left: width * 0.0611),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFFE7E5E5).withOpacity(0.45)),
            child: Padding(
              padding: const EdgeInsets.only(left: 0.4),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Color(0xFF081956),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      top: height * 0.019,
                      left: width * 0.1018,
                      right: width * 0.0509),
                  prefixIcon: Container(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "images/key.svg", // l'icon du password
                        ),
                      )),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Color(0xff7A9197),
                    fontFamily: 'Poppins1',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Container(
            // the text where you can click to verify email, il n'est pas encore implémenté.
            margin: EdgeInsets.only(left: width * 0.5601),
            child: InkWell(
              child: Container(
                margin: EdgeInsets.only(left: width * 0.0331),
                child: Text("Forgot Password?",
                    style: TextStyle(
                        fontFamily: 'Poppins2',
                        fontSize: 15,
                        color: Color(0xFF081956),
                        decoration: TextDecoration.underline)),
              ),
              onTap: () {
                /*you enter the code of 3 lines here to go to another page*/
              },
              // whenever you find onTap function it means that it will lead you to a specific page.
            ),
          ),
          Container(
            // title of the box where you can click to go to login page.
            margin: EdgeInsets.only(top: height * 0.1095, left: width * 0.0611),
            child: InkWell(
                child: Container(
                    width: width * 0.8784,
                    height: height * 0.0696,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFfbbc05)),
                    alignment: Alignment.center,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Color(0xFF081956),
                          fontFamily: 'Poppins2',
                          fontSize: 19),
                    )),
                onTap: () {
                  //if (_formKey1.currentState!.validate()) {
                  signIn();
                  //}
                  /*you enter the code of 3 lines here to go to another page*/
                }
                // whenever you find onTap function it means that it will lead you to a specific page.
                ),
          )
        ],
      ),
    ));
  }
}
