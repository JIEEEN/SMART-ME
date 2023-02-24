import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_me/constants.dart';

class IOSGetCallUnlockScreen extends StatelessWidget {
  const IOSGetCallUnlockScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: Column(
          children: [
            SizedBox(
              height: statusBarHeight,
            ),
            const IOSCallerInfo(),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        IOSRemindMe(),
                        IOSDeclineCall()
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        IOSMessage(),
                        IOSAcceptCall()
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 54
            )
          ],
        ),
      ),
    );
  }
  
}

class IOSAcceptCall extends StatelessWidget {
  const IOSAcceptCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 62.0),
          child: Container(
            height: 84,
            width: 84,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
            child: IconButton(
              iconSize: 48,
              onPressed: () {
          
              },
              icon: const Icon(
                Icons.call,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            accept,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}

class IOSMessage extends StatelessWidget {
  const IOSMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
                    
          },
          icon: const Icon(
            Icons.chat_bubble,
            color: Colors.white,
          ),
          iconSize: 32,
        ),
        const Text(
          message,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
        ),
      ],
    );
  }
}

class IOSDeclineCall extends StatelessWidget {
  const IOSDeclineCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 62.0),
          child: Container(
            height: 84,
            width: 84,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
            ),
            child: IconButton(
              iconSize: 48,
              onPressed: () {
                        
              }, 
              icon: const Icon(
                Icons.call_end,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            decline,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}

class IOSRemindMe extends StatelessWidget {
  const IOSRemindMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
                    
          },
          icon: const Icon(
            Icons.alarm,
            color: Colors.white,
          ),
          iconSize: 32,
        ),
        const Text(
          remindMe,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
        ),
      ],
    );
  }
}

class IOSCallerInfo extends StatelessWidget {
  const IOSCallerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Caller Name",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white
              ),
            ),
          ),
          Text(
            "Place Text",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}