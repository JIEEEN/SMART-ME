import 'package:flutter/material.dart';
import 'package:smart_me/tutorials.dart';

class Select extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF9FBF4),
        appBar: AppBar(
          title: Text(
            '손주',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37),
                  color: Color(0xffA1CA0D),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 110,
                    horizontal: 80,
                  ),
                  child: 
                  TextButton(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '튜토리얼',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '기본적인 스마트폰 기능들을\n다루는 방법을 배워요',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffF9FBF4),
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
                  )
                  
                  ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37),
                  color: Color(0xffCA950D),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 110,
                    horizontal: 80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '퀴즈',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '배운 기능들을 응용해서\n잘 할 수 있나 확인해봐요',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffF9FBF4),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
