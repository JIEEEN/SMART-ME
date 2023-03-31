import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_me/message/android/android_message_intro.dart';
import 'package:smart_me/message/ios/ios_message_intro.dart';

class MessageTutorialDescribe extends StatelessWidget {
  const MessageTutorialDescribe({super.key});

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
                      '"메시지"',
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
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '텍스트 메시지 전송',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSansGujarati',
                              ),
                            ),
                            Text(
                              '상대방에게 메시지를 보내는 법을 배워요.',
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
                          vertical: 20,
                        ),
                        child: Column(
                          children: const [
                            Text(
                              '사진 메시지 전송',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSansGujarati',
                              ),
                            ),
                            Text(
                              '사진이 담긴 메시지를 보내는 방법을 배워요.',
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              if (Platform.isIOS) {
                                return IOSMessageIntroScreen();
                              } else {
                                return AndroidMessageIntroScreen();
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
              height: 20,
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
