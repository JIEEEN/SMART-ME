import 'package:flutter/material.dart';
import 'package:smart_me/call/android_call_screen.dart';
import 'package:smart_me/colors.dart';
import 'package:smart_me/data/contact_data.dart';
import 'package:smart_me/strings.dart';

class AndroidContactDetailScreen extends StatelessWidget {
  final ContactData contactData;

  const AndroidContactDetailScreen({super.key, required this.contactData});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: lightGrey,
        child: Column(
          children: [
            SizedBox(
              height: statusBarHeight,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              height: deviceWidth,
              width: deviceWidth,
            ),
            Container(
              height: 160,
              width: deviceWidth,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      contactData.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          phone,
                          style: TextStyle(fontSize: 16, color: tabGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          contactData.phoneNum,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          child: IconButton(
                              iconSize: 24,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const AndroidCallScreen()));
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chat_bubble,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 24,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Container(
                height: 36,
                width: 280,
                decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(60.0)),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    record,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 36,
                width: 280,
                decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(60.0)),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    savedPlace,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.star_border),
                      iconSize: 24,
                    ),
                    const Text(
                      favorite,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      iconSize: 24,
                    ),
                    const Text(
                      edit,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                      iconSize: 24,
                    ),
                    const Text(
                      share,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                      iconSize: 24,
                    ),
                    const Text(
                      more,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
