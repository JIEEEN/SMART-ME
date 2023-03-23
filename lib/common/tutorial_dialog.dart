import 'package:flutter/material.dart';

class TutorialDialog extends StatelessWidget {
  final String tutorialMessage;
  final EdgeInsets? textPadding, buttonPadding;
  final TextAlign? align;
  final Widget? widget;

  const TutorialDialog(
      {super.key,
      required this.tutorialMessage,
      this.textPadding,
      this.buttonPadding,
      this.align,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: textPadding ?? EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      tutorialMessage,
                      textAlign: align ?? TextAlign.left,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0,50,0,50,),
                    width: widget == null ? 0 :  200,
                    height: widget == null ? 0 :  200,
                    color: widget == null ? Colors.transparent :  Colors.white,
                    child: widget ?? SizedBox(),
                  ),
                  Padding(
                      padding: buttonPadding ?? EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 100,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffa1ca0d)),
                            alignment: Alignment.center,
                            child: Text(
                              "확인",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ))),
                  
                ],
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: textPadding ?? EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                tutorialMessage,
                textAlign: align ?? TextAlign.left,
                style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}
