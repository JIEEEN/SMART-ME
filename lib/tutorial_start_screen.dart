import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_me/call/android_get_call_screen.dart';
import 'package:smart_me/call/ios_get_call_screen.dart';
import 'package:smart_me/camera/android_camera.dart';
import 'package:smart_me/camera/ios_camera.dart';


class StartTutorial extends StatelessWidget {
  const StartTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("전화 튜토리얼 시작"),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  if (Platform.isIOS) {
                    return const IOSGetCallLockScreen(from: "start");
                  } else {
                    return const AndroidGetCallScreen(from: "start");
                  }
                }));
              },
              child: const Text("확인")),
          const Text("카메라 튜토리얼 시작"),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  if (Platform.isIOS) {
                    return IosCamera();
                  } else {
                    return AndroidCamera();
                  }
                }));
              },
              child: const Text("확인"))
        ],
      ),
    );
  }
}
