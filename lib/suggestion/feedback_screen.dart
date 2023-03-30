import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreen createState() => _FeedbackScreen();
}

class _FeedbackScreen extends State<FeedbackScreen> {
  final db = FirebaseFirestore.instance;
  final _feedbackController = TextEditingController();
  final _feedbackNode = FocusNode();
  String feedbackInput = '';
  List<String> feedbackStringList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 249 251 245
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(249, 251, 245, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 251, 245, 1),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Text(
            "손주에게",
            style: TextStyle(fontSize: 48.0, fontFamily: 'Malssami815'),
          ),
          Stack(
            children: [
              //203 217 147
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.7,
                padding: EdgeInsets.all(40.0),
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Color.fromRGBO(203, 217, 147, 1),
                ),
                child: Column(
                  children: [
                    Text(
                      '"전해드릴게요"',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "     고쳐야할 점 혹은 \n칭찬할 점을 적어주세요!",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 50.0,
                      ),
                    ),
                    TextFormField(
                      controller: _feedbackController,
                      focusNode: _feedbackNode,
                      autofocus: false,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                      decoration: InputDecoration(),
                      onChanged: (value) {
                        if (_feedbackNode.hasFocus) {
                          _feedbackNode.requestFocus();
                        }
                      },
                      onFieldSubmitted: (String str) => {
                        setState(
                          () => {
                            feedbackInput = str,
                            db.collection("stext").add(
                              {
                                "datetime": DateFormat('yyyy년 MM월 dd일')
                                    .format(DateTime.now())
                                    .toString(),
                                "suggestion": feedbackInput,
                              },
                            ),
                          },
                        ),
                        _feedbackController.clear(),
                      },
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('')),
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            size: 50.0,
                            color: Colors.brown,
                          ),
                          onPressed: () => {
                            db.collection("stext").add(
                              {
                                "datetime": DateFormat('yyyy년 MM월 dd일')
                                    .format(DateTime.now())
                                    .toString(),
                                "suggestion": _feedbackController.text,
                              },
                            ),
                            FocusScope.of(context).unfocus(),
                            _feedbackController.clear(),
                          },
                        ),
                        Expanded(child: Text('')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 20.0,
          )),
          Text(
            '기기를 사용하는데 어려움이 있으시다면\n       꼭 👶손주에게 말씀해주세요!',
            style: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(155, 112, 39, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
