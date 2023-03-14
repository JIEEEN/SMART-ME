import 'package:flutter/material.dart';

class ToastBuilder {
  late BuildContext context;
  void toast(String? message, double? height) async {
    OverlayEntry _overlay =
        OverlayEntry(builder: (_) => Toast(message: message,height: height,));

    Navigator.of(context).overlay!.insert(_overlay);

    await Future.delayed(const Duration(seconds: 2));
    _overlay.remove();
  }
}

class Toast extends StatefulWidget {
  Toast({Key? key, required this.message, this.height}) : super(key: key);
  final String? message;
  double? height;

  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));

    _controller.forward().whenComplete(() {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: widget.height ?? 100),
          child: FadeTransition(
            opacity: _animation,
            child: Material(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Text(widget.message ?? 'Null',
                      style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}
