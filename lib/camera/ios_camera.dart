import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_me/common/toast.dart';
import 'package:smart_me/common/timer.dart';
import 'package:smart_me/common/tutorial_dialog.dart';

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

  int _currentStep = 0;

  bool _isModeCamera = true;

  late String? _currentTime;

  final List<String> _messeges = [
    "카메라 튜토리얼에 오신걸 환영합니다!\n 본 과정에서는 카메라 및 비디오의 기초 사용법에 대해 알아보겠습니다.\n 화면 최상단의 버튼을 누르면 안내메시지를 다시 보실수 있습니다.",
    "우선은 카메라의 요소들에 대해 설명드리겠습니다.\n  하단의 버튼을 확인하시고, 확인을 누르신 후 똑같이 생긴 버튼을 눌려주세요. ",
    "잘했습니다! 이제 카메라의 설정을 조작할 수 있습니다!\n 플래시(후레시) 설정에 대해 알아보겠습니다.\n 확인을 누르신 후 \"아래쪽에 있는\" 번개모양을 눌러주세요.",
    "다음과 같이 플래시(후레시)를 끄거나 키실 수 있습니다.\n '자동'을 눌러 플래시를 켜봅시다!",
    "잘하셨어요! 이제 어두운 곳에서 사진을 촬영할 때 자동으로 플래시가 터지면서 좋은 사진을 찍을 수 있습니다. 이번에는 근처에 있는 \"시계 모양\" 버튼을 눌러볼까요?",
    "이제 \"타이머\"를 설정할 수 있습니다. 촬영할 때 설정하신 시간만큼 기다린 후 촬영이 됩니다! \"3초\"를 눌러볼까요?",
    "좋아요! 이제 사진을 촬영할 때 3초 후에 촬영될겁니다. 다음은 화면 비율 설정입니다. \"4:3\" 숫자 버튼을 눌러주세요.",
    "여기서는 화면의 비율을 결정하실 수 있습니다. \"정방형\"을 눌러주세요!",
    "이제 카메라 화면의 비율이 1대 1이 됐습니다. 음식사진을 찍거나 할때 좋다고 합니다. 이제 다음의 동그라미 버튼을 눌러주세요.",
    "Live포토를 찍을 수 있습니다!\n '라이브포토'라고 읽으며, 움직이는 사진을 찍으실 수 있습니다. 마지막으로 \"1.0\" 숫자를 눌러보겠습니다.",
    "글자가 확대된게 보이셨나요? 해당 버튼을 계속해서 누르면 배율을 바꿀수 있습니다. 한번 더 눌러보세요!",
    "좋습니다! 0.5배율은 \"광각\" 촬영으로, 더 많은 사물을 한번에 담을 수 있습니다. 이제 맨 아래 하얀 버튼을 눌러 사진을 찍겠습니다!",
    "잘하셨습니다! 지금처럼 카메라를 설정하시면, 원하시는 대로 사진을 촬영하실 수 있습니다. 이제는 동영상도 정복해보겠습니다. 우선 이 버튼을 눌러주세요!",
    "방금 누른 버튼을 누르면, 카메라 촬영 설정을 지금까지 하신것 처럼 변경하실 수 있습니다. 동영상 정복을 위해 \"비디오\"버튼을 눌러주세요! ",
    "동영상은 설정할 부분이 많이 없습니다. 화면 상단의 \"HD\" 버튼을 눌러주세요!",
    "방금처럼, 해당 글자를 눌러 화질을 결정할 수 있습니다. HD -> FHD -> 4K순으로 좋아진답니다.\n 다음으로 옆에있는 \"60\"을 눌러보세요",
    "30과 60은 동영상의 \"매끄러움\"을 담당해줍니다. 숫자가 높을수록 더 \"매끄러워\"지죠. \n 마지막으로 처음에 봤던, 번개모양을 눌러볼까요?",
    "번개에 금이 그어져 있는 것은, 동영상을 촬영할 때 플래시를 전혀 사용하지 않겠다는 뜻입니다. 다시한번 번개모양을 눌러볼까요?",
    "좋습니다! 이제 어두운 공간에서 동영상을 촬영하면, 자동으로 플래시가 켜져 주위가 밝아집니다.\n 그럼 이제 동영상을 촬영하겠습니다. 하단의 빨간 동그라미를 눌러주세요.",
    "동영상 촬영이 시작됐습니다! 원하시는 만큼 촬영하다, 종료하고 싶으시다면 다음의 버튼을 눌러주시면 됩니다. ",
    "이것으로 카메라 앱 튜토리얼이 전부 끝났습니다! 카메라 조작에 능숙해지신것을 축하합니다!"
  ];
  final List<Widget?> _widgets = [
    Icon(Icons.refresh, color: Colors.black, size: 80), //0
    Container(
      alignment: Alignment.center,
      width: 80,
      margin: EdgeInsets.all(75),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
      child: Icon(
        Icons.expand_less,
        color: Colors.white,
        size: 35,
      ),
    ), //1
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.flash_off, color: Colors.white, size: 35)), //2
    null, //3
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.schedule, color: Colors.white, size: 35)), //4
    null, //5
    null, //6
    null, //7
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child:
            Icon(Icons.motion_photos_off, color: Colors.white, size: 35)), //8
    Container(
      width: 80,
      margin: EdgeInsets.all(75),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: Text(
        '1.0',
        style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w700),
      ),
    ), //9
    null, //10
    null, //11
    Container(
      alignment: Alignment.center,
      width: 80,
      margin: EdgeInsets.all(75),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
      child: Icon(
        Icons.expand_more,
        color: Colors.yellow,
        size: 35,
      ),
    ),
    null, //1
    null,
    null,
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.flash_off, color: Colors.white, size: 35)),
     Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.flash_on, color: Colors.white, size: 35)),
    null,
    Container(
      width: 48,
      height: 48,
      margin: EdgeInsets.all(75),
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.black),
          borderRadius: BorderRadius.circular(100)),
      child: Container(
          margin: EdgeInsets.all(10),
          width: 32,
          height: 32,
          color: Colors.black),
    ),
    null,
  ];

  void show(int sequence, {bool forceFlag = false}) {
    if (sequence != _currentStep && !forceFlag) return;
    String tutorialMessage = _messeges[sequence];
    setState(() {
      _currentStep++;
    });
    Future.microtask(() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => TutorialDialog(
            tutorialMessage: tutorialMessage,
            textPadding: EdgeInsets.fromLTRB(38.0, 240.0, 38.0, 12.0),
            align: TextAlign.center,
            widget: _widgets[sequence])));
  }

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

    show(1, forceFlag: true);
    show(0, forceFlag: true);
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
        toolbarHeight: 50,
        title: _currentStep > 20
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '복귀하기',
                  style: TextStyle(color: Colors.green , fontSize: 40),
                ))
            : Text(
                '연습 화면입니다',
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
        leading: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: GestureDetector(
                onTap: () {
                  show(--_currentStep);
                },
                child: Icon(Icons.refresh, color: Colors.white, size: 40))),
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
                            show(2);
                            show(13);
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
                          show(9);

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
                          show(18);
                          show(17);
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
                                show(15);
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
                                show(16);
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
                  // if (details.velocity.pixelsPerSecond.dy > 0)
                  //   {_controlToolBar(true)}
                  // else
                  //   {_controlToolBar(false)}
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
                    onPressed: () => {
                          show(11),
                          show(10),
                          setState(() {
                            _selectedScope = _selectedScope == 0.5
                                ? 1.0
                                : _selectedScope == 1.0
                                    ? 2.0
                                    : 0.5;
                          }),
                        })),
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
                        onPressed: () => {
                          show(14),
                          setState(() {
                            _isModeCamera = false;
                            _overlayHeightVideoToolBox = 80;
                            _overlayHeightVideoStarter = 120;
                            _overlayCameraToolbar = 0;
                            _isToolbarOn = false;
                          })
                        },
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
                            show(3);
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
                              show(5);
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
                            show(7);
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
                              show(9);
                              _toast.toast(
                                  'LIVE 포토 ' + (_isMotionPhotoOn ? '끔' : '켬'),
                                  _overlayHeightScreenTop + 30);
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
                        show(4);
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
                        show(6);
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
                        show(8);
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
                                show(12);
                                TutorialDialog(
                                  tutorialMessage: 'Hi',
                                );
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
                          onPressed: () => {
                            show(19),
                            setState(() {
                              _HMSTimer.currentState?.start();
                              _isVideoPaused = false;
                              _overlayHeightVideoControl = 100;
                              _overlayHeightVideoTimer = 80;
                              _overlayHeightVideoStarter = 0;
                            })
                          },
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
                              show(20);
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
