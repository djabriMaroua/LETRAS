import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'EditProfile.dart';
import 'package:flutter_application_3/EditProfile.dart';

String imageOld2 = " ";
final storageRef = FirebaseStorage.instance.ref();
Reference? imageRef1 =
    storageRef.child(FirebaseAuth.instance.currentUser!.uid + "/Picture");
final db = FirebaseFirestore.instance
    .collection('Users')
    .doc(FirebaseAuth.instance.currentUser!.uid);
Map<String, dynamic> documentData = {
  'Email': '',
  'Password': '',
  'Phone': '',
  'Username': '',
  'isVerified': ''
};
void getData() async {
  db.get().then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      // Save the document data in the variable
      documentData = documentSnapshot.data() as Map<String, dynamic>;
      print(documentData);
    } else {
      print('Document does not exist on the database');
    }
  });
}

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final db = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    imageRef1!.getDownloadURL().then((value) {
      setState(() {
        imageOld2 = value;
        print(FirebaseAuth.instance.currentUser!.uid);
      });
    });
    getData();

    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.08,
          backgroundColor: Color(0xfff9f9f9),
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
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
            padding: EdgeInsets.only(left: width * 0.2, top: height * 0.028),
            child: Text(
              'Profile',
              style: TextStyle(
                color: Color(0xff081956),
                fontSize: width * 0.076,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: height * 0.17,
                  width: width * 0.34,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.025, left: width * 0.05),
                    child: CircleAvatar(
                      radius: width * 0.17,
                      child: CircleAvatar(
                          radius: width * 0.17,
                          child: ClipOval(
                              child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ))),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Username',
                      style: TextStyle(
                        color: Color(0xFF081956),
                        fontFamily: 'Poppins2',
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    margin: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    height: height * 0.0716,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.017),
                      color: Color(0xFFF1F0F0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: height * 0.0064),
                         child: SvgPicture.asset(
                            'images/user.svg',
                            width: width * 0.062,
                            height: height * 0.024,
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          documentData['Username'],
                          //FirebaseAuth.instance.currentUser?.displayName as String,
                          style: TextStyle(
                            fontFamily: 'Poppins1',
                            fontSize: width * 0.042,
                            color: Color(0xff081956),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Color(0xFF081956),
                        fontFamily: 'Poppins2',
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    margin: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    height: height * 0.0716,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.017),
                      color: Color(0xFFF1F0F0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: height * 0.0064),
                          child: SvgPicture.asset(
                            'images/letter.svg',
                            width: width * 0.066,
                            height: height * 0.026,
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          documentData['Email'],
                          //documentData['Email'],
                          //FirebaseAuth.instance.currentUser?.displayName as String,
                          style: TextStyle(
                            fontFamily: 'Poppins1',
                            fontSize: width * 0.042,
                            color: Color(0xff081956),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xFF081956),
                        fontFamily: 'Poppins2',
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    margin: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    height: height * 0.0716,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.017),
                      color: Color(0xFFF1F0F0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: height * 0.0064),
                          child: SvgPicture.asset(
                            'images/Password.svg',
                            width: width * 0.07,
                            height: height * 0.03,
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          documentData['Password'],
                          style: TextStyle(
                            fontFamily: 'Poppins1',
                            fontSize: width * 0.042,
                            color: Color(0xff081956),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Phone nmuber',
                      style: TextStyle(
                        color: Color(0xFF081956),
                        fontFamily: 'Poppins2',
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    margin: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    height: height * 0.0716,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.017),
                      color: Color(0xFFF1F0F0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: height * 0.0064),
                          child: SvgPicture.asset(
                            'images/phone.svg',
                            width: width * 0.07,
                            height: height * 0.03,
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          documentData['Phone'],
                          //FirebaseAuth.instance.currentUser?.phoneNumber as String,
                          style: TextStyle(
                            fontFamily: 'Poppins1',
                            fontSize: width * 0.042,
                            color: Color(0xff081956),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Container(
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
                            borderRadius: BorderRadius.circular(width * 0.017),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: width * 0.048,
                              fontFamily: "Poppins2",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      /*Center(),
        child:Column()
         Text(
        'Username',
        style:TextStyle(
          color:Color(0xFF081956),
          fontFamily: 'Poppins2',
          fontSize: width*0.045,
        ),
      ),
           SizedBox(height:height*0.01),
         Container(
           decoration: BoxDecoration(
           color: Color(0xffF1F0F0),
           borderRadius: BorderRadius.circular(7),
      ),
                width: width,
                padding: EdgeInsets.only(left:width*0.05, right:width*0.05),     
  child: Row(
    children: [                
               Container(
                child: SvgPicture.asset(
                  'images/User.svg',
                  width: width*0.066,
                  height: height*0.026,
                ),
                ),
      SizedBox(width: width*0.05),
     Text(
        'Maha Remil',
        style: TextStyle(
          color: Color(0xff081956),
          fontFamily: 'Poppins1',
          fontSize: width*0.04,
        ),
      
      ),
    ],
  
  ),
              ), 
                  
             
  
      
             
    

             
            
          ),
        ),
     
   
   );
  }

}*/