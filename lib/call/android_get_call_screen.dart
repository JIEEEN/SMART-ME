import 'package:flutter/material.dart';
import 'package:smart_me/call/android_call_screen.dart';
import 'package:smart_me/strings.dart';
import 'package:smart_me/tutorial_dialog.dart';

class AndroidGetCallScreen extends StatefulWidget {
  const AndroidGetCallScreen({super.key});

  @override
  State<AndroidGetCallScreen> createState() => _AndroidGetCallScreenState();
}

class _AndroidGetCallScreenState extends State<AndroidGetCallScreen> {
  void show() {
    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const TutorialDialog(
            turorialMessage: "전화가 걸려왔습니다.\n왼쪽 아래의 초록색 전화 버튼을 오른쪽 위로 밀어주세요.")));
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
                          builder: (context) => const AndroidCallScreen()));
                    },
                    child: Container(
                      height: 72,
                      width: 72,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: IconButton(
                        iconSize: 36,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AndroidCallScreen(),
                          ));
                        },
                        icon: const Icon(
                          Icons.call,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 72,
                    width: 72,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.call_end,
                      color: Colors.red,
                      size: 36,
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
