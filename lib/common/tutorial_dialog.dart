import 'package:flutter/material.dart';

class TutorialDialog extends StatelessWidget {
  final String tutorialMessage;
  final EdgeInsets? textPadding, buttonPadding;
  final TextAlign? align;

  const TutorialDialog(
      {super.key,
      required this.tutorialMessage,
      this.textPadding,
      this.buttonPadding,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: textPadding ?? EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                tutorialMessage,
                textAlign: align ?? TextAlign.center,
                style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
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
                      child: Text(
                        "확인",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
