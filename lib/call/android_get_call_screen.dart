import 'package:flutter/material.dart';
import 'package:smart_me/call/android_call_dial_screen.dart';
import 'package:smart_me/call/android_call_screen.dart';
import 'package:smart_me/strings.dart';
import 'package:smart_me/tutorial_dialog.dart';

class AndroidGetCallScreen extends StatefulWidget {
  final from;
  const AndroidGetCallScreen({super.key, required this.from});

  @override
  State<AndroidGetCallScreen> createState() => _AndroidGetCallScreenState();
}

class _AndroidGetCallScreenState extends State<AndroidGetCallScreen> {
  void show() {
    String tutorialMessage = "";
    if (widget.from == "start") {
      tutorialMessage = "전화가 걸려왔습니다.\n왼쪽 아래의 초록색 전화 버튼을 오른쪽 위로 밀어주세요.";
    } else if (widget.from == "call") {
      tutorialMessage =
          "이번에는 전화를 끊어보겠습니다.\n전화를 끊으려면 아래의 빨간색 전화 버튼을 왼쪽 위로 밀어주세요.";
    }

    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            TutorialDialog(tutorialMessage: tutorialMessage)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    show();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.purple, Colors.lightBlue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
        child: Column(
          children: [
            SizedBox(
              height: statusBarHeight,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(incomingCall,
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 68.0, bottom: 8.0),
              child: Text(
                "Caller Name",
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            const Text(
              "Place Text",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 48.0, vertical: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onPanEnd: (details) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const AndroidCallScreen(from: "call_accept")));
                    },
                    child: Container(
                      height: 72,
                      width: 72,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.call,
                        color: Colors.green,
                        size: 36,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onPanEnd: (details) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const TutorialDialog(
                              tutorialMessage: "전화를 끊었습니다."));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AndroidCallDialScreen(
                                from: "call",
                              )));
                    },
                    child: Container(
                      height: 72,
                      width: 72,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.call_end,
                        color: Colors.red,
                        size: 36,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                sendMessage,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
