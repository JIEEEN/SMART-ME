import 'package:flutter/material.dart';
import 'package:smart_me/call/ios_call_screen.dart';
import 'package:smart_me/colors.dart';
import 'package:smart_me/data/contact_data.dart';
import 'package:smart_me/strings.dart';
import 'package:smart_me/common/tutorial_dialog.dart';

class IOSContactDetailScreen extends StatefulWidget {
  final ContactData contactData;
  final from;

  const IOSContactDetailScreen(
      {super.key, required this.contactData, required this.from});

  @override
  State<IOSContactDetailScreen> createState() => _IOSContactDetailScreenState();
}

class _IOSContactDetailScreenState extends State<IOSContactDetailScreen> {
  void show() {
    String tutorialMessage = "";
    if (widget.from == "contact_list") {
      tutorialMessage = "연락처 상세 페이지입니다.\n휴대전화 버튼을 눌러 전화를 걸어보세요.";
    }

    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => TutorialDialog(
            tutorialMessage: tutorialMessage,
            textPadding: EdgeInsets.fromLTRB(38.0, 120.0, 38.0, 12.0))));
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
        color: lightGrey,
        child: Column(
          children: [
            SizedBox(
              height: statusBarHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blueAccent,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      contacts,
                      style:
                          TextStyle(fontSize: 18.0, color: Colors.blueAccent),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    edit,
                    style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image.network(
                  widget.contactData.image,
                  height: 72,
                  width: 72,
                ),
              ),
            ),
            Text(
              widget.contactData.name,
              style: const TextStyle(fontSize: 28.0),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: deviceWidth / 4 - 8.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.chat_bubble,
                          size: 32.0,
                          color: Colors.blueAccent,
                        ),
                        Text(
                          message,
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const IOSCallScreen(from: "contact_detail")));
                  },
                  child: Container(
                    width: deviceWidth / 4 - 8.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.call,
                            size: 32.0,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            "휴대전화",
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: deviceWidth / 4 - 8.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.videocam,
                          size: 32.0,
                          color: lightGrey,
                        ),
                        Text(
                          "비디오",
                          style: TextStyle(fontSize: 12.0, color: lightGrey),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: deviceWidth / 4 - 8.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.mail,
                          size: 32.0,
                          color: lightGrey,
                        ),
                        Text(
                          "Mail",
                          style: TextStyle(fontSize: 12.0, color: lightGrey),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: deviceWidth - 8.0,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "휴대전화",
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      widget.contactData.phoneNum,
                      style: const TextStyle(
                          fontSize: 16.0, color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              height: 84.0,
              width: deviceWidth - 8.0,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Text(
                  "메모",
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: deviceWidth - 8.0,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "메시지 보내기",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16.0),
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: lightGrey,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "연락처 공유",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16.0),
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: lightGrey,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "즐겨찾기에 추가",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: deviceWidth - 8.0,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Text(
                  "긴급 연락처에 추가",
                  style: TextStyle(fontSize: 16.0, color: Colors.blueAccent),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
