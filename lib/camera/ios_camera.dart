import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_me/common/toast.dart';
import 'package:smart_me/common/timer.dart';

class IosCamera extends StatefulWidget {
  @override
  _IosCameraState createState() => _IosCameraState();
}

class _IosCameraState extends State<IosCamera> {
  bool _isToolbarOn = false;
  bool _isFlashOn = false;
  bool _isMotionPhotoOn = false;
  bool _isCameraFront = false;
  bool _isVideoPaused = false;
  int _timerDelay = 0;
  int _flashType = 0; // 0 -> off, 1 -> auto, 2 -> on
  int _ratioType = 0; // 0 -> 3:4, 1 -> 16:9, 2 -> 1:1, 3 -> full
  int _videoQualityType = 0;
  int _videoFrameType = 0;
  double _selectedScope = 1.0;
  double _overlayCameraToolbar = 0;
  double _overlayHeightTimer = 0;
  double _overlayHeightFlash = 0;
  double _overlayHeightRatio = 0;
  double _overlayVideoQuality = 0;
  double _overlayHeightVideoControl = 0;
  double _overlayHeightVideoTimer = 0;
  double _overlayHeightVideoStarter = 0;
  double _overlayHeightVideoToolBox = 0;
  double _overlayHeightScreenTop = 100;
  double _overlayHeightScreenBottom = 120;

  bool _isModeCamera = true;

  late String? _currentTime;

  void _controlToolBar(bool flag) {
    setState(() {
      _isToolbarOn = flag;
      _overlayCameraToolbar = flag ? 80 : 0;
    });
  }

  final _toast = ToastBuilder();
  final GlobalKey<HMSTimerState> _HMSTimer = GlobalKey<HMSTimerState>();

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
        children: [
          Stack(
            children: [
              AnimatedContainer(
                /* 화면비율 조정 */
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 100),
                height: _overlayHeightScreenTop,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Align(
                /* 기본 카메라 메인 툴바 */
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  color: Colors.black,
                  height: 80.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: _flashType == 2
                                  ? Colors.yellow
                                  : Colors.white,
                              width: 2),
                          color: _flashType == 2 ? Colors.yellow : Colors.black,
                        ),
                        child: IconButton(
                          icon: Icon(
                            _flashType == 0 ? Icons.flash_off : Icons.flash_on,
                            color:
                                _flashType == 2 ? Colors.black : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _flashType = _flashType == 0 ? 1 : 0;
                            });
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
                        child: IconButton(
                          icon: Icon(
                            _isToolbarOn
                                ? Icons.expand_more
                                : Icons.expand_less,
                            color: _isToolbarOn ? Colors.yellow : Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              _isToolbarOn = !_isToolbarOn;
                              _overlayCameraToolbar =
                                  _overlayCameraToolbar == 0 ? 80 : 0;
                            });
                          },
                        ),
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
                          _toast.toast(
                              'LIVE 포토 ' + (_isMotionPhotoOn ? '끔' : '켬'),
                              _overlayHeightScreenTop + 30);
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
                /* 비디오 메인 툴바 */
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 10),
                height: _overlayHeightVideoToolBox,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.black,
                      ),
                      child: IconButton(
                        icon: Icon(
                          _flashType == 0 ? Icons.flash_off : Icons.flash_on,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isFlashOn = !_isFlashOn;
                            _flashType = _flashType == 0 ? 1 : 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '00 : 00 : 00',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                            child: TextButton(
                              child: Text(
                                _videoQualityType == 1 ? '4K' : 'HD',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                setState(() {
                                  _videoQualityType =
                                      _videoQualityType == 0 ? 1 : 0;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: TextButton(
                              child: Text(
                                _videoFrameType == 1 ? '30' : '60',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                setState(() {
                                  _videoFrameType =
                                      _videoFrameType == 0 ? 1 : 0;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                /* 비디오 촬영중 타이머 */
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 10),
                height: _overlayHeightVideoTimer,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        fit: FlexFit.loose,
                        flex: 8,
                        child: HMSTimer(key: _HMSTimer)),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onVerticalDragEnd: (details) => {
                  if (details.velocity.pixelsPerSecond.dy > 0)
                    {_controlToolBar(true)}
                  else
                    {_controlToolBar(false)}
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.scale(
                    /* 앞/뒤 화면 */
                    scale: _selectedScope,
                    child: Text(
                      _isCameraFront ? '앞' : '뒤',
                      style: TextStyle(fontSize: 200),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            /* 스코프 설정 */
            /* 언젠가는 드래그 스코핑을...*/
            child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextButton(
                  child: Text(
                    '$_selectedScope',
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () => setState(() {
                    _selectedScope = _selectedScope == 0.5
                        ? 1.0
                        : _selectedScope == 1.0
                            ? 2.0
                            : 0.5;
                  }),
                )),
          ),
          Stack(
            children: [
              Container(
                /* 카메라/비디오 컨트롤 */
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !_isModeCamera
                              ? Color(0xFF2e2e2e)
                              : Colors.transparent),
                      child: TextButton(
                        onPressed: () => setState(() {
                          _isModeCamera = false;
                          _overlayHeightVideoToolBox = 80;
                          _overlayHeightVideoStarter = 120;
                          _overlayCameraToolbar = 0;
                          _isToolbarOn = false;
                        }),
                        child: Text(
                          '비디오',
                          style: TextStyle(
                              color:
                                  _isModeCamera ? Colors.white : Colors.yellow,
                              fontSize: 28.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _isModeCamera
                              ? Color(0xFF2e2e2e)
                              : Colors.transparent),
                      child: TextButton(
                        onPressed: () => setState(() {
                          _isModeCamera = true;
                          _overlayHeightVideoToolBox = 0;
                          _overlayHeightVideoStarter = 0;
                        }),
                        child: Text(
                          '카메라',
                          style: TextStyle(
                              color:
                                  _isModeCamera ? Colors.yellow : Colors.white,
                              fontSize: 28.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 100),
                height: _overlayCameraToolbar,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
                        child: IconButton(
                          icon: Icon(
                            _flashType == 0 ? Icons.flash_off : Icons.flash_on,
                            color:
                                _flashType == 2 ? Colors.yellow : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isFlashOn = !_isFlashOn;
                              _overlayHeightFlash = 80;
                            });
                          },
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
                          child: IconButton(
                            icon: Icon(Icons.schedule,
                                color: _timerDelay != 0
                                    ? Colors.yellow
                                    : Colors.white),
                            onPressed: () {
                              setState(() {
                                _overlayHeightTimer =
                                    _overlayHeightTimer == 0 ? 80 : 0;
                              });
                            },
                          )),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
                        child: TextButton(
                          child: Text(
                            _ratioType == 0
                                ? '4:3'
                                : _ratioType == 1
                                    ? '16:9'
                                    : '1:1',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              _overlayHeightRatio = 80;
                            });
                          },
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
                          child: IconButton(
                            icon: Icon(
                                _isMotionPhotoOn
                                    ? Icons.motion_photos_on
                                    : Icons.motion_photos_off,
                                color: _isMotionPhotoOn
                                    ? Colors.yellow
                                    : Colors.white),
                            onPressed: () {
                              _toast.toast(
                                  '모션 포토가 ' +
                                      (_isMotionPhotoOn ? '비활성화' : '활성화') +
                                      ' 되었습니다.',
                                  _overlayHeightScreenTop + 100);
                              setState(() {
                                _isMotionPhotoOn = !_isMotionPhotoOn;
                              });
                            },
                          )),
                    ]),
              ),
              AnimatedContainer(
                /* 카메라/비디오 플래시 */
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 100),
                height: _overlayHeightFlash,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: Text(
                        '${_flashType == 1 ? '플래시' : ''} 자동',
                        style: TextStyle(
                          color: _flashType == 1 ? Colors.yellow : Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _overlayHeightFlash =
                              _overlayHeightFlash == 0 ? 80 : 0;
                          _flashType = 1;
                        });
                      },
                    ),
                    TextButton(
                      child: Text(
                        '${_flashType == 0 ? '플래시' : ''} 끔',
                        style: TextStyle(
                          color: _flashType == 0 ? Colors.yellow : Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _overlayHeightFlash =
                              _overlayHeightFlash == 0 ? 80 : 0;
                          _flashType = 0;
                        });
                      },
                    ),
                    TextButton(
                      child: Text(
                        '${_flashType == 2 ? '플래시' : ''} 켬',
                        style: TextStyle(
                          color: _flashType == 2 ? Colors.yellow : Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _overlayHeightFlash =
                              _overlayHeightFlash == 0 ? 80 : 0;
                          _flashType = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                /* 카메라 타이머 */
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
                      child: Text('타이머 해제',
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
                          _timerDelay = 3;
                        });
                      },
                      child: Text('3초',
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
                      child: Text('10초',
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
                /* 카메라/비디오 비율 전환 */
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
                          _overlayHeightScreenTop = _overlayHeightScreenBottom =
                              (height * (1 / 8)) - 20;
                        });
                      },
                      child: Text(
                        '4:3',
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
                          _ratioType = 2;
                          _overlayHeightScreenTop = _overlayHeightScreenBottom =
                              (height - width) / 2 - 40;
                        });
                      },
                      child: Text(
                        '정방형',
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
                          _overlayHeightScreenTop = _overlayHeightScreenBottom =
                              (height * (7 / 32)) - 40;
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
                  ],
                ),
              ),
            ],
          ),
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
                    /* 기본 카메라 */
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
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          GestureDetector(
                            onLongPress: () {
                              _toast.toast('비디오 촬영을 시작합니다',
                                  _overlayHeightScreenTop + 100);
                              _HMSTimer.currentState?.start();
                              setState(() {
                                _isVideoPaused = false;
                                _overlayHeightVideoControl = 100;
                                _overlayHeightVideoTimer = 80;
                              });
                            },
                            child: FloatingActionButton(
                              heroTag: 'btnCamera',
                              backgroundColor: Colors.white,
                              onPressed: () {
                                _toast.toast('사진이 촬영되었습니다.',
                                    _overlayHeightScreenTop + 100);
                              },
                              child: Container(
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black, width: 1.5)),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.3),
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
                    /* 비디오 촬영 전 컨트롤 */
                    clipBehavior: Clip.antiAlias,
                    duration: Duration(milliseconds: 10),
                    height: _overlayHeightVideoStarter,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                        FloatingActionButton(
                          heroTag: 'btnVideo',
                          backgroundColor: Colors.white,
                          onPressed: () => setState(() {
                            _HMSTimer.currentState?.start();
                            _isVideoPaused = false;
                            _overlayHeightVideoControl = 100;
                            _overlayHeightVideoTimer = 80;
                            _overlayHeightVideoStarter = 0;
                          }),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.3),
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
                  AnimatedContainer(
                    /* 비디오 촬영 중 컨트롤 */
                    clipBehavior: Clip.antiAlias,
                    duration: Duration(milliseconds: 100),
                    height: _overlayHeightVideoControl,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              border: Border.all(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            onPressed: () {
                              _toast.toast(
                                  '${_HMSTimer.currentState?.printTimeAsHMSKorean()} 길이의 비디오가 저장되었습니다.',
                                  _overlayHeightScreenTop + 100);
                              _HMSTimer.currentState?.stop();
                              setState(() {
                                _overlayHeightVideoStarter = 100;
                                _overlayHeightVideoControl =
                                    _overlayHeightVideoControl == 0 ? 100 : 0;
                                _overlayHeightVideoTimer =
                                    _overlayHeightVideoTimer == 0 ? 80 : 0;
                              });
                            },
                            icon: Container(
                                width: 32, height: 32, color: Colors.white),
                          ),
                        )
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
