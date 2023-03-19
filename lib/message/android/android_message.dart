import 'dart:async';
import 'dart:ui';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:smart_me/common/tutorial_dialog.dart';

class AndroidMessageScreen extends StatefulWidget {
  @override
  _AndroidMessageScreen createState() => _AndroidMessageScreen();
}

class _AndroidMessageScreen extends State<AndroidMessageScreen> {
  // var now = new DateTime.now();
  String today = DateFormat('yyyy/MM/dd(E)').format(DateTime.now());
  final FocusNode _focusMessageNode = FocusNode();
  final FocusNode _focusPhoneNumberNode = FocusNode();
  final _messageInputController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  int stringIndex = 0;
  String messageInput = '';
  String phoneNumberInput = '';

  List<Widget> _bubbleList = [];

  void show() {
    // String tutorialMessage = "메시지 튜토리얼을 시작합니다.\n오른쪽 위에 있는 버튼을 눌러보세요!";
    String tutorialMessage = "";
    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            TutorialDialog(tutorialMessage: tutorialMessage)));
  }

  void initState() {
    super.initState();

    // show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(50.0, 70.0),
        child: AppBar(
          toolbarHeight: 100.0,
          backgroundColor: Color.fromRGBO(221, 160, 56, 1),
          title: Text(
            '010-0000-0000',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: [
            Icon(
              Icons.phone_forwarded,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
            ),
            Icon(Icons.delete, color: Colors.white),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
            ),
            Icon(Icons.more_vert, color: Colors.white),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Container(
                width: MediaQuery.of(context).size.width / 2.8,
                child: Divider(thickness: 1.2),
              ),
              Padding(padding: EdgeInsets.only(right: 10.0)),
              Text(today),
              Padding(padding: EdgeInsets.only(right: 10.0)),
              Expanded(
                child: Divider(thickness: 1.2),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _bubbleList,
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          // Padding(padding: EdgeInsets.only(bottom: 5.0)),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10.0)),
              Container(
                child: Transform.rotate(
                  angle: 45 * math.pi / 180,
                  child: Icon(
                    Icons.attach_file,
                    size: 30.0,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: _messageInputController,
                  autofocus: false,
                  focusNode: _focusMessageNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                    hintText: "메시지를 입력하세요",
                  ),
                  style: TextStyle(fontSize: 22),
                  keyboardAppearance: Brightness.light,
                  onChanged: (value) {
                    if (_focusMessageNode.hasFocus) {
                      _focusMessageNode.requestFocus();
                    }
                  },
                  onFieldSubmitted: (String str) => {
                    if (_focusMessageNode.hasFocus)
                      {_focusMessageNode.requestFocus()},
                    setState(
                      () => {
                        messageInput = str,
                        // _bubbleList.add(
                        //   getTutorialBubble(tutorialString[stringIndex]),
                        // ),
                      },
                    ),
                    _messageInputController.clear(),
                  },
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromRGBO(221, 160, 56, 1),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.outgoing_mail,
                    size: 28.0,
                  ),
                  color: Color.fromARGB(142, 255, 255, 255),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10.0))
        ],
      ),
    );
  }
}
