import 'package:flutter/material.dart';
import 'package:smart_me/describe.dart';

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xffF9FBF4),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 320,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('손주',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 96,
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 240,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '버튼을 클릭하여 시작하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff53524F),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
              )
            ],
          )),
    );
  }
}
