import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_me/call/ios_call_contact_screen.dart';
import 'package:smart_me/call/ios_get_call_screen.dart';
import 'package:smart_me/colors.dart';
import 'package:smart_me/strings.dart';
import 'package:smart_me/common/tutorial_dialog.dart';
import 'package:smart_me/tutorial_end_screen.dart';

class IOSCallScreen extends StatefulWidget {
  final from;
  const IOSCallScreen({super.key, required this.from});

  @override
  State<IOSCallScreen> createState() => _IOSCallScreenState();
}

class _IOSCallScreenState extends State<IOSCallScreen> {
  void show() {
    String tutorialMessage = "";
    if (widget.from == "lock_get_call") {
      tutorialMessage = "전화를 받았습니다.\n상대와 통화를 종료하려면 빨간 전화버튼을 눌러주세요.";
    }
    if (widget.from == "call_accept") {
      tutorialMessage = "전화를 받았습니다.\n상대와 통화를 종료하려면 빨간 전화버튼을 눌러주세요.";
    }
    if (widget.from == "dial") {
      tutorialMessage = "상대에게 전화를 걸었습니다.\n상대와 통화를 종료하려면 빨간 전화버튼을 눌러주세요.";
    }
    if (widget.from == "contact_detail") {
      tutorialMessage = "전화를 걸었습니다.\n상대와 통화를 종료하려면 빨간 전화버튼을 눌러주세요.";
    }

    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            TutorialDialog(tutorialMessage: tutorialMessage)));
  }

  @override
  void initState() {
    super.initState();

    show();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double bottomBarHeight = MediaQuery.of(context).padding.bottom;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

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
              Flexible(flex: 1, fit: FlexFit.tight, child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image.network(
                          "https://picsum.photos/100/100",
                          height: 58,
                          width: 58,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Name",
                            style:
                                TextStyle(fontSize: 36.0, color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "00:20",
                            style: TextStyle(fontSize: 20.0, color: lightGrey),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Flexible(flex: 3, fit: FlexFit.tight, child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: const BoxDecoration(
                              color: Color(0x11B3B3B3), shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 36,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mic_off,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            mute,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: const BoxDecoration(
                              color: Color(0x11B3B3B3), shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 36,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.apps,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            keypad,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: const BoxDecoration(
                              color: Color(0x11B3B3B3), shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 36,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_up,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            speaker,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: const BoxDecoration(
                              color: Color(0x11B3B3B3), shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 36,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            addCall,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: const BoxDecoration(
                              color: Color(0x11B3B3B3), shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 36,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            faceTime,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: const BoxDecoration(
                              color: Color(0x11B3B3B3), shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 36,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            contacts,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Flexible(flex: 3, fit: FlexFit.tight, child: Container()),
              GestureDetector(
                onTap: () {
                  if (widget.from == "lock_get_call") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const IOSGetCallUnlockScreen(from: "call")));
                  }
                  if (widget.from == "call_accept") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const IOSGetCallUnlockScreen(from: "call_accept")));
                  }
                  if (widget.from == "dial") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const IOSContactScreen(from: "call_dial")));
                  }
                  if (widget.from == "contact_detail") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EndTutorial()));
                  }
                },
                child: Container(
                  height: 72,
                  width: 72,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              Flexible(flex: 1, fit: FlexFit.tight, child: Container()),
              SizedBox(
                height: bottomBarHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
