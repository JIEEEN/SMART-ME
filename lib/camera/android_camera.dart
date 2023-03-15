import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_me/common/toast.dart';
import 'package:smart_me/common/timer.dart';

class GetAndroidCamera extends StatefulWidget {
  @override
  _GetAndroidCameraState createState() => _GetAndroidCameraState();
}

class _GetAndroidCameraState extends State<GetAndroidCamera> {
  bool _isSettingsOn = false;
  bool _isFlashOn = false;
  bool _isRatioOn = false;
  bool _isMotionPhotoOn = false;
  bool _isCameraFront = false;
  bool _isVideoPaused = false;
  int _timerDelay = 0;
  int _flashType = 0; // 0 -> off, 1 -> auto, 2 -> on
  int _ratioType = 0; // 0 -> 3:4, 1 -> 16:9, 2 -> 1:1, 3 -> full
  double _overlayHeightTimer = 0;
  double _overlayHeightFlash = 0;
  double _overlayHeightRatio = 0;
  double _overlayHeightVideoControl = 0;
  double _overlayHeightVideoTimer = 0;
  double _overlayHeightScreenTop = 100;
  double _overlayHeightScreenBottom = 120;

  late String? _currentTime;

  final _toast = ToastBuilder();
  final GlobalKey<HMSTimerState> _HMSTimer = GlobalKey<HMSTimerState>();
  final GlobalKey<_ScopingWidgetState> _scopingWidget =
      GlobalKey<_ScopingWidgetState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    _toast.context = context;
    setState(() {
      _currentTime = _HMSTimer.currentState?.printTimeAsHMS();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Stack(
            children: [
              AnimatedContainer(
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 100),
                height: _overlayHeightScreenTop,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Align(
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
                            color:
                                _isSettingsOn ? Colors.yellow : Colors.white),
                        onPressed: () {
                          setState(() {
                            _isSettingsOn = !_isSettingsOn;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _flashType == 0
                              ? Icons.flash_off
                              : _flashType == 1
                                  ? Icons.flash_auto
                                  : Icons.flash_on,
                          color: _flashType == 2 ? Colors.yellow : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isFlashOn = !_isFlashOn;
                            _overlayHeightFlash = 80;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                            _timerDelay == 0
                                ? Icons.schedule
                                : _timerDelay == 3
                                    ? Icons.timer_3
                                    : _timerDelay == 10
                                        ? Icons.timer_10
                                        : Icons.one_x_mobiledata,
                            color: _timerDelay != 0
                                ? Colors.yellow
                                : Colors.white),
                        onPressed: () {
                          setState(() {
                            _overlayHeightTimer =
                                _overlayHeightTimer == 0 ? 80 : 0;
                          });
                        },
                      ),
                      TextButton(
                        child: Text(
                          _ratioType == 0
                              ? '3:4'
                              : _ratioType == 1
                                  ? '16:9'
                                  : _ratioType == 2
                                      ? '1:1'
                                      : 'Full',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            _overlayHeightRatio = 80;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                            _isMotionPhotoOn
                                ? Icons.motion_photos_on
                                : Icons.motion_photos_off,
                            color: _isMotionPhotoOn
                                ? Colors.yellow
                                : Colors.white),
                        onPressed: () {
                          _toast.toast('모션 포토가 ' +
                              (_isMotionPhotoOn ? '비활성화' : '활성화') +
                              ' 되었습니다.', _overlayHeightScreenTop + 100);
                          setState(() {
                            _isMotionPhotoOn = !_isMotionPhotoOn;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: _overlayHeightTimer,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightTimer = 0;
                          _timerDelay = 0;
                        });
                      },
                      child: Text('0s',
                          style: TextStyle(
                              color: _timerDelay == 0
                                  ? Colors.yellow
                                  : Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightTimer = 0;
                          _timerDelay = 1;
                        });
                      },
                      child: Text('1s',
                          style: TextStyle(
                              color: _timerDelay == 1
                                  ? Colors.yellow
                                  : Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightTimer = 0;
                          _timerDelay = 3;
                        });
                      },
                      child: Text('3s',
                          style: TextStyle(
                              color: _timerDelay == 3
                                  ? Colors.yellow
                                  : Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightTimer = 0;
                          _timerDelay = 10;
                        });
                      },
                      child: Text('10s',
                          style: TextStyle(
                              color: _timerDelay == 10
                                  ? Colors.yellow
                                  : Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 100),
                height: _overlayHeightFlash,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightFlash =
                              _overlayHeightFlash == 0 ? 80 : 0;
                          _flashType = 0;
                        });
                      },
                      icon: Icon(
                        Icons.flash_off,
                        color: _flashType == 0 ? Colors.yellow : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightFlash =
                              _overlayHeightFlash == 0 ? 80 : 0;
                          _flashType = 1;
                        });
                      },
                      icon: Icon(
                        Icons.flash_auto,
                        color: _flashType == 1 ? Colors.yellow : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightFlash =
                              _overlayHeightFlash == 0 ? 80 : 0;
                          _flashType = 2;
                        });
                      },
                      icon: Icon(
                        Icons.flash_on,
                        color: _flashType == 2 ? Colors.yellow : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 100),
                height: _overlayHeightRatio,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightRatio =
                              _overlayHeightRatio == 0 ? 80 : 0;
                          _ratioType = 0;
                          _overlayHeightScreenTop = _overlayHeightScreenBottom = (height * (1/8));
                        });
                      },
                      child: Text(
                        '3:4',
                        style: TextStyle(
                            color:
                                _ratioType == 0 ? Colors.yellow : Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightRatio =
                              _overlayHeightRatio == 0 ? 80 : 0;
                          _overlayHeightScreenTop = _overlayHeightScreenBottom = (height * (7/32));
                          _ratioType = 1;
                        });
                      },
                      child: Text(
                        '16:9',
                        style: TextStyle(
                            color:
                                _ratioType == 1 ? Colors.yellow : Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightRatio =
                              _overlayHeightRatio == 0 ? 80 : 0;
                          _ratioType = 2;
                          _overlayHeightScreenTop = _overlayHeightScreenBottom = (height - width)/2;
                        });
                      },
                      child: Text(
                        '1:1',
                        style: TextStyle(
                            color:
                                _ratioType == 2 ? Colors.yellow : Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayHeightRatio =
                              _overlayHeightRatio == 0 ? 80 : 0;
                          _overlayHeightScreenBottom = _overlayHeightScreenTop = 0;
                          _ratioType = 3;
                        });
                      },
                      child: Text(
                        'Full',
                        style: TextStyle(
                            color:
                                _ratioType == 3 ? Colors.yellow : Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 10),
                height: _overlayHeightVideoTimer,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(fit: FlexFit.loose, flex: 1, child: Container()),
                    Flexible(
                        fit: FlexFit.loose,
                        flex: 8,
                        child: HMSTimer(key: _HMSTimer)),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          _flashType == 0
                              ? Icons.flash_off
                              : _flashType == 1
                                  ? Icons.flash_auto
                                  : Icons.flash_on,
                          color: _flashType == 2 ? Colors.yellow : Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
          Transform.scale(
            scale: _scopingWidget.currentState?._selectedScope ?? 1.0,
            child: Text(
              _isCameraFront ? '앞' : '뒤',
              style: TextStyle(fontSize: 200),
            ),
          ),
          Container(
            width: 150.0,
            height: 50.0,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 25.0),
            child: ScopingWidget(
              key: _scopingWidget,
              refresh: () => setState(() {}),
            ),
          ),
          // Camera preview will go here
          Stack(
            children: [
               AnimatedContainer(
                    clipBehavior: Clip.antiAlias,
                    duration: Duration(milliseconds: 100),
                    height: _overlayHeightScreenBottom,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
              Stack(
                children: [
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
                          GestureDetector(
                            onLongPress: () {
                              _toast.toast('비디오 촬영을 시작합니다', _overlayHeightScreenTop + 100);
                              _HMSTimer.currentState?.start();
                              setState(() {
                                _isVideoPaused = false;
                                _overlayHeightVideoControl = 100;
                                _overlayHeightVideoTimer = 80;
                              });
                            },
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {
                                _toast.toast('사진이 촬영되었습니다.', _overlayHeightScreenTop + 100);
                              },
                            ),
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
                              onPressed: () {
                                setState(() {
                                  _isCameraFront = !_isCameraFront;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    clipBehavior: Clip.antiAlias,
                    duration: Duration(milliseconds: 100),
                    height: _overlayHeightVideoControl,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _toast.toast('사진이 촬영되었습니다.', _overlayHeightScreenTop + 100);
                            });
                          },
                          icon: Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (_isVideoPaused) {
                                      _HMSTimer.currentState?.start();
                                    } else {
                                      _HMSTimer.currentState?.pause();
                                    }
                                    setState(() {
                                      _isVideoPaused = !_isVideoPaused;
                                    });
                                  },
                                  icon: Icon(
                                    _isVideoPaused
                                        ? Icons.play_arrow
                                        : Icons.pause,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _toast.toast(
                                        '${_HMSTimer.currentState?.printTimeAsHMSKorean()} 길이의 비디오가 저장되었습니다.', _overlayHeightScreenTop + 100);
                                    _HMSTimer.currentState?.stop();
                                    setState(() {
                                      _overlayHeightVideoControl =
                                          _overlayHeightVideoControl == 0
                                              ? 100
                                              : 0;
                                      _overlayHeightVideoTimer =
                                          _overlayHeightVideoTimer == 0
                                              ? 80
                                              : 0;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.stop,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isCameraFront = !_isCameraFront;
                            });
                          },
                          icon: Icon(
                            Icons.cached,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ScopingWidget extends StatefulWidget {
  const ScopingWidget({Key? key, required this.refresh}) : super(key: key);
  final Function() refresh;

  @override
  _ScopingWidgetState createState() => _ScopingWidgetState();
}

class _ScopingWidgetState extends State<ScopingWidget> {
  double _selectedScope = 1.0;
  final List<bool> _buttonValues = [false, true, false];
  final List<double> _scopingValues = [0.5, 1.0, 2.0];

  void _handleButtonPressed(int buttonIndex) {
    setState(() {
      for (int i = 0; i < _buttonValues.length; ++i) {
        _buttonValues[i] = i == buttonIndex ? true : false;
      }
      _selectedScope = _scopingValues[buttonIndex];
      widget.refresh();
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
