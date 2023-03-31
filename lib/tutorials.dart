import 'package:flutter/material.dart';

import 'package:smart_me/call_tutorial_describe.dart';
import 'package:smart_me/camera_tutorial_describe.dart';
import 'package:smart_me/message_tutorial_describe.dart';

class Tutorials extends StatelessWidget {
  const Tutorials({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xffF9FBF4),
        elevation: 0.0,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                '튜토리얼',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Malssami815',
                ),
              ),
            ),
            Expanded(child: Container()),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CallTutorialDescribe()));
              },
              child: Container(
                width: deviceWidth - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffA1CA0D),
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '전화',
                        style: TextStyle(
                          fontSize: 38,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSansGujarati',
                        ),
                      ),
                      Text(
                        '전화를 걸고 받는 방법',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontFamily: 'NotoSansGujarati',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CameraTutorialDescribe()));
              },
              child: Container(
                width: deviceWidth - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffA1CA0D),
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '카메라',
                        style: TextStyle(
                          fontSize: 38,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSansGujarati',
                        ),
                      ),
                      Text(
                        '사진을 찍는 방법',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontFamily: 'NotoSansGujarati',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MessageTutorialDescribe()));
              },
              child: Container(
                width: deviceWidth - 50,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffA1CA0D),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '메시지',
                        style: TextStyle(
                          fontSize: 38,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSansGujarati',
                        ),
                      ),
                      Text(
                        '메시지를 보내는 방법',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontFamily: 'NotoSansGujarati',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: deviceWidth - 50,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff7A8459),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 46,
                ),
                child: Column(
                  children: [
                    Text(
                      '손자가 성장하면 추가 될 예정입니다',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'NotoSansGujarati',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
