import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_me/camera/android_camera.dart';
import 'package:smart_me/camera/ios_camera.dart';

class CameraTutorialDescribe extends StatelessWidget {
  const CameraTutorialDescribe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: null,
          ),
          backgroundColor: const Color(0xffF9FBF4),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    '튜토리얼',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 390,
              height: 586,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffC8DA8A),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '"카메라"',
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      '튜토리얼에서는\n뭘 배울 수 있나요?',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 140,
                      width: 338,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color(0xffF9FBF4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '1. 사진 촬영',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '카메라앱에 있던 수많은 버튼들,\n어떤 버튼인지 제대로 알아보아요.',
                              style: TextStyle(
                                color: Color(0xff91908E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 140,
                      width: 338,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color(0xffF9FBF4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ),
                        child: Column(
                          children: const [
                            Text(
                              '2. 동영상 촬영',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '사진으로 담기에는 부족한 소중한 순간들,\n이젠 동영상으로 한번에 담아봐요.',
                              style: TextStyle(
                                color: Color(0xff91908E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffA36E0A),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Text('배우러 가기',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffF9FBF4),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Text(
                                '취소',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xffA36E0A)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '🚨 튜토리얼 진행 시 보이는 화면들은\n실제 작동 화면이 아닙니다 🚨',
              style: TextStyle(
                  fontSize: 17,
                  color: Color(0xffAC2828),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
