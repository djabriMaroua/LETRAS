//===================================================
// Declaration des bibliotheques et fichiers externes
//===================================================

import 'dart:ui';
import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';

var data;

String imageOld4 = " ";
final storageRef = FirebaseStorage.instance.ref();
Reference? imageRef3 =
    storageRef.child(FirebaseAuth.instance.currentUser!.uid + "/Picture");
//===================================================
// dans tout ce qui suit :
// alea = aléatoire ; notif = notification
//===================================================

class MyNotificationPage extends StatefulWidget {
  MyNotificationPage({Key? key}) : super(key: key);

  @override
  _MyNotificationPageState createState() => _MyNotificationPageState();
}

class _MyNotificationPageState extends State<MyNotificationPage> {
  //================================================================
  // cette partie entre les deux premieres lignes de commentaires
  // est pour afficher des notifs aleatoires , aprés on
  // va afficher les notifications réelles.
  //================================================================
  List<String> messages = [];
  List<String> descriptions = [];
  List<String> timesanddates = [];
  late Random r;
  late Random d;
  late Random td;
  late GlobalKey<RefreshIndicatorState> refreshKey;
  @override
  initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    addAllMessages();
  }

  //===================================================
  // ici ce termine la partie des notifs aléatoires.
  //===================================================
  Widget ShowList() {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return ListView.builder(
        padding: EdgeInsets.only(
            top: height * 0.016,
            left: width * 0.033,
            bottom: height * 0.016,
            right: width * 0.033),
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return rowItem(context, index);
        });
  }

  Widget prefixIcon() {
    // ceci est pour l'image de la boite mail dans la notification
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Container(
        margin: EdgeInsets.only(left: width * 0.043),
        child: SvgPicture.asset(
          "images/boite.svg", // l'icon de la boite dans a notification.
          height: height * 0.04,
          width: width * 0.094,
        ));
  }

  Widget rowItem(context, index) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (left) {
          var message = messages[index];
          removeMessage(index);
          showSnackBar(context, message, index);
        },
        background: deletedNotif(),
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.038, vertical: height * 0.01),
          height: height * 0.128,
          width: width * 0.88,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.504,
                height: height * 0.03,
                child: Text(
                  timesanddates[index],
                  style: TextStyle(
                    fontFamily: 'Poppins2',
                    color: Color(0xFFFBBC05).withOpacity(0.6),
                    fontSize: width * 0.038,
                  ),
                ),
              ),
              Container(
                height: height * 0.097,
                width: width * 0.79,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.017),
                  color: Color(0xFFE7E5E5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: width * 0.14, top: height * 0.00604),
                        child: Container(
                          height: height * 0.026,
                          width: width * 0.22,
                          child: Text(messages[index],
                              style: TextStyle(
                                  fontFamily: 'Poppins2',
                                  fontSize: width * 0.035,
                                  color: Color(0xFF081956))),
                        )),
                    Row(
                      children: [
                        prefixIcon(),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: width * 0.033),
                              child: Container(
                                height: height * 0.05,
                                width: width * 0.59,
                                child: Text(descriptions[index],
                                    style: TextStyle(
                                        fontFamily: 'Poppins3',
                                        fontSize: width * 0.03,
                                        color: Color(0xFF081956))),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget deletedNotif() {
    // pour supprimer la notif
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      color: Color(0xff081956),
      child: Icon(Icons.delete, color: Colors.white),
    );
  }

  showSnackBar(context, message, index) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    // c'est pour afficher l'option de annuler la supression de la notif.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xff081956),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.025)),
        content: Text(
          'Notification deleted',
          style: TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
            label: "Undo",
            textColor: Colors.white,
            onPressed: () {
              undoDelete(index, message);
            })));
  }

  undoDelete(index, message) {
    // pour annuler la suppression de la notif.
    setState(() {
      messages.insert(index, message);
    });
  }

  removeMessage(index) {
    // pour supprimer la notif
    setState(() {
      messages.removeAt(index);
    });
  }

  void removeAll() {
    while (messages.isNotEmpty) {
      messages.removeLast();
    }
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 1));
    print("Number of messages on display is: " + messages.length.toString());
    removeAll();

    setState(() {
      addAllMessages();
    });
    return null;
  }

  addAllMessages() async {
    Map<dynamic, dynamic> dataMap = {};
    final ref = FirebaseDatabase.instance
        .ref()
        .child('UsersData/'+FirebaseAuth.instance.currentUser!.uid+'/readings');
    final snapshot = await ref.get();
    Map<dynamic, dynamic> values = snapshot.value as Map;
    dataMap.addAll(values);
    Map reversedMap = Map.fromEntries(dataMap.entries.toList().reversed);
    List<dynamic> list = reversedMap.values.toList();
    list.sort((a, b) => b['timestamp'].compareTo(a['timestamp']),);
    print(list.last['timestamp']);
        print("Length of map is " + dataMap.length.toString());
    print(dataMap.entries);
    for (var item in list) {
      print('${item['timestamp']}');
    }

    print(dataMap.entries.first.value["timestamp"].toString());

    for (var entry in list) {
      int timestamp = int.parse(entry['timestamp'].toString());
      DateTime epoch = DateTime.utc(1970, 1, 1);
      Duration duration = Duration(seconds: timestamp);
      DateTime date = epoch.add(duration);
      /*int number = int.tryParse(entry.value["timestamp"])!*1000;
          Timestamp timestamp1 = Timestamp.fromMillisecondsSinceEpoch(number);
          DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp1.millisecondsSinceEpoch);*/
      print("AAAAAAAAAAAAAAAA" +entry['Messegesent'].toString());
      setState(() {
        if (entry["Messegesent"] == "Hello Dear there is a new letter for you today"){
        messages.add("Happy mail day!");
        descriptions.add(
            "You've got mail!Check out your smart mailbox for a delightful surprise.  ");

        }
        else {
          messages.add("Reset to 0 !");
          descriptions.add(
            "You have retrieved all your emails ");

        }
        //descriptions.add("There are " + entry.value["nbletters"].toString() +" letters in your Mailbox");
        timesanddates.add(date.toUtc().toString().substring(0, 19));
      });

      /*else{
        int number = int.tryParse(entry.value["timestamp"])!*1000;
        Timestamp timestamp1 = Timestamp.fromMillisecondsSinceEpoch(number);
        DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp1.microsecondsSinceEpoch);
        //print(date.toIso8601String());
        print((entry.value["nbletters"]).toString());
        print("Date is "+ date.toString());
        setState(() {
          messages.add("A message has arrived");
          descriptions.add("");
          //descriptions.add("There are " + entry.value["nbletters"].toString() +" letters in your Mailbox");
          timesanddates.add((date.toUtc().toString()).substring(0,19));
        }); 
        } */
    }
  }

  /*addLastMessage() {
    // pour ajouter une notif alea aprés reload de la page
    var data = "NEW";
      DatabaseReference listener =
            FirebaseDatabase.instance.ref().child('UsersData/n00hgjsnN6c7CqyiWZTPpaCZI5I2/readings/');
            listener.onChildAdded.listen((event) {
              var data = event.snapshot.value;
              print(data!);
            });
        setState(() {
          print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + data);
          
        });
        /*int number = int.parse(data.value["timestamp"])*1000;
        Timestamp timestamp1 = Timestamp.fromMillisecondsSinceEpoch(number);
        DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp1.millisecondsSinceEpoch);

        setState(() {
          messages.add('new');
          descriptions.add('HELLO AGAIN');
          timesanddates.add(date.toUtc().toString().substring(0,19));
        }
        );*/
      
      


    
  }*/

  //===================================================

  @override
  Widget build(BuildContext context) {
    imageRef3!.getDownloadURL().then((value) {
      setState(() {
        imageOld4 = value;
        print(FirebaseAuth.instance.currentUser!.uid);
      });
    });

    final mediaQuery = MediaQuery.of(context); // declaration du MediaQuery.
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    // c'estla classe principale pour la page des notifs.
    return Scaffold(
        body: RefreshIndicator(
      key: refreshKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: height * 0.0622, left: width * 0.0585),
                child: InkWell(
                  child: Container(
                      child: SvgPicture.asset(
                    "images/sar.svg",
                    height: height * 0.053,
                    width: width * 0.1,
                  )), // blue arrow icon to return when clicking.
                  onTap: () {
                    Navigator.of(context)
                        .pop(); /* pour retourner a une page qcq aprés le click*/
                  },
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: width * 0.1),
              //   padding: EdgeInsets.only(top: width * 0.1),
              //   child: CircleAvatar(
              //     radius: width * 0.1,
              //     child: CircleAvatar(
              //         radius: width * 0.1,
              //         child: ClipOval(
              //             child: Image.network(
              //           imageOld4,
              //           fit: BoxFit.cover,
              //           width: 100,
              //           height: 100,
              //         ))),
              //   ),
              // ),
            ],
          ),
          Container(
            // the title of the page , en haut a gauche.
            margin: EdgeInsets.only(top: height * 0.0248, left: width * 0.0585),
            child: Container(
              height: height * 0.057,
              width: width * 0.504,
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontFamily: 'Poppins2',
                  fontSize: width * 0.076,
                  color: Color(0xFF081956),
                ),
              ),
            ),
          ),
          Expanded(
            child: ShowList(),
          )
        ],
      ),
      onRefresh: () async {
        // pour rafraichir la page des notifications (c'est comme reload)
        await refreshList();
      },
    ));
  }
}
