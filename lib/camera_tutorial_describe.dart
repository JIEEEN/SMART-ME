import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_me/camera/android_camera.dart';
import 'package:smart_me/camera/ios_camera.dart';

class CameraTutorialDescribe extends StatelessWidget {
  const CameraTutorialDescribe({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  '튜토리얼',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Malssami815',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: deviceWidth - 20,
              height: deviceHeight - 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffC8DA8A),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
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
                    const Text(
                      '튜토리얼에서는\n뭘 배울 수 있나요?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'NotoSansGujarati',
                          color: Color(0xff53524F)),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      width: 338,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color(0xffF9FBF4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '사진 촬영',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSansGujarati',
                              ),
                            ),
                            Text(
                              '카메라앱에 있던 수많은 버튼들, 어떤 버튼인지 제대로 알아보아요.',
                              style: TextStyle(
                                color: Color(0xff91908E),
                                fontSize: 16,
                                fontFamily: 'NotoSansGujarati',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 338,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color(0xffF9FBF4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: Column(
                          children: const [
                            Text(
                              '동영상 촬영',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSansGujarati',
                              ),
                            ),
                            Text(
                              '사진으로 담기에는 부족한 소중한 순간들, 이젠 동영상으로 한번에 담아봐요.',
                              style: TextStyle(
                                color: Color(0xff91908E),
                                fontSize: 16,
                                fontFamily: 'NotoSansGujarati',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
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
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffA36E0A),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Text('배우러 가기',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontFamily: 'NotoSansGujarati',
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffF9FBF4),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Text(
                                '취소',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xffA36E0A),
                                  fontFamily: 'NotoSansGujarati',
                                ),
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
              height: 10,
            ),
            const Text(
              '🚨 튜토리얼 진행 시 보이는 화면들은\n실제 작동 화면이 아닙니다 🚨',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xffAC2828),
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSansGujarati',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
