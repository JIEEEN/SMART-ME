import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SuggestionScreen extends StatefulWidget {
  @override
  _SuggestionScreen createState() => _SuggestionScreen();
}

final db = FirebaseFirestore.instance;
final _suggestionController = TextEditingController();
final _suggestionNode = FocusNode();
String suggestionInput = '';
List<String> suggestionStringList = [];
List<Widget> suggestionWidgetList = [];

getData() async {
  db.collection("stext").get().then(
    (QuerySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in QuerySnapshot.docs) {
        print(
            '${docSnapshot.id} => ${docSnapshot.data().toString().split(":")[1].split("}")[0]}');
        suggestionStringList
            .add(docSnapshot.data().toString().split(":")[1].split("}")[0]);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

class _SuggestionScreen extends State<SuggestionScreen> {
  // void dispose() {
  //   _suggestionController.dispose();
  //   super.dispose();
  // }

  List<Widget> retlist(String str) {
    if (suggestionWidgetList.length == 0) {
      for (var data in suggestionStringList) {
        suggestionWidgetList.add(
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: Text(
              data,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
        );
        suggestionWidgetList.add(
          Divider(
            thickness: 1.0,
          ),
        );
      }
    } else {
      suggestionWidgetList.add(
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: Text(
            str,
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
      );
      suggestionWidgetList.add(
        Divider(
          thickness: 1.0,
        ),
      );
    }
    return suggestionWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100.0,
        backgroundColor: Color(0xffA1CA0D),
        title: Text(
          '손주에게',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: suggestionWidgetList,
              ),
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20.0)),
              Flexible(
                child: TextFormField(
                  controller: _suggestionController,
                  focusNode: _suggestionNode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  onChanged: (value) {
                    if (_suggestionNode.hasFocus) {
                      _suggestionNode.requestFocus();
                    }
                  },
                  onFieldSubmitted: (String str) => {
                    setState(
                      () => {
                        suggestionInput = str,
                        db.collection("stext").add(
                          {
                            "suggestion": suggestionInput,
                          },
                        ),
                        retlist(suggestionInput),
                      },
                    ),
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 20.0)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
