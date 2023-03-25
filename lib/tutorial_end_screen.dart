import 'package:flutter/material.dart';
import 'package:smart_me/select.dart';

class EndTutorial extends StatefulWidget {
  final tutorialName;
  const EndTutorial({super.key, required this.tutorialName});

  @override
  State<EndTutorial> createState() => _EndTutorialState();
}

class _EndTutorialState extends State<EndTutorial> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffF9FBF4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: statusBarHeight,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "튜토리얼",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Container(
              width: deviceWidth - 34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffC8DA8A)),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\" ${widget.tutorialName} \"",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 46),
                  ),
                  Text(
                    "튜토리얼이 끝났습니다.",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: deviceWidth - 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF9FBF4)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "피드백하기",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Select()));
                      },
                      child: Container(
                        width: deviceWidth - 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF9FBF4)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "홈으로 돌아가기",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
