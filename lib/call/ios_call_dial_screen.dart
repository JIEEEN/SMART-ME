import 'package:flutter/material.dart';
import 'package:smart_me/colors.dart';
import 'package:smart_me/strings.dart';

class IOSCallDialScreen extends StatefulWidget {
  const IOSCallDialScreen({super.key});

  @override
  State<IOSCallDialScreen> createState() => _IOSCallDialScreenState();
}

class _IOSCallDialScreenState extends State<IOSCallDialScreen> {
  final numbers = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['*', '0', '#']
  ];

  late String phoneNum;

  @override
  void initState() {
    super.initState();

    phoneNum = '';
  }

  onKeyPress(val) {
    setState(() {
      phoneNum = phoneNum + val;
    });
  }

  renderDial() {
    return numbers
        .map((x) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: x.map((y) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: IOSNumberKey(
                      number: y,
                      onTap: (val) {
                        onKeyPress(val);
                      },
                      value: y,
                    ),
                  );
                }).toList(),
              ),
            ))
        .toList();
  }

  renderPhoneNum() {
    String display = "";

    if (phoneNum.isNotEmpty) {
      display = phoneNum;
    }

    return Expanded(
      child: Center(
          child: Text(
        display,
        style: const TextStyle(color: Colors.black, fontSize: 38),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double bottomBarHeight = MediaQuery.of(context).padding.bottom;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: statusBarHeight,
          ),
          renderPhoneNum(),
          ...renderDial(),
          const IOSCallIcon(),
          const IOSCallDialTab(),
          SizedBox(
            height: bottomBarHeight,
          )
        ],
      ),
    );
  }
}

class IOSCallDialTab extends StatelessWidget {
  const IOSCallDialTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: SizedBox(
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: const [
              Icon(
                Icons.star,
                color: tabGrey,
                size: 42,
              ),
              Text(
                favorite,
                style: TextStyle(color: tabGrey, fontSize: 14),
              )
            ]),
            Column(children: const [
              Icon(
                Icons.schedule,
                color: tabGrey,
                size: 42,
              ),
              Text(
                recents,
                style: TextStyle(color: tabGrey, fontSize: 14),
              )
            ]),
            Column(children: const [
              Icon(
                Icons.account_circle,
                color: tabGrey,
                size: 42,
              ),
              Text(
                contacts,
                style: TextStyle(color: tabGrey, fontSize: 14),
              )
            ]),
            Column(children: const [
              Icon(
                Icons.apps,
                color: Colors.blueAccent,
                size: 42,
              ),
              Text(
                keypad,
                style: TextStyle(color: Colors.blueAccent, fontSize: 14),
              )
            ]),
            Column(children: const [
              Icon(
                Icons.voicemail,
                color: tabGrey,
                size: 42,
              ),
              Text(
                voiceMail,
                style: TextStyle(color: tabGrey, fontSize: 14),
              )
            ])
          ],
        ),
      ),
    );
  }
}

class IOSNumberKey extends StatefulWidget {
  final dynamic number;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const IOSNumberKey({
    super.key,
    @required this.number,
    required this.onTap,
    @required this.value,
  })  : assert(number != null),
        assert(value != null);

  @override
  _IOSNumberKeyState createState() => _IOSNumberKeyState();
}

class _IOSNumberKeyState extends State<IOSNumberKey> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: Container(
        height: 84,
        width: 84,
        decoration:
            const BoxDecoration(color: lightGrey, shape: BoxShape.circle),
        child: Center(
          child: Text(
            widget.number,
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class IOSCallIcon extends StatelessWidget {
  const IOSCallIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 84,
        width: 84,
        decoration:
            const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call,
            color: Colors.white,
          ),
          iconSize: 36,
        ),
      ),
    );
  }
}