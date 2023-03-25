import 'dart:async';
import 'package:flutter/material.dart';

class HMSTimer extends StatefulWidget {
  const HMSTimer(
      {Key? key, this.boxColor, this.height, this.width, this.textStyle})
      : super(key: key);
  final Color? boxColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  @override
  State<StatefulWidget> createState() => HMSTimerState();
}

class HMSTimerState extends State<HMSTimer> {
  late Timer? _timer = null;
  double _timerCount = 0;

  @override
  void initState() {
    _timerCount = 0;
    super.initState();
  }

  void start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _timerCount++;
      });
    });
  }

  void pause() {
    _timer!.cancel();
  }

  void stop() {
    _timer!.cancel();
    setState(() {
      _timerCount = 0;
    });
  }

  String printTimeAsHMS() {
    String ret;
    int cur = _timerCount.toInt();
    cur = cur ~/ 100;
    int hour = cur ~/ 3600;
    int minute = cur ~/ 60;
    double second = cur % 60;

    ret =
        '${hour >= 10 ? '' : '0'}$hour : ${minute >= 10 ? '' : '0'}$minute : ${second >= 10 ? '' : '0'}${second.toInt()}';
    return ret;
  }

  String printTimeAsHMSKorean() {
    String ret;
    int cur = _timerCount.toInt();
    cur ~/= 100;
    int hour = cur ~/ 3600;
    int minute = cur ~/ 60;
    double second = cur % 60;

    ret =
        '${hour == 0 ? '' : hour}${hour == 0 ? '' : '시간'} ${minute == 0 ? '' : minute}${minute == 0 ? '' : '분'} ${second.toInt()}초';
    return ret;
  }

  @override
  void dispose() {
    if (_timer != null) _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 100,
      height: widget.height ?? 30,
      color: widget.boxColor ?? Colors.red,
      alignment: Alignment.center,
      child: Text(printTimeAsHMS(),
          style: widget.textStyle ??
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
    );
  }
}
