import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:ui';

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
    return CustomPaint(
      size: Size(bubbleSize_width, bubbleSize_height),
      painter: SpeechBubble(
          bubbleColor: Color(0xff60ba61), messageText: messageInput),
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
          Container(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: _bubbleList),
          )),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              ),
              SizedBox(
                width: 340.0,
                child: TextFormField(
                  controller: _messageInputController,
                  autofocus: false,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                    icon: Icon(Icons.camera),
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
            ],
          ),
        ],
      ),
    );
  }
}

// shift option f로 괄호 정렬

class SpeechBubble extends CustomPainter {
  Color bubbleColor;
  String messageText;
  double startpoint = 0;

  SpeechBubble({required this.bubbleColor, required this.messageText});

  @override
  void paint(Canvas canvas, Size size) {
    final bubbleSize = Size(size.width, size.height * 0.8);
    final tailSize = Size(size.width * 0.1, size.height - bubbleSize.height);
    final fillet = bubbleSize.width * 0.1;
    final tailStartPoint = Point(size.width * 0.82, bubbleSize.height);

    final bubblePath = Path()
      ..moveTo(startpoint, fillet)
      ..lineTo(startpoint, bubbleSize.height - fillet)
      ..quadraticBezierTo(
          startpoint, bubbleSize.height, fillet, bubbleSize.height)
      ..lineTo(bubbleSize.width - fillet, bubbleSize.height)
      ..quadraticBezierTo(bubbleSize.width, bubbleSize.height, bubbleSize.width,
          bubbleSize.height - fillet)
      ..lineTo(bubbleSize.width, fillet)
      ..quadraticBezierTo(bubbleSize.width, 0, bubbleSize.width - fillet, 0)
      ..lineTo(fillet, 0)
      ..quadraticBezierTo(0, 0, 0, fillet);

    final tailPath = Path()
      ..moveTo(tailStartPoint.x, tailStartPoint.y)
      ..cubicTo(
        tailStartPoint.x + (tailSize.width * 0.2),
        tailStartPoint.y,
        tailStartPoint.x + (tailSize.width * 0.6),
        tailStartPoint.y + (tailSize.height * 0.2),
        tailStartPoint.x + tailSize.width / 2,
        tailStartPoint.y + tailSize.height,
      )
      ..cubicTo(
        (tailStartPoint.x + tailSize.width / 2) + (tailSize.width * 0.2),
        tailStartPoint.y + tailSize.height,
        tailStartPoint.x + tailSize.width,
        tailStartPoint.y + (tailSize.height * 0.3),
        tailStartPoint.x + tailSize.width,
        tailStartPoint.y,
      );

    bubblePath.addPath(tailPath, Offset(0, 0));

    final paintDraw = Paint()
      ..color = bubbleColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(bubblePath, paintDraw);
    writeText(canvas, size, this.messageText);
  }

  //말풍선 안에 text를 적어줌
  void writeText(Canvas canvas, Size size, String text) {
    TextSpan sp = TextSpan(style: TextStyle(fontSize: 30), text: text);
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    tp.layout();
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
