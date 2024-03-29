import 'package:flutter/material.dart';
import 'package:smart_me/tutorials.dart';

class Select extends StatelessWidget {
  const Select({super.key});

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
            height: statusBarHeight + 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "손주",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                fontFamily: 'Malssami815',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 270,
            width: deviceWidth - 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(37),
              color: Color(0xffA1CA0D),
            ),
            child: TextButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '튜토리얼',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Malssami815',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    '기본적인 스마트폰 기능들을\n다루는 방법을 배워요',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffF9FBF4),
                      fontFamily: 'NotoSansGujarati',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Tutorials();
                }))
              },
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: Container(
              height: 270,
              width: deviceWidth - 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37),
                color: Color(0xffCA950D),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '퀴즈',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Malssami815',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '배운 기능들을 응용해서\n잘 할 수 있나 확인해봐요',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffF9FBF4),
                      fontFamily: 'NotoSansGujarati',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
