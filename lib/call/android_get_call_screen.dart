import 'package:flutter/material.dart';
import 'package:smart_me/strings.dart';

class AndroidGetCallScreen extends StatelessWidget {
  const AndroidGetCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.purple, Colors.lightBlue],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      )),
      child: Column(
        children: [
          SizedBox(
            height: statusBarHeight,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(incomingCall,
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 68.0, bottom: 8.0),
            child: Text(
              "Caller Name",
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          const Text(
            "Place Text",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 48.0, vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    iconSize: 36,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  height: 72,
                  width: 72,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.call_end,
                    color: Colors.red,
                    size: 36,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              sendMessage,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}