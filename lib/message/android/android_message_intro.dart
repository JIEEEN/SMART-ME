import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_me/message/android/android_message.dart';
import 'package:smart_me/common/tutorial_dialog.dart';

class AndroidMessageIntroScreen extends StatefulWidget {
  @override
  _AndroidMessageIntroScreen createState() => _AndroidMessageIntroScreen();
}

class _AndroidMessageIntroScreen extends State<AndroidMessageIntroScreen> {
  void show() {
    String tutorialMessage = "메시지 튜토리얼을 시작합니다.\n오른쪽 아래에 있는 버튼을 눌러보세요!";
    Future.microtask(
      () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => TutorialDialog(
          tutorialMessage: tutorialMessage,
          textPadding: EdgeInsets.fromLTRB(38.0, 220.0, 38.0, 12.0), // edit
          buttonPadding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
        ),
      ),
    );
  }

  void initState() {
    super.initState();

    show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 220.0,
        backgroundColor: Color.fromRGBO(242, 242, 242, 1),
        elevation: 0,
        centerTitle: true,
        // title: Text(
        //   '메시지',
        //   style: TextStyle(
        //     fontSize: 40.0,
        //     fontWeight: FontWeight.w100,
        //   ),
        // ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '메시지',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '메시지 튜토리얼 진행중',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('')),
              Icon(Icons.search, color: Colors.black),
              Padding(
                padding: EdgeInsets.only(
                  right: 10.0,
                ),
              ),
              Icon(Icons.more_vert_outlined, color: Colors.black),
              Padding(
                padding: EdgeInsets.only(
                  right: 20.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                // Row(
                //   children: [
                //     Expanded(child: Text('')),
                //     CircleAvatar(
                //       radius: 25,
                //       backgroundColor: Color.fromRGBO(96, 175, 217, 1),
                //       child: IconButton(
                //         onPressed: () {},
                //         icon: Icon(
                //           Icons.sms,
                //           size: 24.0,
                //         ),
                //         color: Color.fromRGBO(255, 255, 255, 1),
                //       ),
                //     ),
                //     Padding(padding: EdgeInsets.only(right: 20.0)),
                //   ],
                // ),
                Positioned(
                  left: MediaQuery.of(context).size.width - 70.0,
                  top: MediaQuery.of(context).size.height - 450.0,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromRGBO(96, 175, 217, 1),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AndroidMessageScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.sms,
                        size: 24.0,
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 40.0)),
          Row(
            children: [
              Expanded(child: Text('')),
              Text(
                '대화',
                style: TextStyle(
                  color: Color.fromRGBO(96, 175, 217, 1),
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
              Expanded(child: Text('')),
              Text('연락처'),
              Expanded(child: Text('')),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 40.0)),
        ],
      ),
    );
  }
}
