//===================================================
// Declaration des bibliotheques et fichiers externes
//===================================================
import 'dart:ffi';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/Profile.dart';
import 'package:flutter_application_3/auth.dart';
//import 'package:flutter_application_3/homepage%20(1).dart';
import 'package:flutter_application_3/notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/notification.dart';
import 'package:flutter_application_3/settings1.dart';
import 'EditProfile.dart';

//===================================================
// Declarations Notification Structure
//===================================================

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

int nbLet = 0;
bool allowNotif = false;


final DatabaseReference starCountRef = FirebaseDatabase.instance
    .ref()
    .child('UsersData/'+FirebaseAuth.instance.currentUser!.uid+'/readings');
final databaseReference = FirebaseDatabase.instance.ref();
Query query =
    databaseReference.child('UsersData/'+FirebaseAuth.instance.currentUser!.uid+'/readings');

late dynamic snapshot;

getNbLetters() async {
  final databaseReference = FirebaseDatabase.instance.ref();
  Query query = databaseReference
      .child('UsersData/'+FirebaseAuth.instance.currentUser!.uid+'/readings');
  snapshot = await query.get(); // gets all data in uid
  if (snapshot.exists) {
    nbLet = (snapshot.children.last.child('nbletters').value)
        as int; // NOMBRE DES LETTRES !! VITAL !!
    print((snapshot.children.last.child('nbletters').value).toString());
  } else {
    print('Snapshot doesn' 't exist');
  }
}

//===================================================
// Programme principal qui appelle la premiere page shouhaitée dans l'application
//===================================================

void main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  //Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository())); DEPRECATED
  await Firebase.initializeApp();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home:
        
          Auth(), //dans cette ligne on appelle la classe principale dans le fichier qui cotient la premiere page.
      //dans ce cas c'est la page des notifications.
    );
  }
}

//===================================================

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool statuscheck = true;
  @override
  void initState() {
    super.initState();
    getNbLetters();
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    setState(() {});
  }

  void updateUI() {
    setState(() {
      getNbLetters();
    });
  }

  Widget build(BuildContext context) {
    //////////////////
    starCountRef.onValue.listen((DatabaseEvent event) async {
      var data = event.snapshot.value;
      //nbLet++;
      //updateUI();
      print("HERE STARTS DATA");
      //print(data.toString());
      print("HERE ENDS DATAAAA");
      print("HERE Starts QUERRY");

      //print(snapshot.value.toString());
      print("HERE ENDS Querry");
      print("NEW NB LETTERS" + nbLet.toString());
      if (!(snapshot.value.toString() == data.toString()) && allowNotif) {
        if ( nbLet == 0) {
          print("REMISE A 0");
          NotificationService().showNotification(
              title: 'Reset to 0 ',
              body: 'You have opened your mailbox and retrieved all messages');
          updateUI();
        } else {
          print("Different to 0");
          NotificationService().showNotification(

              title: 'Happy mail day! ',
              body: 'You have got mail! Check out your smart mailbox.');
          updateUI();
        }
      }
    });

    final mediaQuery = MediaQuery.of(context); // declaration du MediaQuery
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.4479,
              width: width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width * 0.076),
                    bottomRight: Radius.circular(width * 0.076),
                  ),
                  color: Color(0xff081956)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.0622),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: width * 0.0483, top: height * 0.0149),
                            child: SvgPicture.asset("images/userhome.svg")),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.0763),
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          height: height * 0.1,
                          child: InkWell(
                            child: Stack(
                              children: [
                                SvgPicture.asset("images/homenotif.svg",
                                    height: height * 0.0497,
                                    width: width * 0.1018),
                                Container(
                                  margin: EdgeInsets.only(left: width * 0.0509),
                                  height: height * 0.0248,
                                  width: width * 0.0509,
                                  decoration: BoxDecoration(
                                      color: Color(0xfffbbc05),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "$nbLet",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins2',
                                          fontSize: width * 0.0254),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyNotificationPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: width * 0.5347),
                    padding: EdgeInsets.only(right: width * 0.2),
                    child: Text("Hi!",
                        style: TextStyle(
                            fontFamily: 'Poppins2',
                            fontSize: width * 0.0662,
                            color: Color(0xff80C5DD))),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: width * 0.1018, bottom: height * 0.02),
                    child: Text(
                      "Say Hello to a more organized,\nStreamlined mail\nManagement experience with\nLetras.",
                      style: TextStyle(
                          fontFamily: 'Poppins3',
                          fontSize: width * 0.0483,
                          color: Color(0xffffffff)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.1617),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.0763),
                    height: height * 0.2152,
                    width: width * 0.3819,
                    decoration: BoxDecoration(
                      color: Color(0xff081956),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: width * 0.0483, top: height * 0.0149),
                          child: SvgPicture.asset("images/litebox.svg"),
                          height: height * 0.057,
                          width: width * 0.12,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: width * 0.0305, top: height * 0.0099),
                          child: Container(
                            height: height * 0.035,
                            width: width * 0.35,
                            child: Text("Letters' Number",
                                style: TextStyle(
                                    fontFamily: 'Poppins3',
                                    fontSize: width * 0.0407,
                                    color: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: width * 0.0305, top: height * 0.0074),
                          child: Container(
                            height: height * 0.076,
                            width: width * 0.35,
                            child: Text(
                                " $nbLet new letters are\nwaiting for you in your\nsmart mailbox.",
                                style: TextStyle(
                                    fontFamily: 'Poppins4',
                                    fontSize: width * 0.0280,
                                    color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: width * 0.0763),
                    height: height * 0.2152,
                    width: width * 0.3819,
                    decoration: BoxDecoration(
                      color: Color(0xff081956),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: width * 0.0483, top: height * 0.0149),
                          child: SvgPicture.asset("images/check.svg"),
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: width * 0.0305, top: height * 0.0099),
                          child: Container(
                            height: height * 0.037,
                            width: width * 0.28,
                            child: Text("Notifications",
                                style: TextStyle(
                                    fontFamily: 'Poppins3',
                                    fontSize: width * 0.0407,
                                    color: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width * 0.0305),
                          child: Container(
                            height: height * 0.039,
                            width: width * 0.25,
                            child: Text(" $nbLet notifications\n unchecked",
                                style: TextStyle(
                                    fontFamily: 'Poppins4',
                                    fontSize: width * 0.0280,
                                    color: Colors.white)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            toggleswitch(),
                            InkWell(
                              child: Container(
                                  margin: EdgeInsets.only(top: height * 0.0074),
                                  height: height * 0.03,
                                  width: width * 0.1782,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.025),
                                      color: Color(0xfffbbc05)),
                                  child: Center(
                                    child: Text(
                                      "Check",
                                      style: TextStyle(
                                          fontFamily: 'Poppins2',
                                          fontSize: width * 0.03,
                                          color: Color(0xff081956)),
                                    ),
                                  )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
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
              margin: EdgeInsets.only(top: height * 0.0895),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(width * 0.05),
                      topLeft: Radius.circular(width * 0.05)),
                  color: Color(0xff081956)),
              height: height * 0.0846,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.1044),
                    child: InkWell(
                      child: SvgPicture.asset("images/settings.svg",
                          height: height * 0.0373, width: width * 0.0763),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Setting()));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 41),
                    child: InkWell(
                      child: SvgPicture.asset("images/user.svg",
                          height: height * 0.0373, width: width * 0.0763),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Profile()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: height * 0.0746),
          height: height * 0.15,
          width: width * 0.7639,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border:
                  Border.all(width: width * 0.0127, color: Color(0xff081956))),
          child: Center(
            child: Container(
              height: height * 0.14,
              width: width * 0.66,
              child: Text(
                "Looks like you have some\nnew deliveries! Check your\nmailbox for letters.",
                style: TextStyle(
                    fontFamily: 'Poppins2',
                    fontSize: width * 0.0458,
                    color: Color(0xff081956)),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Container toggleswitch() {
    // the toggle to switch to check notifs.
    final mediaQuery = MediaQuery.of(context); // declaration du MediaQuery
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Container(
        width: width * 0.1094,
        height: height * 0.0236,
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
              Border.all(color: Color(0xFFfbbc05), width: width * 0.0050),
          //activeToggleBorder: Border.all(),
          activeColor: Color(0xFFfbbc05),
          inactiveColor: Colors.white,
          width: width * 0.1094,
          height: height * 0.0236,
          valueFontSize: width * 0.0254,
          toggleSize: width * 0.0254,
          value: allowNotif,
          borderRadius: width * 0.0636,
          padding: 1.5,
          showOnOff: false,
          onToggle: (val) {
            setState(() {
              statuscheck = val;
              allowNotif = !allowNotif;
              print("Allow notif VALUE IS   :" + allowNotif.toString());
              setState(() {
                getNbLetters();
              });
            });
          },
        ));
  }
}
