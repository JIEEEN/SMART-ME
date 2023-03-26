import 'package:flutter/material.dart';
import 'package:smart_me/describe.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FBF4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('손주',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 96,
                    fontFamily: 'Malssami815',
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '내 손 전화기의 주인공',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'NotoSansGujarati',
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '버튼을 클릭하여 시작하기',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff53524F),
                  fontFamily: 'NotoSansGujarati',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(43),
                color: Color(0xffA1CA0D),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                child: TextButton(
                  child: Text(
                    '시작',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xffF9FBF4),
                      fontFamily: 'NotoSansGujarati',
                    ),
                  ),
                  onPressed: () => {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Describe();
                    }))
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
