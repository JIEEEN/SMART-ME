import 'package:flutter/material.dart';
import 'package:smart_me/strings.dart';

class AndroidCallScreen extends StatelessWidget {
  const AndroidCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0x88408000),
      ),
      child: Column(
        children: [
          SizedBox(
            height: statusBarHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: deviceWidth / 2 - 30,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.hd,
                    size: 16.0,
                    color: Colors.white,
                  ),
                  Text(
                    "00:10",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                iconSize: 20.0,
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Calling Name",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(
                  phone,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(
                  "010-1010-1010",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.network(
                "https://picsum.photos/100/100",
                height: 100,
                width: 100,
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            height: deviceWidth - 58,
            width: deviceWidth - 58,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: Color(0xAAFFFFFF)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.voicemail_outlined,
                              ),
                              iconSize: 24,
                            ),
                            const Text(
                              record,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.videocam,
                              ),
                              iconSize: 24,
                            ),
                            const Text(
                              videoCall,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bluetooth,
                              ),
                              iconSize: 24,
                            ),
                            const Text(
                              bluetooth,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.volume_up,
                              ),
                              iconSize: 24,
                            ),
                            const Text(
                              speaker,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic_off,
                              ),
                              iconSize: 24,
                            ),
                            const Text(
                              mute,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.apps,
                              ),
                              iconSize: 24,
                            ),
                            const Text(
                              keypad,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ]),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Container(
                    height: 62,
                    width: 62,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.call_end,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          )
        ],
      ),
    );
  }
}
