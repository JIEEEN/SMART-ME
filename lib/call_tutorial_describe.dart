import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_me/call/android_get_call_screen.dart';
import 'package:smart_me/call/ios_get_call_screen.dart';

class CallTutorialDescribe extends StatelessWidget {
  const CallTutorialDescribe({super.key});

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
                      '"전화"',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSansGujarati',
                      ),
                    ),
                    const Text(
                      '튜토리얼에서는\n뭘 배울 수 있나요?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'NotoSansGujarati',
                          color: Color(0xff53524F)),
                    ),
                    SizedBox(
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
                            horizontal: 40, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '전화 걸기',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSansGujarati',
                              ),
                            ),
                            Text(
                              '전화를 걸고 싶은 사람에게\n전화 거는 방법을 배워요.',
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '전화 받기',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSansGujarati',
                              ),
                            ),
                            Text(
                              '전화가 걸려왔을 때,\n전화를 받는 방법을 배워요.',
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
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              if (Platform.isIOS) {
                                return const IOSGetCallLockScreen(
                                    from: "start");
                              } else {
                                return const AndroidGetCallScreen(
                                    from: "start");
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
