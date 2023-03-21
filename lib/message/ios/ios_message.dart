import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:smart_me/message/ios/ios_speech_bubble.dart';
import 'package:smart_me/message/ios/ios_tutorial_message.dart';
import 'package:smart_me/common/tutorial_dialog.dart';

class IOSMessageScreen extends StatefulWidget {
  @override
  _IOSMessageScreen createState() => _IOSMessageScreen();
}

class _IOSMessageScreen extends State<IOSMessageScreen> {
  //키보드 show, hide
  final FocusNode _focusMessageNode = FocusNode();
  final FocusNode _focusPhoneNumberNode = FocusNode();
  final _messageInputController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  int stringIndex = 0;
  String messageInput = '';
  String phoneNumberInput = '';

  // List<Widget> _bubbleList = [getTutorialBubble('반갑습니다.')];
  List<Widget> _bubbleList = [];

  void dispose() {
    _focusMessageNode.dispose();
    _messageInputController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void show(String str, bool right) {
    String tutorialMessage = str;
    if (str == '') {
      if (right)
        tutorialMessage = "잘하셨습니다! '안녕하세요!'라고 보내시면 상대방이 답장을 할 것입니다.";
      else
        tutorialMessage = "번호를 제대로 입력해주세요!";
    }
    Future.microtask(
      () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => TutorialDialog(tutorialMessage: tutorialMessage),
      ),
    );
  }

  void initState() {
    super.initState();

    String str =
        "이 곳은 메시지를 입력하고 보낼 수 있는 화면입니다.\n받는 사람을 입력하는 칸에 010-0000-0000을 적어보세요!";

    show(str, true);
  }

  Widget _buildMySpeechBubble(String messageInput) {
    double tempSize_width = 0,
        tempSize_height = 50.0,
        temppoint_x = MediaQuery.of(context).size.width - 25.0,
        temppoint_y = 0.0;
    String tempMessage = '';

    tempMessage = sliceText(messageInput.length, messageInput);

    for (int i = 0; i < messageInput.length; i++) {
      if (i < 7) {
        tempSize_width += 27;
      }
      if (i != 0 && i % 7 == 0) {
        tempSize_height += 70;
      }
    }
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CustomPaint(
              size: Size(tempSize_width, tempSize_height),
              painter: SpeechBubble(
                bubbleColor: Color(0xff60ba61),
                messageText: tempMessage,
                startpoint_x: temppoint_x,
                startpoint_y: temppoint_y,
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          height: 200,
          child: CupertinoNavigationBar(
            backgroundColor: Color.fromRGBO(245, 244, 245, 1),
            padding: EdgeInsetsDirectional.all(10.0),
            middle: Text(
              '새로운 메시지',
              style: TextStyle(fontSize: 20),
            ),
            trailing: Align(
              widthFactor: 1.0,
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(right: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: '취소',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTapDown = (details) => {
                            Navigator.pop(context),
                          },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.only(top: 12.0),
          // ),
          Container(
            child: Row(
              children: [
                Text(
                  '     받는 사람: ',
                  style: TextStyle(color: Colors.grey),
                ),
                Flexible(
                  child: TextFormField(
                    controller: _phoneNumberController,
                    focusNode: _focusPhoneNumberNode,
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        CupertinoIcons.add_circled,
                        color: Colors.blue,
                      ),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    // onChanged: (String value) {
                    //   final TextSelection previousCursorPos =
                    //       _phoneNumberController.selection;
                    //   _phoneNumberController.text = value;
                    //   _phoneNumberController.selection = previousCursorPos;
                    // },
                    onChanged: (value) {
                      if (_focusPhoneNumberNode.hasFocus) {
                        _focusPhoneNumberNode.requestFocus();
                      }
                    },
                    onFieldSubmitted: (String str) => {
                      setState(
                        () => {
                          phoneNumberInput = str,
                          if (phoneNumberInput == '01000000000')
                            {
                              show('', phoneNumberInput == '01000000000'),
                            }
                          else
                            {
                              show('', phoneNumberInput == '01000000000'),
                            }
                        },
                      ),
                      // _phoneNumberController.clear()
                    },
                  ),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //     top: 2.0,
          //   ),
          // ),
          Divider(
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
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
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              ),
              Icon(CupertinoIcons.camera_fill, size: 30.0),
              Padding(padding: EdgeInsets.only(left: 20.0)),
              Icon(CupertinoIcons.bars, size: 30.0),
              Padding(padding: EdgeInsets.only(left: 20.0)),
              Expanded(
                child: TextFormField(
                  controller: _messageInputController,
                  autofocus: false,
                  focusNode: _focusMessageNode,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(223, 222, 228, 1),
                      ),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
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
                        _bubbleList.add(
                          _buildMySpeechBubble(messageInput),
                        ),
                        if (messageInput == tutorialString[stringIndex])
                          {
                            _bubbleList.add(
                              getTutorialBubble(tutorialString[stringIndex]),
                            ),
                            if (stringIndex % 2 == 0)
                              show("잘하셨습니다! 마지막으로 '감사합니다.'라고 보내주세요!", true),
                            stringIndex++,
                          }
                      },
                    ),
                    _messageInputController.clear(),
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          ),
        ],
      ),
    );
  }
}