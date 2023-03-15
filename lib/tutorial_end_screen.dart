import 'package:flutter/material.dart';
import 'package:smart_me/tutorial_start_screen.dart';

class EndTutorial extends StatelessWidget {
  const EndTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("전화 받기 튜토리얼 종료"),
          GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const AndroidCallDialScreen()));
              },
              child: const Text("확인")),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StartTutorial()));
              },
              child: const Text("다시하기"))
        ],
      ),
    );
  }
}
