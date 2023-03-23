import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_me/call/android_get_call_screen.dart';
import 'package:smart_me/call/ios_get_call_screen.dart';
import 'package:smart_me/camera/android_camera.dart';
import 'package:smart_me/camera/ios_camera.dart';
import 'package:smart_me/message/android/androidmessage.dart';
import 'package:smart_me/message/ios/iosmessage.dart';

class Tutorials extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Text(
                  '튜토리얼',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    if (Platform.isIOS) {
                      return const IOSGetCallLockScreen(from: "start");
                    } else {
                      return const AndroidGetCallScreen(from: "start");
                    }
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffA1CA0D),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 25,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '전화',
                          style: TextStyle(
                            fontSize: 38,
                          ),
                        ),
                        Text(
                          '전화를 걸고 받는 방법',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    if (Platform.isIOS) {
                      return IosCamera();
                    } else {
                      return AndroidCamera();
                    }
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffA1CA0D),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 25,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '카메라',
                          style: TextStyle(
                            fontSize: 38,
                          ),
                        ),
                        Text(
                          '사진을 찍는 방법',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(9, 0, 0, 20),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    if (Platform.isIOS) {
                      return IOSMessageScreen();
                    } else {
                      return IOSMessage();
                    }
                  }));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffA1CA0D),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 25,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '메세지',
                          style: TextStyle(
                            fontSize: 38,
                          ),
                        ),
                        Text(
                          '메세지를 보내는 방법',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff7A8459),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 46,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '손자가 성장하면 추가 될 예정입니다',
                        style: TextStyle(
                          fontSize: 11,
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
