import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:ui';

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
