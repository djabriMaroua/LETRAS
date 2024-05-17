//===================================================
// Declaration des bibliotheques et fichiers externes
//===================================================

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';
////////////
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/auth.dart';
import 'package:flutter_application_3/exceptions/sign_up_failure.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/sign_up_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'authentication_repository.dart';
import 'package:get/get_navigation/get_navigation.dart';

//===================================================
const tDefaultSize = 30.0;
const tSplashContainerSize = 30.0;
const tButtonHeight = 15.0;
const tFormHeight = 30.0;
const String tSignUpTitle = "Get On Board!";
const String tSignUpSubTitle = "Create your profile to start your Journey.";
const String tAlreadyHaveAnAccount = "Already have an Account? ";
String otpPin = " ";
String countryDial = "+213";
String verID = " ";
int screenState = 0;
final _formKey = GlobalKey<FormState>();
final phoneNum = TextEditingController();
final username = TextEditingController();
final password = TextEditingController();
final email = TextEditingController();

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  @override
  _SuState createState() => _SuState(); // _SuState : Sign up State.
}

class _SuState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context); // declaration du MediaQuery.
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
        //final _formKey = GlobalKey<FormState>();

    @override
    void initState() {
      super.initState();
    }

    /*@override
    void dispose() {
      super.dispose();
      email.dispose();
      username.dispose();
      password.dispose();
      phoneNum.dispose();
    }*/

    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              // SingleChildScrollView means that this page can be scrolled when necessary.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: width * 0.7639),
                          child: SvgPicture.asset(
                            "images/bs.svg", // l'icon de carré bleu a droite de la page , la decoration en haut.
                            height: height * 0.2737,
                            width: width * 0.5601,
                          )),
                      Container(
                        margin: EdgeInsets.only(
                            top: height * 0.1368, left: width * 0.0611),
                        child: Text("Sign Up", // le titre de la page.
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 40,
                                color: Color(0xFF081956))),
                      ),
                    ],
                  ),
                  Container(
                    // the title of the box where you can enter your username
                    margin: EdgeInsets.only(left: width * 0.0611),
                    child: Text("Username",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: 16,
                            color: Color(0xFF081956))),
                  ),
                  Container(
                    // the box where you can enter your username
                    margin: EdgeInsets.only(
                        top: height * 0.0062, left: width * 0.0611),
                    width: width * 0.8784,
                    height: height * 0.0696,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFE7E5E5).withOpacity(0.45)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.4),
                      child: TextFormField(
                        controller: username,
                        onTap: () {},
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
                                  "images/user.svg", // l'icon du user (svg)
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
                    // the title of the box where you can enter your email
                    margin: EdgeInsets.only(
                        top: height * 0.0348, left: width * 0.0611),
                    child: Text("Email",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: 16,
                            color: Color(0xFF081956))),
                  ),
                  Container(
                    // the box where you can enter your email
                    margin: EdgeInsets.only(
                        top: height * 0.0062, left: width * 0.0611),
                    width: width * 0.8784,
                    height: height * 0.0696,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFE7E5E5).withOpacity(0.45)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.4),
                      child: TextField(
                        controller: email,
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
                                  "images/mail.svg", // l'icon de email (svg)
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
                    // the title of the box where you can enter your password
                    margin: EdgeInsets.only(
                        top: height * 0.0348, left: width * 0.0611),
                    child: Text("Password",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: 16,
                            color: Color(0xFF081956))),
                  ),
                  Container(
                    // the box where you can enter your password
                    margin: EdgeInsets.only(
                        top: height * 0.0062, left: width * 0.0611),
                    width: width * 0.8784,
                    height: height * 0.0696,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFE7E5E5).withOpacity(0.45)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.4),
                      child: TextFormField(
                        controller: password,
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
                                  "images/key.svg", // l'icon du password (svg)
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
                    // the title of the box where you can enter your phone number
                    margin: EdgeInsets.only(
                        top: height * 0.0348, left: width * 0.0611),
                    child: Text("Phone Number",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: 16,
                            color: Color(0xFF081956))),
                  ),
                  Container(
                    // the title of the box where you can enter your phone number
                    margin: EdgeInsets.only(
                        top: height * 0.0062, left: width * 0.0611),
                    width: width * 0.8784,
                    height: height * 0.0696,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFE7E5E5).withOpacity(0.45)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.4),
                      child: TextField(
                        controller: phoneNum,
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
                                  "images/phone.svg", // l'icon du telephone
                                ),
                              )),
                          hintText: 'Enter your phone number',
                          hintStyle: TextStyle(
                            color: Color(0xff7A9197),
                            fontFamily: 'Poppins1',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                        // the title of the box where you can click to go to sign up page
                        margin: EdgeInsets.only(
                            top: height * 0.0522, left: width * 0.0611),
                        width: width * 0.8784,
                        height: height * 0.0696,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xFFfbbc05)),
                        alignment: Alignment.center,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color(0xFF081956),
                              fontFamily: 'Poppins2',
                              fontSize: 19),
                        )),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email.text.trim(),
                          password: password.text.trim(),
                        )
                            .then((userCredential) {
                          // La création de l'utilisateur s'est déroulée avec succès
                          print("Successfully signed up");

                          // Ajouter l'utilisateur à la base de données
                          FirebaseFirestore.instance
                              .collection("Users")
                              .doc(userCredential.user!.uid)
                              .set({
                            "Username": username.text.trim(),
                            "Email": email.text.trim(),
                            "Phone": phoneNum.text.trim(),
                            "Password": password.text.trim(),
                            "isVerified": "false",
                          });

                          // Vérifier que l'utilisateur est connecté
                          if (FirebaseAuth.instance != null &&
                              FirebaseAuth.instance.currentUser != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Auth()));
                          }
                        }).catchError((error) {
                          print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
                          print(error.code);

                          // Une erreur s'est produite lors de la création de l'utilisateur
                          if (error is FirebaseAuthException) {
                            // L'erreur est de type FirebaseAuthException
                            if (error.code == 'email-already-in-use') {
                              // L'adresse e-mail est déjà associée à un autre compte utilisateur
                              print('email already in  use');
                              /* ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('email already in  use'),
                                  backgroundColor: Color(0xffFBBC05),
                                  duration: Duration(seconds: 3),
                                ),
                              );*/
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Color(0xffAAD7E7),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 48),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Oh snap!",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                                Spacer(),
                                                Text(
                                                  'fdggdfgdfgdf',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: SvgPicture.asset(
                                          "images/letter.svg",
                                          height: 20,
                                          width: 20,
                                          // color:Color(0xff1956),)
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -20,
                                      left: 3,
                                      child: Stack(
                                        children: [
                                          SvgPicture.asset(
                                            "images/letter.svg",
                                            height: 25,
                                            width: 25,
                                          ),
                                          //SvgPicture.asset("")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ));
                            }
                            if (error.code == 'weak-password') {
                              // L'adresse e-mail est déjà associée à un autre compte utilisateur
                              print('weak password');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('weak password'),
                                  backgroundColor: Color(0xffFBBC05),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                            if (error.code == 'invalid-email') {
                              // L'adresse e-mail est déjà associée à un autre compte utilisateur
                              print('invalid-email');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('invalid-email'),
                                  backgroundColor: Color(0xffFBBC05),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                            if (error.code == 'operation-not-allowed') {
                              // L'adresse e-mail est déjà associée à un autre compte utilisateur
                              print('enter correct information');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('enter correct information'),
                                  backgroundColor: Color(0xffFBBC05),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }

                            if (error.code == 'user-disabled') {
                              // L'adresse e-mail est déjà associée à un autre compte utilisateur
                              print('user-disabled');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('user-disabled'),
                                  backgroundColor: Color(0xffFBBC05),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          } else {
                            // Autres types d'erreurs
                            print(
                                'Erreur de création d\'utilisateur: ${error.toString()}');
                          }
                        });
                      }
                      ;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You already have an account ?",
                        style: TextStyle(
                            fontFamily: 'Poppins3',
                            fontSize: 12,
                            color: Color(0xFF081956)),
                      ),
                      InkWell(
                        child: Container(
                          // the text where you can click to go to login page
                          margin: EdgeInsets.only(left: width * 0.0254),
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 19,
                                color: Color(0xFF081956)),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginDemo()));
                        },
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
