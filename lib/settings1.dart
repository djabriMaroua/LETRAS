import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'EditProfile.dart';
import 'Help_Support.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);
  @override
  _SetState createState() => _SetState();
}

class _SetState extends State<Setting> {
  bool statusdark = true;
  bool statusnotif = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.057),
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: height * 0.064,
                width: width * 0.36,
                child: Text(
                  "Settings",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width * 0.084,
                      color: Color(0xFF081956)),
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: height * 0.0622, left: width * 0.0585),
              child: InkWell(
                child: Container(
                    height: height * 0.053,
                    width: width * 0.10,
                    child: SvgPicture.asset(
                        "images/sar.svg")), // blue arrow icon to return when clicking.
                onTap: () {
                  Navigator.of(context)
                      .pop(); /* pour retourner a une page qcq aprés le click*/
                },
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: height * 0.128),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                color: Color(0xFFE7E5E5),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.017))),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    margin: EdgeInsets.only(left: width * 0.0509),
                    child: Container(
                        height: height * 0.026,
                        width: width * 0.066,
                        child: SvgPicture.asset("images/user.svg"))),
                Container(
                  width: width * 0.47,
                  margin: EdgeInsets.only(left: width * 0.05),
                  child: Text("Edit profile",
                      style: TextStyle(
                          fontFamily: 'Poppins2',
                          fontSize: width * 0.05,
                          color: Color(0xFF081956))),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                    // do something when the container is tapped
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.025),
                    ),
                    margin: EdgeInsets.only(left: width * 0.127),
                    child: SvgPicture.asset(
                      "images/bar.svg",
                      height: height * 0.0373,
                      width: width * 0.0736,
                    ),
                  ),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: width * 0.025),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                color: Color(0xFFE7E5E5),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.017))),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: width * 0.05),
                    child: Container(
                        height: height * 0.026,
                        width: width * 0.066,
                        child: SvgPicture.asset("images/notif.svg"))),
                Container(
                  width: width * 0.47,
                  margin: EdgeInsets.only(left: width * 0.05),
                  child: Container(
                    height: height * 0.038,
                    width: width * 0.33,
                    child: Text("Notifications",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: width * 0.05,
                            color: Color(0xFF081956))),
                  ),
                ),
                toggleswitch1(),
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: height * 0.025),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                color: Color(0xFFE7E5E5),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.017))),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: width * 0.05),
                    child: Container(
                        height: height * 0.034,
                        width: width * 0.066,
                        child: SvgPicture.asset("images/help.svg"))),
                Container(
                  width: width * 0.47,
                  margin: EdgeInsets.only(left: width * 0.05),
                  child: Text("Help and Support",
                      style: TextStyle(
                          fontFamily: 'Poppins2',
                          fontSize: width * 0.05,
                          color: Color(0xFF081956))),
                ),

                // height: height * 0.032,
                // width: width * 0.063,
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpPage()),
                    );
                    // do something when the container is tapped
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.025),
                    ),
                    margin: EdgeInsets.only(left: width * 0.12),
                    child: SvgPicture.asset(
                      "images/bar.svg",
                      height: height * 0.0373,
                      width: width * 0.0736,
                    ),
                  ),
                ),
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: height * 0.025),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                color: Color(0xFFE7E5E5),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.017))),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: width * 0.05),
                    child: SvgPicture.asset("images/lang.svg")),
                Container(
                  width: width * 0.4710,
                  margin: EdgeInsets.only(left: width * 0.05),
                  child: Container(
                    height: height * 0.038,
                    width: width * 0.26,
                    child: Text("Language",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: width * 0.05,
                            color: Color(0xFF081956))),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.025),
                    ),
                    margin: EdgeInsets.only(left: width * 0.127),
                    child: SvgPicture.asset(
                      "images/bar.svg",
                      height: height * 0.0373,
                      width: width * 0.0763,
                    )),
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: height * 0.025),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                color: Color(0xFFE7E5E5),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.017))),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: width * 0.05),
                    child: SvgPicture.asset("images/dark.svg")),
                Container(
                  width: width * 0.4710,
                  margin: EdgeInsets.only(left: width * 0.05),
                  child: Container(
                    height: height * 0.038,
                    width: width * 0.28,
                    child: Text("Dark mode",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: width * 0.05,
                            color: Color(0xFF081956))),
                  ),
                ),
                toggleswitch2(),
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: height * 0.025),
            width: width * 0.8784,
            height: height * 0.0696,
            decoration: BoxDecoration(
                color: Color(0xFFE7E5E5),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.017))),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: width * 0.05),
                    child: Container(
                        height: height * 0.0371,
                        width: width * 0.073,
                        child: SvgPicture.asset("images/logout.svg"))),
                InkWell(
                    onTap: () {
                      openDialog();
                    },
                    child: Container(
                      width: width * 0.4710,
                      margin: EdgeInsets.only(
                          left: width * 0.05, top: height * 0.013),
                      child: Container(
                        height: height * 0.076,
                        width: width * 0.178,
                        child: Text("Logout",
                            style: TextStyle(
                                fontFamily: 'Poppins2',
                                fontSize: width * 0.05,
                                color: Color(0xFF081956))),
                      ),
                    )),
              ],
            ))
      ],
    ));
  }

  Container toggleswitch1() {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Container(
        margin: EdgeInsets.only(left: width * 0.089),
        width: MediaQuery.of(context).size.width * 0.1145,
        height: MediaQuery.of(context).size.height * 0.0311,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF081956),
            width: width * 0.00509,
          ),
          borderRadius: BorderRadius.circular(width * 0.076),
        ),
        child: FlutterSwitch(
          activeToggleColor: Colors.white,
          inactiveToggleColor: Color(0xFF081956),
          inactiveToggleBorder:
              Border.all(color: Color(0xFF081956), width: width * 0.00509),
          activeToggleBorder: Border.all(),
          activeColor: Color(0xFF081956),
          inactiveColor: Colors.white,
          width: MediaQuery.of(context).size.width * 0.1145,
          height: MediaQuery.of(context).size.height * 0.0311,
          valueFontSize: width * 0.025,
          toggleSize: width * 0.05,
          value: statusnotif,
          borderRadius: width * 0.076,
          padding: width * 0.00381,
          showOnOff: false,
          onToggle: (val) {
            setState(() {
              statusnotif = val;
            });
          },
        ));
  }

  Container toggleswitch2() {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Container(
        margin: EdgeInsets.only(left: width * 0.089),
        width: MediaQuery.of(context).size.width * 0.1145,
        height: MediaQuery.of(context).size.height * 0.0311,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF081956),
            width: width * 0.00509,
          ),
          borderRadius: BorderRadius.circular(width * 0.076),
        ),
        child: FlutterSwitch(
          activeToggleColor: Colors.white,
          inactiveToggleColor: Color(0xFF081956),
          inactiveToggleBorder:
              Border.all(color: Color(0xFF081956), width: width * 0.00509),
          activeToggleBorder: Border.all(),
          activeColor: Color(0xFF081956),
          inactiveColor: Colors.white,
          width: MediaQuery.of(context).size.width * 0.1145,
          height: MediaQuery.of(context).size.height * 0.0311,
          valueFontSize: width * 0.025,
          toggleSize: width * 0.05,
          value: statusdark,
          borderRadius: width * 0.076,
          padding: width * 0.00381,
          showOnOff: false,
          onToggle: (val) {
            setState(() {
              statusdark = val;
            });
          },
        ));
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Color(0xFF081956),
          title: Text("Are you sure you want to exit ?",
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center),
          actions: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2597,
              height: MediaQuery.of(context).size.height * 0.0609,
              margin: EdgeInsets.only(right: 5, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color(0xFFFBBC05)),
              child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text("Yes",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          color: Color(0xFF081956)),
                      textAlign: TextAlign.center)),
            ),
            Container(
              margin: EdgeInsets.only(right: 35, bottom: 20),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Setting()));
                  },
                  child: Text("Cancel",
                      style: TextStyle(
                          fontFamily: 'Poppins3',
                          fontSize: 19,
                          color: Colors.white),
                      textAlign: TextAlign.center)),
            )
          ],
        ),
      );
}
