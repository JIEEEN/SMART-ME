import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_me/message/ios/speeachBubble.dart';

class IOSMessageScreen extends StatefulWidget {
  @override
  _IOSMessageScreen createState() => _IOSMessageScreen();
}

class _IOSMessageScreen extends State<IOSMessageScreen> {
  //키보드 show, hide
  final FocusNode _focusNode = FocusNode();
  final _messageInputController = TextEditingController();
  String messageInput = '';

  //******************************************************//
  //입력된 messageInput의 길이가 길어지면 bubbleSize_width는 늘어나고//
  //일정한 길이 이상이 돼 문장이 두줄로 바뀌면 bubbleSize_height*2//
  //startpoint_x는 늘어난 width만큼 뺴줘야함//
  //******************************************************//

  List<Widget> _bubbleList = [];

  void dispose() {
    _focusNode.dispose();
    _messageInputController.dispose();
    super.dispose();
  }

  Widget _buildSpeechBubble(String messageInput) {
    double tempSize_width = 0,
        tempSize_height = 50.0,
        temppoint_x = MediaQuery.of(context).size.width - 25.0,
        temppoint_y = 0.0;
    String tempMessage = '';

    tempMessage = sliceText(messageInput.length, messageInput);

    for (int i = 0; i < messageInput.length; i++) {
      if (i <= 7) {
        tempSize_width += 25;
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
            backgroundColor: Color.fromRGBO(223, 222, 228, 1),
            padding: EdgeInsetsDirectional.all(10.0),
            middle: Text(
              '새로운 메시지',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
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
              Icon(Icons.camera),
              Padding(padding: EdgeInsets.only(left: 20.0)),
              Icon(Icons.shop),
              Padding(padding: EdgeInsets.only(left: 20.0)),
              Expanded(
                child: TextFormField(
                  controller: _messageInputController,
                  autofocus: false,
                  focusNode: _focusNode,
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
                    if (_focusNode.hasFocus) {
                      _focusNode.requestFocus();
                    }
                  },
                  onFieldSubmitted: (String str) => {
                    if (_focusNode.hasFocus) {_focusNode.requestFocus()},
                    setState(
                      () => {
                        messageInput = str,
                        _bubbleList.add(
                          _buildSpeechBubble(messageInput),
                        )
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

// shift option f로 괄호 정렬

