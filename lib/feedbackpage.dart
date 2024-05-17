import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  bool _isAddingFeedback = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return MaterialApp(
      title: 'User Feedback',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.08,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(
                context,
              );
            },
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.025, left: width * 0.05),
              child: SvgPicture.asset(
                'images/Arrow.svg',
                width: width * 0.1069,
                height: height * 0.053,
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: width * 0.05, top: height * 0.028),
            child: Text(
              'User Feedback',
              style: TextStyle(
                color: Color(0xff081956),
                fontSize: width * 0.076,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Color(0xffF9F9F9),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * 0.03),
                  child: SvgPicture.asset(
                    'images/UserFeed.svg',
                    width: width * 0.79,
                    height: height * 0.31,
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Container(
                  child: Text(
                    'Your opinion matters to us ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width * 0.058,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff081956),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: width,
                  margin:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Text(
                    'We work super hard to serve you '
                    'better and would love to know how '
                    'would you rate our app?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins2',
                      fontSize: width * 0.043,
                      color: Color(0xff424F7D),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                    width: width,
                    height: height * 0.03,
                    child: Center(
                      child: RatingBar.builder(
                        itemCount: 5,
                        //itemSize: 40,
                        itemSize: height * 0.0512,
                        initialRating: 1,
                        glow: true,
                        minRating: 1,
                        allowHalfRating: true,
                        updateOnDrag: true,
                        itemPadding: EdgeInsets.only(
                            left: width * 0.01, right: width * 0.01),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (value) {},
                      ),
                    )),
                SizedBox(
                  height: height * 0.07,
                ),
                Container(
                  padding:
                      EdgeInsets.only(right: width * 0.05, left: width * 0.05),
                  width: width,
                  child: SizedBox(
                    width: width * 0.79,
                    height: height * 0.0716,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: Color(0xff081956),
                        backgroundColor: Color(0xffFBBC05),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: width * 0.048,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.002,
                ),
                Container(
                  child: TextButton(
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                        child: Column(
                          children: [
                            Builder(
                              builder: (context) {
                                final mediaQuery = MediaQuery.of(context);

                                final height = mediaQuery.size.height;

                                final width = mediaQuery.size.width;

                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: SvgPicture.asset(
                                      'images/Bari.svg',
                                      width: width * 0.21,
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Container(
                              child: Text(
                                'What can we improve?',
                                style: TextStyle(
                                  color: Color(0xff081956),
                                  fontFamily: 'Poppins',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.058,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.16,
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.05),
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.05),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff081956),
                                  width: MediaQuery.of(context).size.width *
                                      0.00763,
                                ),
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.025),
                                color: Color(0xffAAD7E7),
                              ),
                              child: TextField(
                                controller: _feedbackController,
                                decoration: InputDecoration(
                                  fillColor: Color(0xffAAD7E7),
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Type your feedback here',
                                  hintStyle: TextStyle(
                                    color: Color(0xff4C6993),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.00254),
                                ),
                                style: TextStyle(
                                  color: Color(0xff081956),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Builder(builder: (context) {
                              final mediaQuery = MediaQuery.of(context);

                              final height = mediaQuery.size.height;

                              final width = mediaQuery.size.width;
                              return Container(
                                padding: EdgeInsets.only(
                                    right: width * 0.05, left: width * 0.05),
                                width: width,
                                child: SizedBox(
                                  width: width * 0.79,
                                  height: height * 0.0716,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      foregroundColor: Color(0xff081956),
                                      backgroundColor: Color(0xffFBBC05),
                                      shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.017),
                                      ),
                                    ),
                                    onPressed: () {
                                      _isAddingFeedback ? null : _addFeedback();
                                      Navigator.of(context).pop();
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Center(
                                          child: Column(
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final mediaQuery =
                                                      MediaQuery.of(context);

                                                  final height =
                                                      mediaQuery.size.height;

                                                  final width =
                                                      mediaQuery.size.width;

                                                  return InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: height * 0.02),
                                                      child: SvgPicture.asset(
                                                        'images/Bari.svg',
                                                        width: width * 0.21,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.07,
                                              ),
                                              Container(
                                                child: Text(
                                                  'Thanks!',
                                                  style: TextStyle(
                                                    color: Color(0xff081956),
                                                    fontFamily: 'Poppins',
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.076,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.05,
                                                    right:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.05),
                                                padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.05,
                                                    right:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.05),
                                                child: Text(
                                                  'Your opinion is very important '
                                                  'for us. '
                                                  'Our team of specialists will look '
                                                  'at your feedback.',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xff4C6993),
                                                    fontFamily: 'Poppins',
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.053,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Container(
                                                //margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03),
                                                child: SvgPicture.asset(
                                                  'images/true.svg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.076,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        backgroundColor: Color(0xffAAD7E7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(width * 0.10),
                                          ),
                                        ),
                                      );
                                    },
                                    child: _isAddingFeedback
                                        ? CircularProgressIndicator()
                                        : Center(
                                            child: Text(
                                              'Send',
                                              style: TextStyle(
                                                fontSize: width * 0.048,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      backgroundColor: Color(0xffAAD7E7),
                      //isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(width * 0.10),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Send a feedback',
                        style: TextStyle(
                          color: Color(0xff081956),
                          fontSize: width * 0.048,
                          fontFamily: 'Poppins2',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addFeedback() async {
    setState(() {
      _isAddingFeedback = true;
      print("fddffdfddf");
    });

    print("fddffdfddf");
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userFeedbackCollection =
        firestore.collection('userFeedback');

    Map<String, dynamic> feedbackData = {
      //'username': _usernameController.text,
      'feedback': _feedbackController.text,
      'timestamp': FieldValue.serverTimestamp(),
    };
    print("fddffdfddf");
    final result = await userFeedbackCollection.add(feedbackData);
    if (result.id != null && result.id.isNotEmpty) {
      print('Feedback ajouté avec succès');
      setState(() {
        _isAddingFeedback = false;
      });
    } else {
      print('Erreur : impossible d\'ajouter le feedback');
      setState(() {
        _isAddingFeedback = false;
      });
    }
  }

  /*void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }*/

  @override
  void dispose() {
    _usernameController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }
}

// Widget buildSheet(BuildContext context)=>Center(

//   child:   Column(

//           children: [

//                 Builder(

//                 builder: (context) {

//                   final mediaQuery = MediaQuery.of(context);

//                   final height = mediaQuery.size.height;

//                   final width = mediaQuery.size.width;

//                   return InkWell(

//                     onTap: () {
//                       Navigator.of(context).pop();

//                     },

//                     child: Padding(
//                       padding: EdgeInsets.only(top:height*0.02),
//                       child: SvgPicture.asset(
//                         'images/Bar.svg',
//                         width: width*0.21,

//                       ),

//                     ),

//                   );

//                 },

//               ),
//               Builder(
//                 builder: (context) {
//                   final mediaQuery = MediaQuery.of(context);

//                   final height = mediaQuery.size.height;

//                   final width = mediaQuery.size.width;
//                   return SizedBox(
//                     height:height*0.05,
//                   );
//                 }
//               ),

//                   Container(

//                     child: Text(
//                       'What can we improve?',
//                       style:TextStyle(
//                         color:Color(0xff081956),
//                         fontFamily: 'Poppins',
//                         fontSize: MediaQuery.of(context).size.width*0.058,
//                         fontWeight: FontWeight.bold,
//                       ),
//                    ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.05,
//               ),
//               Container(
//                  width:MediaQuery.of(context).size.width,
//                  height:MediaQuery.of(context).size.height*0.16,
//                  padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, right:MediaQuery.of(context).size.width*0.05),
//                  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, right:MediaQuery.of(context).size.width*0.05),

//         decoration: BoxDecoration(
//         border: Border.all(color: Color(0xff081956),

//         width:MediaQuery.of(context).size.width*0.00763,
//         ),
//         borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.025),
//         color:Color(0xffAAD7E7),
//         ),
//   child: TextField(
//         decoration: InputDecoration(
//           fillColor: Color(0xffAAD7E7),
//           filled: true,
//           border: InputBorder.none,
//           hintText: 'Type your feedback here',
//           hintStyle: TextStyle(
//             color: Color(0xff4C6993),
//             fontSize: MediaQuery.of(context).size.width*0.04,
//           ),
//            contentPadding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.00254),

//         ),
//         style:TextStyle(
//           color:Color(0xff081956),
//         ),
//   ),
// ),

//        SizedBox(
//            height: MediaQuery.of(context).size.height*0.05,
//            ),
//         Builder(
//           builder: (context) {

//                   final mediaQuery = MediaQuery.of(context);

//                   final height = mediaQuery.size.height;

//                   final width = mediaQuery.size.width;
//                  return Container(

//                           padding:EdgeInsets.only(right:width*0.05,left:width*0.05),

//                           width: width,
//                           child:SizedBox(
//                             width:width*0.79,
//                             height:height*0.0716,
//                             child: ElevatedButton(
//                               style:ElevatedButton.styleFrom(
//                                elevation: 0,
//                                 foregroundColor:Color(0xff081956) ,
//                                 backgroundColor: Color(0xffFBBC05),
//                                 shape:BeveledRectangleBorder(
//                                 borderRadius: BorderRadius.circular(width*0.017),
//                                ),

//                   ),
//                   onPressed: (){
//                    Navigator.of(context).pop();
//                    showModalBottomSheet(context: context,
//                      builder: (context)=>buildSheet2(context),
//                      backgroundColor: Color(0xffAAD7E7),
//                      shape:RoundedRectangleBorder(
//                       borderRadius: BorderRadius.vertical(
//                         top:Radius.circular(width*0.10),
//                       ),
//                      ),
//                      );
//                   },
//                   child:Center(
//                     child: Text('Send',
//                   style:TextStyle(
//                     fontSize: width*0.048,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   ),
//                   ),

//                             ),

//                           ),
//                         );
//           }
//         ),

//           ],

//         ),
// );

// Widget buildSheet2(BuildContext context) => Center(
//       child: Column(
//         children: [
//           Builder(
//             builder: (context) {
//               final mediaQuery = MediaQuery.of(context);

//               final height = mediaQuery.size.height;

//               final width = mediaQuery.size.width;

//               return InkWell(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(top: height * 0.02),
//                   child: SvgPicture.asset(
//                     'images/Bari.svg',
//                     width: width * 0.21,
//                   ),
//                 ),
//               );
//             },
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.07,
//           ),
//           Container(
//             child: Text(
//               'Thanks!',
//               style: TextStyle(
//                 color: Color(0xff081956),
//                 fontFamily: 'Poppins',
//                 fontSize: MediaQuery.of(context).size.width * 0.076,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.03,
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.only(
//                 left: MediaQuery.of(context).size.width * 0.05,
//                 right: MediaQuery.of(context).size.width * 0.05),
//             padding: EdgeInsets.only(
//                 left: MediaQuery.of(context).size.width * 0.05,
//                 right: MediaQuery.of(context).size.width * 0.05),
//             child: Text(
//               'Your opinion is very important '
//               'for us. '
//               'Our team of specialists will look '
//               'at your feedback.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xff4C6993),
//                 fontFamily: 'Poppins',
//                 fontSize: MediaQuery.of(context).size.width * 0.053,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.03,
//           ),
//           Container(
//             //margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03),
//             child: SvgPicture.asset(
//               'images/true.svg',
//               width: MediaQuery.of(context).size.width * 0.15,
//               height: MediaQuery.of(context).size.height * 0.076,
//             ),
//           ),
//         ],
//       ),
//     );
