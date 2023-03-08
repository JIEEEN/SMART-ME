import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';
import 'package:smart_me/strings.dart';

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
                      children: const [IOSRemindMe(), IOSDeclineCall()],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [IOSMessage(), IOSAcceptCall()],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 54)
          ],
        ),
      ),
    );
  }
}

class IOSGetCallLockScreen extends StatelessWidget {
  const IOSGetCallLockScreen({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [IOSRemindMe(), IOSMessage()],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 52.0, top: 62.0, right: 52.0),
              child: IOSSlideToAnswer(),
            ),
            const SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}

class IOSSlideToAnswer extends StatelessWidget {
  const IOSSlideToAnswer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      trackHeight: 88,
      thumbWidth: 84,
      trackBuilder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 80.0),
              child: Text(
                "slide to answer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
      thumbBuilder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Icon(
              Icons.call,
              color: Colors.green,
              size: 48,
            ),
          ),
        );
      },
      action: () {},
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
                color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
              iconSize: 48,
              onPressed: () {},
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
            style: TextStyle(fontSize: 24, color: Colors.white),
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
          onPressed: () {},
          icon: const Icon(
            Icons.chat_bubble,
            color: Colors.white,
          ),
          iconSize: 32,
        ),
        const Text(
          message,
          style: TextStyle(fontSize: 18, color: Colors.white),
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
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: IconButton(
              iconSize: 48,
              onPressed: () {},
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
            style: TextStyle(fontSize: 24, color: Colors.white),
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
          onPressed: () {},
          icon: const Icon(
            Icons.alarm,
            color: Colors.white,
          ),
          iconSize: 32,
        ),
        const Text(
          remindMe,
          style: TextStyle(fontSize: 18, color: Colors.white),
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
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          Text(
            "Place Text",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
