import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_me/message/ios/iosmessage.dart';

class IOSMessageIntroScreen extends StatefulWidget {
  @override
  _IOSMessageIntroScreen createState() => _IOSMessageIntroScreen();
}

class _IOSMessageIntroScreen extends State<IOSMessageIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: PreferredSize(
        preferredSize: Size(20.0, 50.0),
        child: Container(
          padding: EdgeInsets.only(
            right: 20.0,
          ),
          child: AppBar(
            toolbarHeight: 45.0,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            elevation: 0,
            leading: Text(
              '\n   편집',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  CupertinoIcons.pencil_ellipsis_rectangle,
                  color: Colors.blue,
                  size: 35.0,
                ),
                onPressed: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => IOSMessageScreen(),
                  //   ),
                  // ),
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          IOSMessageScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = Offset(0.0, 1.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            child: Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  17.0,
                  25.0,
                  0.0,
                  0.0,
                ),
                // color: Colors.green,
                child: Text(
                  '메시지',
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
