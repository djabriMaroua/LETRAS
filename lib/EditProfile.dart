import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/Profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';


final storageRef = FirebaseStorage.instance.ref();
Reference? imageRef = storageRef.child(FirebaseAuth.instance.currentUser!.uid + "/Picture");
String imageUrl = " ";
late var pickedFile;
  final phoneNum = TextEditingController() ;
    final username = TextEditingController() ;
    final password = TextEditingController();
    final email = TextEditingController();

void updateUser(){
    FirebaseAuth.instance.currentUser!.updateDisplayName(username.text.trim());
    FirebaseAuth.instance.currentUser!.updateEmail(email.text.trim());
    FirebaseAuth.instance.currentUser!.updatePassword(password.text.trim());

    
    db.set({'Email':email.text.trim(),
              'Password':password.text.trim(),
              'Phone':phoneNum.text.trim(),
              'Username': username.text.trim(),
              'isVerified': 'false' 
              }
    );    

}


class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditProfilePageState();
}
class _EditProfilePageState extends State<EditProfile> {

  final ImagePicker picker=ImagePicker();
  
 @override
 
 
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height=mediaQuery.size.height;
    final width=mediaQuery.size.width;
    bool _obscureText = true;
   imageRef!.getDownloadURL().then((value) {
     setState(() {
       imageUrl = value;
     });
   },);
   return MaterialApp(
    
    title: 'Edit Profile',
     debugShowCheckedModeBanner: false,
     home:Scaffold(
      backgroundColor:Color(0xfff9f9f9),
      appBar:AppBar(
        toolbarHeight:height* 0.08,
        backgroundColor: Color(0xfff9f9f9),
         elevation: 0.0,
          leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
             
            },
            child:Padding(
              padding: EdgeInsets.only( top :height*0.025, left :width*0.05),
              child: SvgPicture.asset(
                'images/Arrow.svg',
                width:width*0.1069,
                height: height*0.053,
              ),
            ),
        ),
         title: Padding(
          padding :EdgeInsets.only(left:width*0.095,top:height*0.028),
          child: Text(
            'Edit Profile',
            style:TextStyle(
              color:Color(0xff081956),
              fontSize:width*0.076,
              fontFamily:'Poppins',
              fontWeight: FontWeight.bold,              
            ),
          ),
         ), 
      ),
      body:SingleChildScrollView(
        child:Center(
          child:Column(
            children: [
              SizedBox(height: height*0.02,),
             Center(
     child: Stack(
      children: <Widget>[
        Container(
          height:height*0.17,
           width:width*0.34,
          child: CircleAvatar(
            radius:width*0.17,
            child:CircleAvatar(
              radius:width*0.17,
              child: ClipOval(child: Image.network(imageUrl , fit: BoxFit.cover, width: 100, height: 100,))
              
            ),
          ),
        ),
        Positioned(
          bottom: height*0.025,
          right:width*0.01,
          child:InkWell(
            onTap: () {
            showModalBottomSheet(
             context:context,
             builder: (context)=>bottomSheet(context),
             backgroundColor: Color(0xffF9F9F9),
             shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
               top:Radius.circular(width*0.10),
                      ),
                     ),
             );          
            },
            child: Icon(
              Icons.camera_alt,
              color:Color(0xffFBBC05),
              size:width*0.065,
            ),
          ),
        ),
      ],
     ),
   ),
              SizedBox(height:height*0.01,),
              Container(
                width: width,
                padding: EdgeInsets.only(left:width*0.05, right:width*0.05),
                child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
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
            alignment: Alignment.centerLeft,
            decoration:BoxDecoration(
              color:Color(0xFFE7E5E5),
              borderRadius:BorderRadius.circular(width*0.017),
            ),
            height: height*0.07,
            child:Padding(
              padding: const EdgeInsets.only(left:0.4),
              child: TextField(
                controller: username,
                keyboardType: TextInputType.name,
                style:TextStyle(
                  color: Color(0xFF081956),
            
                ),
                 decoration: InputDecoration(
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:height*0.017,left:width*0.10,right:width*0.05),
                  prefixIcon: Container(
                  padding: EdgeInsets.only(left:width*0.02),

                   child: Icon(
                      Icons.person,
                      color:Color(0xff80C5DD),
                      weight: 40,
                      size:width*0.076,
                    ),
                 ),              
                  
                  hintText: 'Enter your username',              
                  hintStyle: TextStyle(
                   color:Color(0xff7A9197),
                   fontFamily: 'Poppins1',
                   fontSize: width*0.04,
                  
            
                  ),
                 ),
              ),
            ),
           ),
    ],
  ),
                ),
                SizedBox(height: height*0.01,),
                 Container(
                  width: width,
                  padding: EdgeInsets.only(left:width*0.05, right:width*0.05),
                  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Text(
        'Email',
        style:TextStyle(
          color:Color(0xFF081956),
          fontFamily: 'Poppins2',
          fontSize: width*0.045,
        ),

      ),
           SizedBox(height:height*0.01),
           Container(
            alignment: Alignment.centerLeft,
            decoration:BoxDecoration(
              color:Color(0xFFE7E5E5),
              borderRadius:BorderRadius.circular(width*0.017),

            ),
            height: height*0.07,
            child:Padding(
              padding: const EdgeInsets.only(left:0.4),
              child: TextField(
                controller: email,
                keyboardType: TextInputType.name,
                style:TextStyle(
                  color: Color(0xFF081956),
            
                ),
                 decoration: InputDecoration(
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:height*0.015,left:width*0.10,right:width*0.05),
                  prefixIcon: Container(
                  padding: EdgeInsets.only(left:width*0.02),

                   child: Icon(
                      Icons.email,
                      color:Color(0xff80C5DD),
                      weight: 40,
                      size:width*0.076,
                    ),
                 ),              
              
                  hintText: 'Enter your email',              
                  hintStyle: TextStyle(
                   color:Color(0xff7A9197),
                   fontFamily: 'Poppins1',
                   fontSize: width*0.04,            
                  ),
                 ),
              ),
            ),
           ),
    ],
  ),
                 ),
                 SizedBox(height: height*0.01,),
                 Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left:width*0.05, right:width*0.05),
                  child:  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Text(
        'Password',
        style:TextStyle(
          color:Color(0xFF081956),
          fontFamily: 'Poppins2',
           fontSize: width*0.045,
        ),

      ),
           SizedBox(height:height*0.01),
           Container(
            alignment: Alignment.centerLeft,
            decoration:BoxDecoration(
              color:Color(0xFFE7E5E5),
              borderRadius:BorderRadius.circular(width*0.017),

            ),
            height: height*0.07,
            child:Padding(
              padding: const EdgeInsets.only(left:0.4),
              child: TextField(
                controller: password,
              obscureText: _obscureText,

  keyboardType: TextInputType.name,
  style:TextStyle(
    color: Color(0xFF081956),
  ),
  decoration: InputDecoration(
    border:InputBorder.none,
    contentPadding: EdgeInsets.only(top:height*0.018,left:width*0.10,right:width*0.05),
    prefixIcon: Container(
      padding: EdgeInsets.only(left:width*0.02),
      child: Icon(
        Icons.lock,
        color:Color(0xff80C5DD),
        weight: 40,
        size:width*0.076,
      ),
    ),              
    hintText: 'Enter your password',              
    hintStyle: TextStyle(
      color:Color(0xff7A9197),
      fontFamily: 'Poppins1',
      fontSize: width*0.04,            
    ),
    suffixIcon: IconButton(
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
        print("maha");
      },
      icon:
        _obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
        color:Color(0xff80C5DD),
        
      ),
      
    ),
  ),

),
            ),
    ]
    
  ),
                 ),
                 SizedBox(height: height*0.01,),
                 Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left:width*0.05, right:width*0.05),
                  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Text(
        'Phone Number',
        style:TextStyle(
          color:Color(0xFF081956),
          fontFamily: 'Poppins2',
          fontSize: width*0.045,
        ),

      ),
           SizedBox(height:height*0.01),
           Container(
            alignment: Alignment.centerLeft,
            decoration:BoxDecoration(
              color:Color(0xFFE7E5E5),
              borderRadius:BorderRadius.circular(width*0.017),

            ),
            height: height*0.07,
            child:Padding(
              padding: const EdgeInsets.only(left:0.4),
              child: TextField(
                controller: phoneNum,
                keyboardType: TextInputType.phone,
                style:TextStyle(
                  color: Color(0xFF081956),
            
                ),
                 decoration: InputDecoration(
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:height*0.017,left:width*0.10,right:width*0.05),
                  prefixIcon: Container(
                  padding: EdgeInsets.only(left:width*0.02),

                   child: Icon(
                      Icons.phone,
                      color:Color(0xff80C5DD),
                      weight: 40,
                      size:width*0.076,
                    ),
                 ),              
              
                  hintText: 'Enter your phone number',              
                  hintStyle: TextStyle(
                   color:Color(0xff7A9197),
                   fontFamily: 'Poppins1',
                  fontSize: width*0.04,            
                  ),
                 ),
              ),
            ),
           ),
    ],
  ),
                 ),
                 SizedBox(height:height*0.03),
                  Container(
                  padding:EdgeInsets.only(right:width*0.05,left:width*0.05),
                  width: width,
                  child:SizedBox(
                    width:width*0.79,
                    height:height*0.0716,
                    child: ElevatedButton(               
                      style:ElevatedButton.styleFrom(
                       elevation: 0,
                        foregroundColor:Color(0xff081956) ,
                        backgroundColor: Color(0xffFBBC05),
                        shape:BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(width*0.017),   
                       ),         
                      
          ),        
          onPressed: (){
            updateUser();
            Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Profile()));

          },
          child:Center(
            child: Text('Confirm',
          style:TextStyle(
            fontSize: width*0.048,
            fontFamily:"Poppins2",
          ),
          ),
          ),                
          
                    ),
              
                  ),
                ),
                SizedBox(
                  height:height*0.001,
                ),
                Container(
                  child: TextButton(
                    onPressed:( 
                      
                    ){
                       Navigator.of(context).pop(context,);
                    },                    
                    child: Center(
                      child: Text(
                        'Cancel',
                        style:TextStyle(
                          color:Color(0xff081956),
                          fontSize: width*0.048,
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
}
// To allow the user to change his photo from the galery or by taking another one 
Widget bottomSheet(BuildContext context){
  final mediaQuery = MediaQuery.of(context);
  final height = mediaQuery.size.height;
  final width = mediaQuery.size.width;
  return Container( 

    height:height*0.2,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(horizontal: width*0.05,vertical: width*0.05),
    child: Column(
      children:<Widget> [
        Text(
          'Choose a Profile Photo',
          style:TextStyle(
            fontSize: width*0.06,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Color(0xff081956),
            ),          
        ),
        SizedBox(height : height*0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
             Padding(
               padding:  EdgeInsets.only(left:width*0.02),
               child: ElevatedButton.icon(onPressed: openCamera,         
                           
                icon: Icon(Icons.camera,
                color:Color(0xff081956),
                size:0.06*width,
                ),
                 label: Text("Camera",
                 style:TextStyle(
                  fontSize: width*0.05,
                  fontFamily: 'Poppins1',
                  color:Color(0xff081956),
                 ),
                 ),
                 style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xff80C5DD)),
                      fixedSize: MaterialStateProperty.all(Size(width*0.38, height*0.05)),

                 ),
                 ),
             ),
               SizedBox(width:width*0.05,),
             Padding(
               padding:  EdgeInsets.only(right:width*0.02),
               child: ElevatedButton.icon(
                onPressed: 
              pickImage,
                icon: Icon(Icons.image,
                color:Color(0xff081956),
                size:0.06*width,
                ),
                 label:Text("Gallery",
                 style:TextStyle(
                  fontSize: width*0.05,
                  fontFamily: 'Poppins1',
                  color:Color(0xff081956),
                 ),
                 ),
                 style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xff80C5DD)),
                  fixedSize: MaterialStateProperty.all(Size(width*0.38, height*0.05)),

                 ),
                 ),
             ),
          ],
        ),
      ],
    ),
    );
}


 void openCamera() async {
              // ignore: deprecated_member_use
              final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

              await imageRef!.putFile(File(pickedFile!.path));
              imageRef!.getDownloadURL().then((value){
                  setState(){
                    imageUrl = value;
                  }
              });

}
void pickImage() async {
             final picker = ImagePicker();
              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
            await imageRef!.putFile(File(pickedFile!.path));
              imageRef!.getDownloadURL().then((value){
                  setState(){
                    imageUrl = value;
                  }
              });
            

  // Do something with the picked image file
}