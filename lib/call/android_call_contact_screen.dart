import 'package:flutter/material.dart';
import 'package:smart_me/call/android_call_contact_detail_screen.dart';
import 'package:smart_me/call/android_call_screen.dart';
import 'package:smart_me/colors.dart';
import 'package:smart_me/data/contact_data.dart';
import 'package:smart_me/strings.dart';
import 'package:smart_me/common/tutorial_dialog.dart';

class AndroidContactScreen extends StatefulWidget {
  final from;
  const AndroidContactScreen({super.key, required this.from});

  @override
  State<AndroidContactScreen> createState() => _AndroidContactScreenState();
}

class _AndroidContactScreenState extends State<AndroidContactScreen> {
  void show() {
    String tutorialMessage = "";
    if (widget.from == "call_dial") {
      tutorialMessage =
          "이번엔 연락처에서 전화를 걸어보겠습니다.\n\n원하는 연락처를 왼쪽에서 오른쪽으로 밀어서 전화를 걸어보세요.";
    }
    if (widget.from == "call_list") {
      tutorialMessage = "이번에는 연락처 상세 페이지에서 전화를 걸어보겠습니다.\n\n원하는 연락처를 눌러주세요.";
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
    // TODO: implement initState
    super.initState();

    show();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        color: const Color(0xFFE6E6E6),
        child: Column(
          children: [
            SizedBox(
              height: statusBarHeight,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: Image.network(
                        "https://picsum.photos/100/100",
                        height: 70,
                        width: 70,
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "My Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      iconSize: 24,
                    ),
                    const Visibility(
                      visible: false,
                      child: Text(
                        contacts,
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      iconSize: 24,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      iconSize: 24,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                      iconSize: 24,
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0)),
                  child: contactList),
            )
          ],
        ),
      ),
    );
  }

  Widget contactList = ListView.builder(
    itemCount: data.length,
    itemBuilder: ((context, index) =>
        AndroidContactListElement(contactData: data[index], idx: index)),
  );
}

class AndroidContactListElement extends StatelessWidget {
  final ContactData contactData;
  final int idx;

  const AndroidContactListElement(
      {super.key, required this.contactData, required this.idx});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        color: Colors.green,
        alignment: Alignment.centerLeft,
        child: Row(
          children: const [
            Icon(
              Icons.call,
              size: 16.0,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                call,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        color: Colors.blue,
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Expanded(child: Container()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            const Icon(
              Icons.chat_bubble,
              size: 16.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          if (direction == DismissDirection.startToEnd) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AndroidCallScreen(
                      from: "contact_list",
                    )));
          }
          return false;
        } else if (direction == DismissDirection.endToStart) {
          return false;
        }
        return null;
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AndroidContactDetailScreen(
                  contactData: contactData, from: "contact_list")));
        },
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 12),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image.network(
                          contactData.image,
                          height: 32,
                          width: 32,
                        )),
                  ),
                  Text(contactData.name),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 56.0, right: 24.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: lightGrey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
