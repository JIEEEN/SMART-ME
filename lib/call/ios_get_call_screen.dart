import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';
import 'package:smart_me/call/ios_call_dial_screen.dart';
import 'package:smart_me/call/ios_call_screen.dart';
import 'package:smart_me/colors.dart';
import 'package:smart_me/strings.dart';
import 'package:smart_me/common/tutorial_dialog.dart';

class IOSGetCallUnlockScreen extends StatefulWidget {
  final from;
  const IOSGetCallUnlockScreen({super.key, required this.from});

  @override
  State<IOSGetCallUnlockScreen> createState() => _IOSGetCallUnlockScreenState();
}

class _IOSGetCallUnlockScreenState extends State<IOSGetCallUnlockScreen> {
  void show() {
    String tutorialMessage = "";
    if (widget.from == "call") {
      tutorialMessage =
          "이번에는 휴대전화를 사용하는 중에 전화가 걸려왔습니다.\n\n오른쪽 아래의 초록색 전화 버튼을 눌러주세요.";
    }
    if (widget.from == "call_accept") {
      tutorialMessage = "이번에는 전화를 끊어보겠습니다.\n\n왼쪽 아래의 빨간색 전화 버튼을 눌러주세요.";
    }
    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => TutorialDialog(
              tutorialMessage: tutorialMessage,
              textPadding: EdgeInsets.fromLTRB(38.0, 240.0, 38.0, 12.0),
            )));
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
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            children: [
              SizedBox(
                height: statusBarHeight,
              ),
              const IOSCallerInfo(),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [IOSRemindMe(), IOSDeclineCall()],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [IOSMessage(), IOSAcceptCall()],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 54)
            ],
          ),
        ),
      ),
    );
  }
}

class IOSGetCallLockScreen extends StatefulWidget {
  final from;
  const IOSGetCallLockScreen({super.key, required this.from});

  @override
  State<IOSGetCallLockScreen> createState() => _IOSGetCallLockScreenState();
}

class _IOSGetCallLockScreenState extends State<IOSGetCallLockScreen> {
  void show() {
    String tutorialMessage = "";
    if (widget.from == "start") {
      tutorialMessage = "전화가 걸려왔습니다.\n왼쪽 아래의\n초록색 전화 버튼을\n왼쪽에서 오른쪽으로\n밀어주세요.";
    } else if (widget.from == "call") {
      tutorialMessage = "이번에는\n전화를 끊어보겠습니다.\n전화를 끊으려면\n오른쪽의 전원 버튼을\n두 번 눌러주세요.";
    }

    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => TutorialDialog(
              tutorialMessage: tutorialMessage,
              textPadding: EdgeInsets.fromLTRB(38.0, 240.0, 38.0, 12.0),
            )));
  }

  @override
  void initState() {
    super.initState();

    show();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            children: [
              SizedBox(
                height: statusBarHeight,
              ),
              const IOSCallerInfo(),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [IOSRemindMe(), IOSMessage()],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 52.0, top: 62.0, right: 52.0),
                child: IOSSlideToAnswer(),
              ),
              const SizedBox(
                height: 90,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IOSSlideToAnswer extends StatelessWidget {
  const IOSSlideToAnswer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      trackHeight: 88,
      thumbWidth: 84,
      trackBuilder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 80.0),
              child: Text(
                "밀어서 통화하기",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
      thumbBuilder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Icon(
              Icons.call,
              color: Colors.green,
              size: 48,
            ),
          ),
        );
      },
      action: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const IOSCallScreen(from: "lock_get_call")));
      },
    );
  }
}

class IOSAcceptCall extends StatelessWidget {
  const IOSAcceptCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 62.0),
          child: Container(
            height: 76,
            width: 76,
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
              iconSize: 38,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const IOSCallScreen(from: "call_accept")));
              },
              icon: const Icon(
                Icons.call,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            accept,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class IOSMessage extends StatelessWidget {
  const IOSMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chat_bubble,
            color: Colors.white,
          ),
          iconSize: 32,
        ),
        const Text(
          message,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}

class IOSDeclineCall extends StatelessWidget {
  const IOSDeclineCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 62.0),
          child: Container(
            height: 76,
            width: 76,
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: IconButton(
              iconSize: 38,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const IOSCallDialScreen(
                          from: "call_decline",
                        )));
              },
              icon: const Icon(
                Icons.call_end,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            decline,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class IOSRemindMe extends StatelessWidget {
  const IOSRemindMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.alarm,
            color: Colors.white,
          ),
          iconSize: 32,
        ),
        const Text(
          remindMe,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}

class IOSCallerInfo extends StatelessWidget {
  const IOSCallerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "전화 건 사람",
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          Text(
            "대한민국",
            style: TextStyle(fontSize: 24, color: lightGrey),
          ),
        ],
      ),
    );
  }
}
