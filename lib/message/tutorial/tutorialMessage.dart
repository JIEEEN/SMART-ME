import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

List<String> tutorialString = [
  "안녕하세요!",
  "감사합니다.",
];

Widget getTutorialBubble(String messageInput) {
  double tempSize_width = 150.0,
      tempSize_height = 50.0,
      temppoint_x = 25.0,
      temppoint_y = 0.0;
  String tempMessage = messageInput;

  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          CustomPaint(
            size: Size(tempSize_width, tempSize_height),
            painter: tutorialSpeechBubble(
              bubbleColor: Color(0xffdfdee3),
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

class tutorialSpeechBubble extends CustomPainter {
  Color bubbleColor;
  String messageText;
  double startpoint_x;
  double startpoint_y;

  tutorialSpeechBubble(
      {required this.bubbleColor,
      required this.messageText,
      required this.startpoint_x,
      required this.startpoint_y});

  @override
  void paint(Canvas canvas, Size size) {
    final bubbleSize = Size(size.width, size.height * 0.8);
    final tailSize = Size(15, 8);
    final fillet = bubbleSize.width * 0.09;
    final tailStartPoint = Point(startpoint_x + 25.0, bubbleSize.height);

    final bubblePath = Path()
      ..moveTo(startpoint_x, startpoint_y + fillet)
      ..lineTo(startpoint_x, startpoint_y + bubbleSize.height - fillet)
      ..quadraticBezierTo(startpoint_x, startpoint_y + bubbleSize.height,
          startpoint_x + fillet, startpoint_y + bubbleSize.height)
      ..lineTo(startpoint_x + bubbleSize.width - fillet,
          startpoint_y + bubbleSize.height)
      ..quadraticBezierTo(
          startpoint_x + bubbleSize.width,
          startpoint_y + bubbleSize.height,
          startpoint_x + bubbleSize.width,
          startpoint_y + bubbleSize.height - fillet)
      ..lineTo(startpoint_x + bubbleSize.width, startpoint_y + fillet)
      ..quadraticBezierTo(startpoint_x + bubbleSize.width, startpoint_y,
          startpoint_x + bubbleSize.width - fillet, startpoint_y)
      ..lineTo(startpoint_x + fillet, startpoint_y)
      ..quadraticBezierTo(
          startpoint_x, startpoint_y, startpoint_x, startpoint_y + fillet);

    final tailPath = Path()
      ..moveTo(tailStartPoint.x, startpoint_y + tailStartPoint.y)
      ..cubicTo(
        tailStartPoint.x + (tailSize.width * 0.2),
        startpoint_y + tailStartPoint.y,
        tailStartPoint.x + (tailSize.width * 0.6),
        startpoint_y + tailStartPoint.y + (tailSize.height * 0.2),
        tailStartPoint.x + tailSize.width / 2,
        startpoint_y + tailStartPoint.y + tailSize.height,
      )
      ..cubicTo(
        (tailStartPoint.x + tailSize.width / 2) + (tailSize.width * 0.2),
        startpoint_y + tailStartPoint.y + tailSize.height,
        tailStartPoint.x + tailSize.width,
        startpoint_y + tailStartPoint.y + (tailSize.height * 0.3),
        tailStartPoint.x + tailSize.width,
        startpoint_y + tailStartPoint.y - 0.3,
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
    TextSpan sp = TextSpan(
        style: TextStyle(fontSize: 30, color: Colors.black), text: text);
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    tp.layout();
    double dx = startpoint_x + size.width / 2 - tp.width / 2;
    double dy = startpoint_y + size.height / 2 - tp.height / 1.5;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
