//===================================================
// Declaration des bibliotheques et fichiers externes
//===================================================
import 'dart:ffi';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Onboarding.dart';
import 'package:show_up_animation/show_up_animation.dart';
//===================================================

class Logopage extends StatefulWidget {
  const Logopage({Key? key}) : super(key: key);

  @override
  State<Logopage> createState() => _LogopageState();
}

class _LogopageState extends State<Logopage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery =
        MediaQuery.of(context); // declaration des variables du MediaQuery.
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Onbording()),
      );
    });
    return Scaffold(
      body: InkWell(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Expanded(
                child: Container(
              color: Colors.white,
            )),
            ShowUpAnimation(
              delayStart: Duration(seconds: 1),
              animationDuration: Duration(seconds: 3),
              curve: Curves.linear,
              direction: Direction.horizontal,
              offset: 0.5,
              child: SvgPicture.asset(
                "images/logo.svg", // svg du logo
                height: height * 0.1244,
                width: width * 0.2546,
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
