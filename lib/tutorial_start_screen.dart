import 'package:flutter/material.dart';
import 'package:smart_me/call/android_get_call_screen.dart';

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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const AndroidGetCallScreen(from: "start")));
              },
              child: const Text("확인"))
        ],
      ),
    );
  }
}
