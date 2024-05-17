import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Help_Support.dart';

class SmartMailboxFAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final mediaQuery = MediaQuery.of(context);
    final height=mediaQuery.size.height;
    final width=mediaQuery.size.width;
    return Scaffold(
       backgroundColor: Color(0xFFF9F9F9),

        appBar: AppBar(          
          toolbarHeight:height* 0.08,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(
                 context,
              );
             
            },
            child: Padding(
           padding: EdgeInsets.only(top: height*0.025, left:width*0.05),
              child: SvgPicture.asset(
                'images/Arrow.svg',              
               width:width*0.1,
                height: height*0.053,
              ),
            ),
          ),
          title:Padding(
         padding: EdgeInsets.only(left:width*0.00254 ,top:height*0.023), // add left padding
    child: Text('Frequent Questions',
      style: TextStyle(
        color:Color(0xFF081956),
        fontSize: 25,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  backgroundColor: Color(0xFFF9F9F9),
),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top:height*0.02,bottom:height*0.02,left:width*0.04,right:width*0.04),
        child: Column(
          children: [
            QuestionContainer(
              question: 'How do I install and set up the app?',
            ),
            SizedBox(height:height*0.02),
            
            AnswerContainer(
              answer:
                  'You can download the app from the app store on your mobile device and follow the instructions to set up your mailbox by connecting it to your home Wi-Fi network.',
            ),
            SizedBox(height:height*0.02),
            QuestionContainer(
              question: 'What types of mail can be delivered to the smart mailbox?',
            ),
            SizedBox(height:height*0.02),
            AnswerContainer(
              answer:
              'The smart mailbox is designed to receive standard-sized envelopes and packages that can fit inside the mailbox.'

            ),
            SizedBox(height:height*0.02),
            QuestionContainer(
              question: 'Is the app compatible with different types of mobile devices and operating systems?',
            ),
            SizedBox(height:height*0.02),
            AnswerContainer(
              answer:
          'Yes, the app is compatible with a wide range of mobile devices and operating systems, including iOS and Android.'  
          ),
            SizedBox(height:height*0.02),
            QuestionContainer(
              question:
             'Can I use the smart mailbox with multiple users or accounts?'
            ),
            SizedBox(height:height*0.02),
            AnswerContainer(
              answer:
              'Yes, many smart mailboxes allow for multiple users or accounts. Each user can create their own profile within the app and customize their settings.'
            ),
            SizedBox(height:height*0.02),
            QuestionContainer(
              question: 
              'How do I know when it is time to empty my smart mailbox?'
            ),
            SizedBox(height:height*0.02),
            AnswerContainer(
              answer:
                'Most smart mailboxes will send you a notification when your mailbox is getting full, or when it is time to empty it. Some smart mailboxes also have sensors or indicators that can show you how much mail is inside at any given time. '
            ),
            SizedBox(height:height*0.02),
            QuestionContainer(
              question:
                  'What are the advantages of using a smart mailbox over a traditional mailbox?',
            ),
            SizedBox(height:height*0.02),
            AnswerContainer(
              answer:
                  'Smart mailboxes offer several advantages over traditional mailboxes, including real-time notifications of incoming mail and packages, enhanced security features and remote access and control. They can also help reduce the risk of lost or stolen mail and packages.',
            ),
            SizedBox(height:height*0.02),
            QuestionContainer(
              question:
                'How do I troubleshoot problems with the app or mailbox connectivity?'
            ),
            SizedBox(height:height*0.02),
            AnswerContainer(
              answer:
             'If you encounter any issues with the app or mailbox connectivity, start by checking your Wi-Fi connection and ensuring that the app is up to date. If you still have problems, contact customer support for assistance.'
            ),
             SizedBox(height:height*0.02),
             QuestionContainer(
              question:
               'How do I view my mailbox history?'
            ),
            SizedBox(height:height*0.02),
            AnswerContainer(
              answer:
              'Most smart mailbox apps will have a history section that allows you to view all of your past mail and package deliveries.'
            ),
          ],
        ),
      ),
    );
  }
}
class QuestionContainer extends StatelessWidget {
  final String question;

  const QuestionContainer({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final mediaQuery = MediaQuery.of(context);
    final height=mediaQuery.size.height;
    final width=mediaQuery.size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF1F0F0),
        borderRadius: BorderRadius.circular(7),
      ),
      padding: EdgeInsets.symmetric(vertical:height*0.012,horizontal: width*0.025),


      child: Wrap(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width*0.05,
                child: Text(
                  'Q: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    color: Color(0xff4089FF),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  question,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'poppins',
                    color: Color(0xff081956),
                  ),
                ),
              ),
               
            ],
          ),
        ],
      ),
    );
  }
}
class AnswerContainer extends StatelessWidget {
  final String answer;

  const AnswerContainer({
    Key? key,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
       final mediaQuery = MediaQuery.of(context);
    final height=mediaQuery.size.height;
    final width=mediaQuery.size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF1F0F0),
        borderRadius: BorderRadius.circular(7),
      ),
      padding: EdgeInsets.symmetric(vertical:height*0.012,horizontal: width*0.025),

    child: Wrap(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width*0.05,
                child: Text(
                  'A: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    color: Color(0xff4089FF),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  answer,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'poppins',
                    color: Color(0xff081956),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}