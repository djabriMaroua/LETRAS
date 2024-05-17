import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  //final nameController = TextEditingController();
  //final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return MaterialApp(
      title: 'Contact Us',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xfff5f5fd),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(
                context,
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.025,
                  left: MediaQuery.of(context).size.width * 0.05),
              child: SvgPicture.asset(
                'images/Arrow.svg',
                width: MediaQuery.of(context).size.width * 0.1069,
                height: MediaQuery.of(context).size.height * 0.053,
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
                top: MediaQuery.of(context).size.height * 0.025),
            child: Text(
              'Contact Us',
              style: TextStyle(
                color: Color(0xFF081956),
                fontSize: width * 0.089,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Color(0xFFF9F9F9),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.064),
                  child: SvgPicture.asset(
                    'images/Contact.svg',
                    width: MediaQuery.of(context).size.width * 0.662,
                    height: MediaQuery.of(context).size.height * 0.30,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.42),
                  child: Text(
                    'Get in Touch ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width * 0.071,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff081956),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.height * 0.0716,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.017),
                    color: Color(0xFFF1F0F0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).size.height * 0.0064),
                        child: SvgPicture.asset(
                          'images/letter.svg',
                          width: MediaQuery.of(context).size.width * 0.066,
                          height: MediaQuery.of(context).size.height * 0.026,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text(
                        '[name]19@gmail.com ',
                        style: TextStyle(
                          fontFamily: 'Poppins1',
                          fontSize: width * 0.042,
                          color: Color(0xff081956),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.height * 0.0716,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.017),
                    color: Color(0xFFF1F0F0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.00128,
                            bottom:
                                MediaQuery.of(context).size.height * 0.0064),
                        child: SvgPicture.asset(
                          'images/phone.svg',
                          width: MediaQuery.of(context).size.width * 0.066,
                          height: MediaQuery.of(context).size.height * 0.033,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.00512),
                        child: Text(
                          '0451785341',
                          style: TextStyle(
                            fontFamily: 'Poppins1',
                            fontSize: width * 0.042,
                            color: Color(0xff081956),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.113,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff081956),
                      width: MediaQuery.of(context).size.width * 0.00763,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.025),
                    color: Color.fromRGBO(241, 240, 240, 1),
                  ),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffF1F0F0),
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          color: Color(0xff8189A6),
                          fontSize: width * 0.042,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.00254),
                      ),
                      style: TextStyle(
                        color: Color(0xff081956),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Container(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.79,
                    height: MediaQuery.of(context).size.height * 0.0716,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.79,
                      height: MediaQuery.of(context).size.height * 0.0716,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Color(0xff081956),
                          backgroundColor: Color(0xffFBBC05),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.017),
                          ),
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.019,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.019,
                              right: MediaQuery.of(context).size.width * 0.038,
                              left: MediaQuery.of(context).size.width * 0.038),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await sendEmail(
                                'm2010.226@gmail.com',
                                'user',
                                messageController.value.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              response == 200
                                  ? const SnackBar(
                                      content: Text('Message Sent!'),
                                      backgroundColor: Colors.green)
                                  : const SnackBar(
                                      content: Text('Failed to send message!'),
                                      backgroundColor: Colors.red),
                            );
                            // nameController.clear();
                            //emailController.clear();
                            messageController.clear();
                          }
                        },
                        child: Center(
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

Future sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_pdwi9ff';
  const templateId = 'template_r1zg0cr';
  const userId = 'XNHWJ6GAFsyhAebSY';
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      }, //This line makes sure it works for all platforms.
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message
        }
      }));
  return response.statusCode;
}
