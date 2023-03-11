import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:ui';
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
  double bubbleSize_width = 100.0, bubbleSize_height = 40.0;
  List<Widget> _bubbleList = [];

  void dispose() {
    _focusNode.dispose();
    _messageInputController.dispose();
    super.dispose();
  }

  Widget _buildSpeechBubble(String messageInput) {
    return Column(
      children: <Widget>[
        CustomPaint(
          size: Size(bubbleSize_width, bubbleSize_height),
          painter: SpeechBubble(
              bubbleColor: Color(0xff60ba61), messageText: messageInput),
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
            // child: SingleChildScrollView(
            child: Column(children: _bubbleList),
            // ),
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

