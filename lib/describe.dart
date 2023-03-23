import 'package:flutter/material.dart';
import 'package:smart_me/select.dart';

class Describe extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF9FBF4),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffA1CA0D),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 60,
                  ),
                  child: Text(
                    '튜토리얼을 진행하는 애니메이션 화면\n(시연 영상, 반복)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffF9FBF4),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '정보 소외 계층의 디지털 사회 적응을 위해',
                style: TextStyle(
                  color: Color(0xff53524F),
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    '손주',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '는 지속가능한',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                '튜토리얼을 제공합니다.',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    '🎯',
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '연습 화면과 설명 문구를 통해 \n스마트폰 체계에 잘 적응할 수 있어요',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff53524F),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '🎯',
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '연습 화면과 설명 문구를 통해 \n스마트폰 체계에 잘 적응할 수 있어요',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff53524F),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '🎯',
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '연습 화면과 설명 문구를 통해 \n스마트폰 체계에 잘 적응할 수 있어요',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff53524F),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '다음 메세지에서 “가봅시다”를 클릭하면 튜토리얼을 제공 받을 수 있습니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffA36E0A),
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    child: TextButton(
                      child: Text('가봅시다',
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xffF9FBF4),
                          )),
                      onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Select();
                        }))
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
