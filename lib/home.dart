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
          Stack(
            children: [
              Image.asset(
                'assets/images/decoration.png',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Image.asset(
                    'assets/images/call.png',
                    width: 170,
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('손주',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 100,
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
                            fontSize: 20,
                            fontFamily: 'NotoSansGujarati',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
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
