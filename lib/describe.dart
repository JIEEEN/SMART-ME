import 'package:flutter/material.dart';
import 'package:smart_me/select.dart';

class Describe extends StatelessWidget {
  const Describe({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffF9FBF4),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: statusBarHeight,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '정보 소외 계층의 디지털 사회 적응을 위해',
                style: TextStyle(
                  color: Color(0xff53524F),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
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
            ),
            Text(
              '튜토리얼을 제공합니다.',
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                '다음 메세지에서 “가봅시다”를 클릭하면 튜토리얼을 제공 받을 수 있습니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 32.0),
              child: Container(
                width: deviceWidth - 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffA36E0A),
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: TextButton(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('가봅시다',
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xffF9FBF4),
                            )),
                      ),
                      onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Select();
                        }))
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
