import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'FAQ.dart';
import 'Contact_us.dart';
import 'feedbackpage.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return MaterialApp(
      title: 'Help and Support',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.025, left: width * 0.05),
              child: SvgPicture.asset(
                'images/Arrow.svg',
                width: width * 0.1,
                height: height * 0.053,
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(
                left: width * 0.05, top: height * 0.032), // add left padding
            child: Text(
              'Help & Support',
              style: TextStyle(
                color: Color(0xFF081956),
                fontSize: width * 0.076,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Color(0xFFF9F9F9),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.064),
                child: SvgPicture.asset(
                  'images/Group 1.svg',
                  width: width * 0.68,
                  height: height * 0.34,
                ),
              ),
              SizedBox(height: height * 0.064),
              Container(
                width: width,
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Contact Us button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SmartMailboxFAQ()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff081956),
                    backgroundColor: Color(0xffF1F0F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.017),
                    ),
                    minimumSize: Size(width * 0.76, height * 0.071),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'images/QuestionMark.svg',
                          width: width * 0.066,
                          height: height * 0.033,
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                      Text(
                        'Frequent Questions',
                        style: TextStyle(
                          color: Color(0xff081956),
                          fontFamily: 'Poppins',
                          fontSize: width * 0.053,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.038),
              Container(
                width: width,
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Contact Us button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff081956),
                    backgroundColor: Color(0xffF1F0F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.017),
                    ),
                    minimumSize: Size(width * 0.76, height * 0.071),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'images/Star.svg',
                          width: width * 0.066,
                          height: height * 0.033,
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                      Text(
                        'User Feedback',
                        style: TextStyle(
                          color: Color(0xff081956),
                          fontFamily: 'Poppins',
                          fontSize: width * 0.053,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.038),
              Container(
                width: width,
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Contact Us button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff081956),
                    backgroundColor: Color(0xffF1F0F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.017),
                    ),
                    minimumSize: Size(width * 0.76, height * 0.071),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'images/letter.svg',
                          width: width * 0.066,
                          height: height * 0.026,
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          color: Color(0xff081956),
                          fontFamily: 'Poppins',
                          fontSize: width * 0.053,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
