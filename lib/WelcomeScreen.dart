/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_3/authentication_repository.dart';
import 'package:flutter_application_3/login.dart';
import 'package:flutter_application_3/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'content_model.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: currentIndex == 2
                  ? EdgeInsets.only(left: width*0.71)
                  : EdgeInsets.only(top: height*0.064, left: width*0.78),
              //color: Color.fromARGB(255, 2, 2, 2),
              child: currentIndex == 2
                  ? null
                  : InkWell(
                      borderRadius: BorderRadius.circular(width*0.05),
                      child: Container(
                        height:height*0.034,
                        width:width*0.096,
                        child: Text(
                          "skip",
                          style: TextStyle(
                              fontSize: 0.045*width,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFBBC05)),
                        ),
                      ),
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                    )),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
                return Padding(
                  
                  padding: currentIndex == 2
                      ?  EdgeInsets.only(
                          top: height*0.025, right: width*0.1, left:width*0.1, bottom: height*0.0678)
                      :  EdgeInsets.only(
                          top:height*0.025 , right: width*0.1, left:width*0.1, bottom:height*0.0678),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        margin: EdgeInsets.only(top: height*0.051),
                        duration: Duration(seconds: 1),
                        //color: Colors.black,
                        child: SvgPicture.asset(
                          contents[i].image,
                          // "images/g1.svg",
                          width: width * 0.77,
                          height: height * 0.33,
                        ),
                      ),
                      Container(
                        height:height*0.067,
                        width:width*0.43,
                        child: Text(
                            "Welcome",
                            semanticsLabel: contents[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: width*0.089,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF081956))),
                      ),
                      SizedBox(height:height*0.023),
                      Container(
                        width:width*0.822,
                        height:height*0.139,
                        child: Text(
                           "Never lose track of your mail again "
                          "with our letter count feature. Stay on "
                          "top of your incoming mail, and enjoy "
                          "a streamlined mailbox experience.",
                          semanticsLabel: contents[i].discription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins2',
                              fontSize: width*0.043,
                              color: Color(0xFF081956).withOpacity(0.58)),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: currentIndex == 2
                ? EdgeInsets.only(bottom: height*0.128)
                : EdgeInsets.only(bottom: 0),
            height: height * 0.0622,
            width: width,
            // color: Colors.blue,
            child: currentIndex == 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(width*0.05),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFBBC05),
                              borderRadius: BorderRadius.circular(7)),
                          height: height * 0.071,
                          width: width * 0.7511,
                          child: Center(
                              child: Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: width*0.048,
                              fontFamily: 'Poppins2',
                              color: Color(0xFF081956),
                            ),
                          )),
                        ),
                        onTap: () {},
                      )
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: width*0.076, right:width*0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: width*0.10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(width*0.05),
                            child: SvgPicture.asset(
                              "images/ar.svg",
                              height: height * 0.0497,
                              width: width * 0.1018,
                            ),
                            onTap: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                          )),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: height * 0.0124,
      width: currentIndex == index ? width * 0.0636 : width * 0.0254,
      margin: EdgeInsets.only(right: width*0.012),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width*0.05),
        color: currentIndex == index
            ? Color(0xFFFBBC05)
            : Color(0xFFFBBC05).withOpacity(0.58),
      ),
    );
  }
}

//import 'content_model.dart';

class welcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HelloWorld')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return LoginDemo();
                }));
              },
              child: Text('Open Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SignUpScreen();
                }));
              },
              child: Text('Open Signup'),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('Signout'),
            ),
          ],
        ),
      ),
    );
  }
}
*/