import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupPageState();
}
 Widget buildusername(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Text(
        'Username',
        style:TextStyle(
          color:Color(0xFF081956),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

      ),
           SizedBox(height: 10),
           Container(
            alignment: Alignment.centerLeft,
            decoration:BoxDecoration(
              color:Color(0xFFE7E5E5),
              borderRadius:BorderRadius.circular(7),

            ),
            height: 56,
            child:TextField(
              keyboardType: TextInputType.name,
              style:TextStyle(
                color: Color(0xFF081956),

              ),
               decoration: InputDecoration(
                border:InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                prefixIcon: Icon(
                  Icons.person,
                  color:Color(0xff80C5DD),
                ),
                hintText: 'Enter your username',
                hintStyle: TextStyle(
                 color:Color(0xff7A9197),
                

                ),
               ),
            ),
           ),
    ],
  );
 }
Widget buildEmail(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Text(
        'Email',
        style:TextStyle(
          color:Color(0xFF081956),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

      ),
           SizedBox(height: 10),
           Container(
            alignment: Alignment.centerLeft,
            decoration:BoxDecoration(
              color:Color(0xFFE7E5E5),
              borderRadius:BorderRadius.circular(7),

            ),
            height: 56,
            child:TextField(
              keyboardType: TextInputType.emailAddress,
              style:TextStyle(
                color: Color(0xFF081956),

              ),
               decoration: InputDecoration(
                border:InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                prefixIcon: Icon(
                  Icons.email,
                  color:Color(0xff80C5DD),
                ),
                hintText: 'Enter your email',
                hintStyle: TextStyle(
                 color:Color(0xff7A9197),
                

                ),
               ),
            ),
           ),
    ],
  );
 }
Widget buildphoneNumber(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Text(
        'Phone Number',
        style:TextStyle(
          color:Color(0xFF081956),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

      ),
           SizedBox(height: 10),
           Container(
            alignment: Alignment.centerLeft,
            decoration:BoxDecoration(
              color:Color(0xFFE7E5E5),
              borderRadius:BorderRadius.circular(7),

            ),
            height: 56,
            child:TextField(
              keyboardType: TextInputType.phone,
              style:TextStyle(
                color: Color(0xFF081956),

              ),
               decoration: InputDecoration(
                border:InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                prefixIcon: Icon(
                  Icons.phone,
                  color:Color(0xff80C5DD),
                ),
                hintText: 'Enter your phone number',
                hintStyle: TextStyle(
                 color:Color(0xff7A9197),
                

                ),
               ),
            ),
           ),
    ],
  );
 }


 Widget buildpassword(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Text(
        'Password',
        style:TextStyle(
          color:Color(0xFF081956),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

      ),
           SizedBox(height: 10),
           Container(
            alignment: Alignment.centerLeft,
            decoration:BoxDecoration(
              color:Color(0xFFE7E5E5),
              borderRadius:BorderRadius.circular(7),

            ),
            height: 56,
            child:TextField(
              obscureText: true,
              style:TextStyle(
                color: Color(0xFF081956),

              ),
               decoration: InputDecoration(
                border:InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                prefixIcon: Icon(
                  Icons.lock,
                  color:Color(0xff80C5DD),
                ),
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                 color:Color(0xff7A9197),
                

                ),
               ),
            ),
           ),
    ],
  );
 }

Widget buildSignUpBtn(){
return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
       child: SizedBox(
      width: 313, // set the width here
      height: 56, 
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor:Color(0xff081956) ,
         backgroundColor: Color(0xffFBBC05),
          shape:BeveledRectangleBorder(
           borderRadius: BorderRadius.circular(3),

            
          ),
          padding: const EdgeInsets.all(15),              
        ),        
        onPressed: () => print('Sign Up'),
        child:Center(
          child: Text('Sign Up',
        style:TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
        ),
        ),                
        ),     
       ),
  );
}
Widget buildLoginBtn(){
  return  Center(
    child:GestureDetector(
    onTap:() => print('Login Pressed'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
             children: [

        Text(
          'Have you already an account?',
          style:TextStyle(
            color:Color(0xff081956),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Log In',
          style:TextStyle(
            color:Color(0xff081956),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    ),
  );
}
class _SignupPageState extends State<SignupPage> {
 @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return Scaffold(
      body:AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child:GestureDetector(
          child:Stack(
            children:<Widget>[
              Container(
                height: double.infinity,
                width:double.infinity,
                decoration:BoxDecoration(
                     color:Color(0xF9F9F9),                   
                  ),
                  child:SingleChildScrollView(
                    padding:EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 220,
                    ),
                    child:Column(
                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                     
                      Text(
                        'Sign Up',
                        style:TextStyle(
                          color: Color(0xFF081956),
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height:50),
                       buildusername(),
                       SizedBox(height:20),

                       buildEmail(),
                          SizedBox(height:20),
                       buildphoneNumber(),
                            SizedBox(height:30),
                      buildSignUpBtn(),
                      //SizedBox(height:10),
                      buildLoginBtn(),
                    ],
                  ),
                  ),
                ), 
                 Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'images/image1.png',
                  height: 100, // set your desired height
                  width: 100, // set your desired width
                ),
                 ),             
            ],
          ),
        ),
      ),
   );
  }

}