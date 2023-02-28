import 'package:flutter/material.dart';
import 'package:smart_me/constants.dart';

class AndroidCallDialScreen extends StatefulWidget {
  const AndroidCallDialScreen({super.key});

  @override
  State<AndroidCallDialScreen> createState() => _AndroidCallDialScreenState();
}

class _AndroidCallDialScreenState extends State<AndroidCallDialScreen> {
  final numbers = [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['*', '0', '#']];

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
    return numbers.map(
      (x) => Row(
        children: x.map(
          (y) {
            return Expanded(
              child: AndroidNumberKey(
                number: y, 
                onTap: (val) {
                  onKeyPress(val);
                },
                value: y,
              )
            );
          }
        ).toList(),
      )
    ).toList();
  }

  renderPhoneNum() {
    String display = "";

    if(phoneNum.isNotEmpty) {
      display = phoneNum;
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 36
          ),
        )
      ),
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
          style: TextStyle(
            fontSize: 18,
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {

            },
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
        child: Column(
          children: [
            renderPhoneNum(),
            ...renderDial(),
            const AndroidCallIcon()
          ]
        ),
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
  }) : assert (number != null),
       assert (value != null);

  @override
  _AndroidNumberKeyState createState() => _AndroidNumberKeyState();
}

class _AndroidNumberKeyState extends State<AndroidNumberKey> {
  
  @override
  Widget build (BuildContext context) {
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
  const AndroidCallIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 72,
        width: 72,
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle
        ),
        child: IconButton(
          onPressed: () {
      
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