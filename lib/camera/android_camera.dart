import 'package:flutter/material.dart';

class GetAndroidCamera extends StatefulWidget {
  @override
  _GetAndroidCameraState createState() => _GetAndroidCameraState();
}

class _GetAndroidCameraState extends State<GetAndroidCamera> {
  bool _isSettingsOn = false;
  bool _isFlashOn = false;
  bool _isTimerOn = false;
  bool _isRatioOn = false;
  bool _isMotionPhotoOn = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, toolbarHeight: 0,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.black,
                height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings,
                          color: _isSettingsOn ? Colors.yellow : Colors.white),
                      onPressed: () {
                        setState(() {
                          _isSettingsOn = !_isSettingsOn;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: _isFlashOn ? Colors.yellow : Colors.white),
                      onPressed: () {
                        setState(() {
                          _isFlashOn = !_isFlashOn;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.schedule,
                          color: _isTimerOn ? Colors.yellow : Colors.white),
                      onPressed: () {
                        setState(() {
                          _isTimerOn = !_isTimerOn;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.aspect_ratio,
                          color: _isRatioOn ? Colors.yellow : Colors.white),
                      onPressed: () {
                        setState(() {
                          _isRatioOn = !_isRatioOn;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                          _isMotionPhotoOn
                              ? Icons.motion_photos_on
                              : Icons.motion_photos_off,
                          color:
                              _isMotionPhotoOn ? Colors.yellow : Colors.white),
                      onPressed: () {
                        setState(() {
                          _isMotionPhotoOn = !_isMotionPhotoOn;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 150.0,
            height: 50.0,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 25.0),
            child: ScopingWidget(),
          ),
          // Camera preview will go here
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black,
              height: 120.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.filter_vintage,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.cached,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScopingWidget extends StatefulWidget {
  @override
  _ScopingWidgetState createState() => _ScopingWidgetState();
}

class _ScopingWidgetState extends State<ScopingWidget> {
  List<bool> _buttonValues = [false, true, false];

  void _handleButtonPressed(int buttonIndex) {
    setState(() {
      for (int i = 0; i < _buttonValues.length; ++i) {
        _buttonValues[i] = i == buttonIndex ? true : false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => ToggleButtons(
            constraints: BoxConstraints.expand(
                width: constraints.maxWidth / 3, height: constraints.maxHeight),
            borderRadius: BorderRadius.circular(50.0),
            borderWidth: 0,
            focusColor: Colors.transparent,
            fillColor: Colors.transparent,
            renderBorder: false,
            isSelected: _buttonValues,
            onPressed: _handleButtonPressed,
            children: [
              NumberButton(label: '0.5', isSelected: _buttonValues[0]),
              NumberButton(label: '1.0', isSelected: _buttonValues[1]),
              NumberButton(label: '2.0', isSelected: _buttonValues[2]),
            ],
          ),
        ));
  }
}

// class _ScopingWidgetState extends State<ScopingWidget> {
//   List<bool> _buttonValues = [false, true, false];

//   void _handleButtonPressed(int buttonIndex) {
//     setState(() {
//       for (int i = 0; i < _buttonValues.length; ++i) {
//         _buttonValues[i] = i == buttonIndex ? true : false;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.7),
//         borderRadius: BorderRadius.circular(50.0),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           NumberButton(
//             label: '0.5',
//             isActive: _buttonValues[0],
//             index: 0,
//             onPressed: _handleButtonPressed,
//           ),
//           NumberButton(
//             label: '1.0',
//             isActive: _buttonValues[1],
//             index: 1,
//             onPressed: _handleButtonPressed,
//           ),
//           NumberButton(
//             label: '2.0',
//             isActive: _buttonValues[2],
//             index: 2,
//             onPressed: _handleButtonPressed,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ScopingWidget extends StatefulWidget {
//   @override
//   _ScopingWidgetState createState() => _ScopingWidgetState();
// }

class NumberButton extends StatefulWidget {
  final String label;
  final bool isSelected;

  const NumberButton({Key? key, required this.label, required this.isSelected})
      : super(key: key);

  @override
  _NumberButtonState createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: widget.isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle),
      child: Text(
        widget.label,
        style: TextStyle(
          color: widget.isSelected ? Colors.black : Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
