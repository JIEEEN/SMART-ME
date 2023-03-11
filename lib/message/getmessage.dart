import 'package:flutter/material.dart';
import 'package:smart_me/message/ios/iosmessage.dart' as ios;
import 'package:smart_me/message/android/androidmessage.dart' as and;

class getMessage extends StatefulWidget {
  @override
  _getIOSMessageScreen createState() => _getIOSMessageScreen();
}

class _getIOSMessageScreen extends State<getMessage> {
  @override
  Widget build(BuildContext context) {
    return ios.IOSMessageScreen();
  }
}

// class _getAndroidMessage extends StatefulWidget