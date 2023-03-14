import 'package:flutter/material.dart';
import 'package:smart_me/call/android_call_screen.dart';
import 'package:smart_me/strings.dart';
import 'package:smart_me/tutorial_dialog.dart';

class AndroidCallDialScreen extends StatefulWidget {
  final from;
  const AndroidCallDialScreen({super.key, required this.from});

  @override
  State<AndroidCallDialScreen> createState() => _AndroidCallDialScreenState();
}

class _AndroidCallDialScreenState extends State<AndroidCallDialScreen> {
  final numbers = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['*', '0', '#']
  ];

  late String phoneNum;

  void show() {
    String tutorialMessage = "";
    if (widget.from == "call") {
      tutorialMessage =
          "이제 전화를 걸어봅시다.\n전화번호를 직접 입력하여 전화를 걸어보겠습니다.\n키패드에 전화번호를 입력 후 초록색 전화 버튼을 눌러주세요.";
    }
    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            TutorialDialog(tutorialMessage: tutorialMessage)));
  }

  @override
  void initState() {
    super.initState();

    phoneNum = '';
    show();
  }

  onKeyPress(val) {
    setState(() {
      phoneNum = phoneNum + val;
    });
  }

  renderDial() {
    return numbers
        .map((x) => Row(
              children: x.map((y) {
                return Expanded(
                    child: AndroidNumberKey(
                  number: y,
                  onTap: (val) {
                    onKeyPress(val);
                  },
                  value: y,
                ));
              }).toList(),
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
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 36),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          phone,
          style: TextStyle(fontSize: 21, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(children: [
          renderPhoneNum(),
          ...renderDial(),
          AndroidCallIcon(
            phoneNum: phoneNum,
          ),
          const AndroidCallDialTab()
        ]),
      ),
    );
  }
}

class AndroidCallDialTab extends StatelessWidget {
  const AndroidCallDialTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            keypad,
            style: TextStyle(fontSize: 18, color: Colors.green),
          ),
          Text(
            recents,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          Text(
            contacts,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          Text(
            places,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class AndroidNumberKey extends StatefulWidget {
  final dynamic number;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const AndroidNumberKey({
    super.key,
    @required this.number,
    required this.onTap,
    @required this.value,
  })  : assert(number != null),
        assert(value != null);

  @override
  _AndroidNumberKeyState createState() => _AndroidNumberKeyState();
}

class _AndroidNumberKeyState extends State<AndroidNumberKey> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: SizedBox(
        height: 100,
        child: AspectRatio(
          aspectRatio: 2,
          child: Center(
            child: Text(
              widget.number,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AndroidCallIcon extends StatelessWidget {
  final phoneNum;
  const AndroidCallIcon({super.key, required this.phoneNum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
      child: Container(
        height: 72,
        width: 72,
        decoration:
            const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {
            (phoneNum == '')
                ? null
                : Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AndroidCallScreen(
                          from: "dial",
                        )));
          },
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
