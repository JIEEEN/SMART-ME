import 'package:flutter/material.dart';
import 'package:smart_me/call/android_call_contact_screen.dart';
import 'package:smart_me/call/android_get_call_screen.dart';
import 'package:smart_me/strings.dart';
import 'package:smart_me/common/tutorial_dialog.dart';
import 'package:smart_me/tutorial_end_screen.dart';

class AndroidCallScreen extends StatefulWidget {
  final from;
  const AndroidCallScreen({super.key, required this.from});

  @override
  State<AndroidCallScreen> createState() => _AndroidCallScreenState();
}

class _AndroidCallScreenState extends State<AndroidCallScreen> {
  void show() {
    String tutorialMessage = "";
    if (widget.from == "dial") {
      tutorialMessage = "상대에게 전화를 걸었습니다.\n상대와 통화를 종료하려면 빨간 전화버튼을 눌러주세요.";
    }
    if (widget.from == "call_accept") {
      tutorialMessage = "전화를 받았습니다\n상대와 통화를 종료하려면 빨간 전화버튼을 눌러주세요.";
    }
    if (widget.from == "contact_detail") {
      tutorialMessage = "전화를 걸었습니다.\n상대와 통화를 종료하려면 빨간 전화버튼을 눌러주세요.";
    }
    if (widget.from == "contact_list") {
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

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0x88408000),
        ),
        child: Column(
          children: [
            SizedBox(
              height: statusBarHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: deviceWidth / 2 - 30,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.hd,
                      size: 16.0,
                      color: Colors.white,
                    ),
                    Text(
                      "00:10",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  iconSize: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Calling Name",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  child: Text(
                    phone,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  child: Text(
                    "010-1010-1010",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image.network(
                  "https://picsum.photos/100/100",
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              height: deviceWidth - 58,
              width: deviceWidth - 58,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color(0xAAFFFFFF)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.voicemail_outlined,
                                ),
                                iconSize: 24,
                              ),
                              const Text(
                                record,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.videocam,
                                ),
                                iconSize: 24,
                              ),
                              const Text(
                                videoCall,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bluetooth,
                                ),
                                iconSize: 24,
                              ),
                              const Text(
                                bluetooth,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.volume_up,
                                ),
                                iconSize: 24,
                              ),
                              const Text(
                                speaker,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mic_off,
                                ),
                                iconSize: 24,
                              ),
                              const Text(
                                muteMine,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.apps,
                                ),
                                iconSize: 24,
                              ),
                              const Text(
                                keypad,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ]),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      if (widget.from == "dial") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const AndroidContactScreen(from: "call_dial")));
                      }
                      if (widget.from == "call_accept") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const AndroidGetCallScreen(from: "call")));
                      }
                      if (widget.from == "contact_list") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const AndroidContactScreen(from: "call_list")));
                      }
                      if (widget.from == "contact_detail") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EndTutorial()));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Container(
                        height: 62,
                        width: 62,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.call_end,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            )
          ],
        ),
      ),
    );
  }
}
