//===================================================
// Declaration des bibliotheques et fichiers externes
//===================================================
import 'dart:ffi';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/notification.dart';
import 'package:flutter_application_3/settings1.dart';
//===================================================

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool statuscheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 360,
              width: 392.72,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Color(0xff081956)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 27),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.58)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: InkWell(
                            child: Stack(
                              children: [
                                SvgPicture.asset("images/homenotif.svg",
                                    height: 40, width: 40),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xfffbbc05),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins2',
                                          fontSize: 10),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyNotificationPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, right: 210),
                    child: Text("Hi,Maha!",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: 26,
                            color: Color(0xff80C5DD))),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    child: Text(
                      "Say Hello to more organized,\nStreamlined mail\nManagement experience with\nLetras",
                      style: TextStyle(
                          fontFamily: 'Poppins3',
                          fontSize: 19,
                          color: Color(0xff7A9197)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 130),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    height: 173,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xff081956),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 19, top: 12),
                            child: SvgPicture.asset("images/litebox.svg")),
                        Container(
                          margin: EdgeInsets.only(left: 12, top: 8),
                          child: Text("Letters' Number",
                              style: TextStyle(
                                  fontFamily: 'Poppins3',
                                  fontSize: 16,
                                  color: Colors.white)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 12, top: 6),
                          child: Text(
                              " 05 new letters are\nwaiting for you in your\nsmart mailbox.",
                              style: TextStyle(
                                  fontFamily: 'Poppins4',
                                  fontSize: 11,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    height: 173,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xff081956),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 19, top: 12),
                            child: SvgPicture.asset("images/check.svg")),
                        Container(
                          margin: EdgeInsets.only(left: 12, top: 8),
                          child: Text("Notifications",
                              style: TextStyle(
                                  fontFamily: 'Poppins3',
                                  fontSize: 16,
                                  color: Colors.white)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 12, top: 6),
                          child: Text(" 02 notifications\n unchecked",
                              style: TextStyle(
                                  fontFamily: 'Poppins4',
                                  fontSize: 11,
                                  color: Colors.white)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            toggleswitch(),
                            InkWell(
                              child: Container(
                                  margin: EdgeInsets.only(top: 6),
                                  height: 36,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xfffbbc05)),
                                  child: Center(
                                    child: Text(
                                      "Check",
                                      style: TextStyle(
                                          fontFamily: 'Poppins3',
                                          fontSize: 15,
                                          color: Color(0xff081956)),
                                    ),
                                  )),
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyNotificationPage()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 72),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Color(0xff081956)),
              height: 68,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 41),
                    child: InkWell(
                      child: SvgPicture.asset("images/settings.svg",
                          height: 30, width: 30),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Setting()));
                      },
                    ),
                  ),
                  Container(
                    child: InkWell(
                      child: SvgPicture.asset("images/home.svg",
                          height: 30, width: 30),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 41),
                    child: InkWell(
                      child: SvgPicture.asset("images/user.svg",
                          height: 30, width: 30),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 60),
          height: 130,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(width: 5.0, color: Color(0xff081956))),
          child: Center(
            child: Text(
              "Looks like you have some\nnew deliveries! Check your\nmailbox for letters.",
              style: TextStyle(
                  fontFamily: 'Poppins2',
                  fontSize: 18,
                  color: Color(0xff081956)),
            ),
          ),
        )
      ],
    ));
  }

  Container toggleswitch() {
    // the toggle to switch to check notifs.

    return Container(
        width: 43,
        height: 19,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFfbbc05),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: FlutterSwitch(
          activeToggleColor: Colors.white,
          inactiveToggleColor: Color(0xFffbbc05),
          inactiveToggleBorder:
              Border.all(color: Color(0xFFfbbc05), width: 2.0),
          //activeToggleBorder: Border.all(),
          activeColor: Color(0xFFfbbc05),
          inactiveColor: Colors.white,
          width: 43,
          height: 19,
          valueFontSize: 10.0,
          toggleSize: 10.0,
          value: statuscheck,
          borderRadius: 25.0,
          padding: 1.5,
          showOnOff: false,
          onToggle: (val) {
            setState(() {
              statuscheck = val;
            });
          },
        ));
  }
}




/*
//===================================================
// Declaration des bibliotheques et fichiers externes
//===================================================
import 'dart:ffi';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2cp_project/notification.dart';
import 'package:flutter_2cp_project/settings1.dart';
//===================================================

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool statuscheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 27),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.58)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: InkWell(
                    child: Stack(
                      children: [
                        SvgPicture.asset("images/homenotif.svg",
                            height: 40, width: 40),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Color(0xfffbbc05),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins2',
                                  fontSize: 10),
                            ),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MyNotificationPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 27, top: 15),
            child: Text("Hi,Maha!",
                style: TextStyle(
                    fontFamily: 'Poppins2',
                    fontSize: 24,
                    color: Color(0xff80C5DD))),
          ),
          Container(
            margin: EdgeInsets.only(left: 27),
            child: Text(
                "Say Hello to more organized, streamlined\nMail management experience!",
                style: TextStyle(
                    fontFamily: 'Poppins3',
                    fontSize: 14.5,
                    color: Color(0xff7A9197))),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  height: 173,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff081956),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 19, top: 12),
                          child: SvgPicture.asset("images/litebox.svg")),
                      Container(
                        margin: EdgeInsets.only(left: 12, top: 8),
                        child: Text("Letters' Number",
                            style: TextStyle(
                                fontFamily: 'Poppins3',
                                fontSize: 16,
                                color: Colors.white)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12, top: 6),
                        child: Text(
                            " 05 new letters are\nwaiting for you in your\nsmart mailbox.",
                            style: TextStyle(
                                fontFamily: 'Poppins4',
                                fontSize: 11,
                                color: Colors.white)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  height: 173,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff081956),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 19, top: 12),
                          child: SvgPicture.asset("images/check.svg")),
                      Container(
                        margin: EdgeInsets.only(left: 12, top: 8),
                        child: Text("Notifications",
                            style: TextStyle(
                                fontFamily: 'Poppins3',
                                fontSize: 16,
                                color: Colors.white)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12, top: 6),
                        child: Text(" 02 notifications\n unchecked",
                            style: TextStyle(
                                fontFamily: 'Poppins4',
                                fontSize: 11,
                                color: Colors.white)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          toggleswitch(),
                          InkWell(
                            child: Container(
                                margin: EdgeInsets.only(top: 6),
                                height: 36,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xfffbbc05)),
                                child: Center(
                                  child: Text(
                                    "Check",
                                    style: TextStyle(
                                        fontFamily: 'Poppins3',
                                        fontSize: 15,
                                        color: Color(0xff081956)),
                                  ),
                                )),
                            onTap: () {},
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 287),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Color(0xff081956)),
            height: 68,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 41),
                  child: InkWell(
                    child: SvgPicture.asset("images/settings.svg",
                        height: 30, width: 30),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => Setting()));
                    },
                  ),
                ),
                Container(
                  child: InkWell(
                    child: SvgPicture.asset("images/home.svg",
                        height: 30, width: 30),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 41),
                  child: InkWell(
                    child: SvgPicture.asset("images/user.svg",
                        height: 30, width: 30),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container toggleswitch() {
    // the toggle to switch to check notifs.

    return Container(
        width: 43,
        height: 19,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFfbbc05),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: FlutterSwitch(
          activeToggleColor: Colors.white,
          inactiveToggleColor: Color(0xFffbbc05),
          inactiveToggleBorder:
              Border.all(color: Color(0xFFfbbc05), width: 2.0),
          //activeToggleBorder: Border.all(),
          activeColor: Color(0xFFfbbc05),
          inactiveColor: Colors.white,
          width: 43,
          height: 19,
          valueFontSize: 10.0,
          toggleSize: 10.0,
          value: statuscheck,
          borderRadius: 25.0,
          padding: 1.5,
          showOnOff: false,
          onToggle: (val) {
            setState(() {
              statuscheck = val;
            });
          },
        ));
  }
}
*/