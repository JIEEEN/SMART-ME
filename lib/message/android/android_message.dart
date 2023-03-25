import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:smart_me/common/tutorial_dialog.dart';
import 'package:smart_me/message/android/android_speech_bubble.dart';
import 'package:smart_me/message/android/android_tutorial_message.dart';
import 'package:smart_me/tutorial_end_screen.dart';

class AndroidMessageScreen extends StatefulWidget {
  const AndroidMessageScreen({super.key});

  @override
  _AndroidMessageScreen createState() => _AndroidMessageScreen();
}

class _AndroidMessageScreen extends State<AndroidMessageScreen> {
  String today = DateFormat('MM월 dd일 E').format(DateTime.now());
  final FocusNode _focusMessageNode = FocusNode();
  final FocusNode _focusPhoneNumberNode = FocusNode();
  final _messageInputController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  int stringIndex = 0;
  String messageInput = '';
  String phoneNumberInput = '';

  final List<Widget> _bubbleList = [];

  @override
  void dispose() {
    _focusMessageNode.dispose();
    _messageInputController.dispose();
    // _phoneNumberController.dispose();
    super.dispose();
  }

  void show(String str) {
    String tutorialMessage = str;
    // String tutorialMessage = "";
    Future.microtask(
      () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => TutorialDialog(
          tutorialMessage: tutorialMessage,
          textPadding: EdgeInsets.fromLTRB(38.0, 220.0, 38.0, 12.0), // edit
          buttonPadding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    String initNotice = "잘하셨습니다! '안녕하세요!'라고 보내시면\n상대방이 답장을 할 것입니다.";

    show(initNotice);
  }

  void renderBubble(String messageInput) {
    _bubbleList.add(
      _buildMySpeechBubble(messageInput),
    );
    if (messageInput == tutorialString[stringIndex]) {
      _bubbleList.add(
        getTutorialBubble(tutorialString[stringIndex]),
      );
      if (messageInput == "안녕하세요!") {
        show("잘하셨습니다! 마지막으로 '감사합니다.'라고 보내주세요!");
      } else if (messageInput == "감사합니다.") {
        show("수고하셨습니다. 메시지 튜토리얼을 마치겠습니다.");
        Future.delayed(Duration(milliseconds: 2000)).then(
          (onValue) => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EndTutorial(
                      tutorialName: "메세지",
                    ))),
          },
        );
      }
      stringIndex++;
    } else {
      if (stringIndex % 2 == 0) {
        show("'안녕하세요!'라고 입력해보세요!");
      } else {
        show("'감사합니다.'라고 입력해보세요!");
      }
    }
  }

  Widget _buildMySpeechBubble(String messageInput) {
    double tempsizeWidth = 0,
        tempsizeHeight = 50.0,
        temppointX = MediaQuery.of(context).size.width - 25.0,
        temppointY = 0.0;
    String tempMessage = '';

    tempMessage = sliceText(messageInput.length, messageInput);

    for (int i = 0; i < messageInput.length; i++) {
      if (i < 7) {
        tempsizeWidth += 28;
      }
      if (i != 0 && i % 7 == 0) {
        tempsizeHeight += 70;
      }
    }
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CustomPaint(
              size: Size(tempsizeWidth, tempsizeHeight),
              painter: SpeechBubble(
                bubbleColor: Color.fromRGBO(72, 158, 136, 1),
                messageText: tempMessage,
                startpoint_x: temppointX,
                startpoint_y: temppointY,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // leading: Row(
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.arrow_back),
        //       onPressed: () => {
        //         Navigator.pop(context),
        //       },
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(right: 30.0),
        //     ),tutorial
        //     Icon(
        //       Icons.account_circle_rounded,
        //       color: Colors.grey,
        //     ),
        //   ],
        // ),
        title: Text(
          '010-0000-0000',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Container(
                width: MediaQuery.of(context).size.width / 2.6,
              ),
              Text(today),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _bubbleList,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 13.0)),
              Icon(Icons.photo_size_select_actual_outlined,
                  color: Colors.black),
              Padding(
                padding: EdgeInsets.only(right: 13.0),
              ),
              Icon(Icons.photo_camera_outlined, color: Colors.black),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
              ),
              Icon(Icons.add, color: Colors.black),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
              ),
              Expanded(
                child: TextFormField(
                  controller: _messageInputController,
                  autofocus: false,
                  focusNode: _focusMessageNode,
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "문자 메시지",
                    filled: true,
                    fillColor: Color.fromARGB(255, 235, 235, 235),
                  ),
                  style: TextStyle(fontSize: 22),
                  keyboardAppearance: Brightness.light,
                  onChanged: (value) {
                    messageInput = value;
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
                        renderBubble(messageInput),
                      },
                    ),
                    _messageInputController.clear(),
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.0),
              ),
              SizedBox(
                width: 35.0,
                height: 40.0,
                child: Transform.rotate(
                  angle: 315 * math.pi / 180,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromRGBO(72, 158, 136, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(
                          () => {
                            renderBubble(messageInput),
                          },
                        );
                        _messageInputController.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        size: 24.0,
                      ),
                      color: Color.fromARGB(142, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10.0)),
        ],
      ),
    );
  }
}
