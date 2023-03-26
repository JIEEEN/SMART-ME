import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_me/common/toast.dart';
import 'package:smart_me/common/timer.dart';
import 'package:smart_me/common/tutorial_dialog.dart';

class AndroidCamera extends StatefulWidget {
  @override
  _AndroidCameraState createState() => _AndroidCameraState();
}

class _AndroidCameraState extends State<AndroidCamera> {
  bool _isSettingsOn = false;
  bool _isFlashOn = false;
  bool _isMotionPhotoOn = false;
  bool _isCameraFront = false;
  bool _isVideoPaused = false;
  bool _isSteadyVideoOn = false;
  int _timerDelay = 0;
  int _flashType = 0; // 0 -> off, 1 -> auto, 2 -> on
  int _ratioType = 0; // 0 -> 4:3, 1 -> 16:9, 2 -> 1:1, 3 -> full
  int _videoQualityType = 0;
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
    "우선은 카메라의 요소들에 대해 설명드리겠습니다.\n  상단의 버튼들을 눌러 카메라를 설정할 수 있습니다. 우선은  화면 상단에 있는 \"번개모양\"을 눌러주세요.",
    "이제 플래시(후레시)를 설정하실 수 있습니다. \n 다음 버튼을 눌러 플래시(후레시)가 \"자동으로 켜지도록\" 해보겠습니다. ",
    "잘하셨어요! 이제 어두운 곳에서 사진을 촬영할 때 자동으로 플래시가 터지면서 좋은 사진을 찍을 수 있습니다. 이번에는 옆에 있는 \"시계 모양\" 버튼을 눌러볼까요?",
    "이제 \"타이머\"를 설정할 수 있습니다. 촬영할 때 설정하신 시간만큼 기다린 후 촬영이 됩니다! \"3s(초)\"를 눌러볼까요?",
    "좋아요! 이제 사진을 촬영할 때 3초 후에 촬영될겁니다. 다음은 화면 비율 설정입니다. \"4:3\" 숫자 버튼을 눌러주세요.",
    "여기서는 화면의 비율을 결정하실 수 있습니다. \"1:1\"을 눌러주세요!",
    "이제 카메라 화면의 비율이 1대 1이 됐습니다. 음식사진을 찍거나 할때 좋다고 합니다. 이제 다음의 동그라미 버튼을 눌러주세요.",
    "모션포토를 찍을 수 있습니다!\n 모션은 움직임 이라는 뜻으로, 이제 움직이는 사진을 찍으실 수 있습니다. 이제 하단에 보이는 \"2.0\" 숫자를 눌러보겠습니다.",
    "글자가 확대된게 보이셨나요? 해당 영역에 있는 버튼을 누르면 배율을 조정하실 수 있습니다. \"0.5\"를 눌러주세요!",
    "좋습니다! 0.5배율은 \"광각\" 촬영으로, 더 많은 사물을 한번에 담을 수 있습니다. 이제 맨 아래 하얀 버튼을 눌러 사진을 찍겠습니다!",
    "잘하셨습니다! 지금처럼 카메라를 설정하시면, 원하시는 대로 사진을 촬영하실 수 있습니다. 이제는 동영상도 정복해보겠습니다.  \"비디오\"버튼을 눌러주세요! ",
    "동영상은 설정할 부분이 많이 없습니다. 화면 상단의 \"UHD60\" 버튼을 눌러주세요!",
    "이제 동영상의 화질을 설정하실 수 있습니다! HD -> FHD -> UHD 순으로 좋아진답니다.\n 이번에는 FHD60을 눌러주세요.",
    "30과 60은 동영상의 \"매끄러움\"을 담당해줍니다. 숫자가 높을수록 더 \"매끄러워\"지죠. \n 이제 손 모양을 눌러볼까요?",
    "동영상을 촬영하다보면, 손이 떨려서 제대로 찍히지 않을때가있죠. 손떨림 방지모드가 이를 막아준답니다. \n 그럼 이제 동영상을 촬영하겠습니다. 하단의 빨간 동그라미를 눌러주세요.",
    "동영상 촬영이 시작됐습니다! 동영상을 중간에 일시 정지 하실 수도 있습니다. 다음 버튼을 한번 눌러볼까요?",
    "좋습니다! 그럼 동영상 촬영을 재개해보겠습니다. 다음 버튼을 눌러주세요!",
    "동영상이 촬영되고 있습니다. 동영상을 촬영하면서 사진을 찍으실 수도 있습니다. 다음 버튼을 눌러주세요!",
    "잘하셨습니다! 동영상과는 별개로 사진도 함께 촬영됐습니다. 동영상 종료하고 싶으시다면 다음의 버튼을 눌러주시면 됩니다. ",
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
        child: Icon(Icons.flash_off, color: Colors.white, size: 35)), // 1
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.flash_auto, color: Colors.white, size: 35)), //2
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
        '2.0',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    ), //9
    null, //10
    null, //11

    null, //1
    null,
    null,
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.waving_hand, color: Colors.white, size: 35)),
    null,
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.pause, color: Colors.white, size: 35)),
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.play_arrow, color: Colors.white, size: 35)),
    Container(
        alignment: Alignment.center,
        width: 80,
        margin: EdgeInsets.all(75),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2e2e2e)),
        child: Icon(Icons.camera, color: Colors.white, size: 35)),
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

  final _toast = ToastBuilder();
  final GlobalKey<HMSTimerState> _HMSTimer = GlobalKey<HMSTimerState>();
  final GlobalKey<_ScopingWidgetState> _scopingWidget =
      GlobalKey<_ScopingWidgetState>();

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
                  style: TextStyle(color: Colors.green, fontSize: 40),
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Stack(
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
                          show(2);
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
                          show(4);
                          setState(() {
                            _overlayHeightTimer =
                                _overlayHeightTimer == 0 ? 80 : 0;
                          });
                        },
                      ),
                      TextButton(
                        child: Text(
                          _ratioType == 0
                              ? '4:3'
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
                            show(6);
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
                          show(8);
                          _toast.toast(
                              '모션 포토가 ' +
                                  (_isMotionPhotoOn ? '비활성화' : '활성화') +
                                  ' 되었습니다.',
                              _overlayHeightScreenTop + 100);
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
                      icon: Icon(Icons.waving_hand,
                          color:
                              _isSteadyVideoOn ? Colors.yellow : Colors.white),
                      onPressed: () {
                        show(15);
                        _toast.toast(
                            '손떨림 방지 모드가 ' +
                                (_isSteadyVideoOn ? '비활성화' : '활성화') +
                                ' 되었습니다.',
                            _overlayHeightScreenTop + 100);
                        setState(() {
                          _isSteadyVideoOn = !_isSteadyVideoOn;
                        });
                      },
                    ),
                    TextButton(
                      child: Text(
                        _ratioType == 0
                            ? '4:3'
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
                    TextButton(
                      child: Text(
                        _videoQualityType == 4
                            ? 'HD30'
                            : _videoQualityType == 3
                                ? 'FHD30'
                                : _videoQualityType == 2
                                    ? 'FHD60'
                                    : _videoQualityType == 1
                                        ? 'UHD30'
                                        : 'UHD60',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          show(13);
                          _overlayVideoQuality = 80;
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
                        show(5);
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
                        show(3);
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
                              (height * (1 / 8)) - 20 - 50;
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
                          _overlayHeightScreenTop = _overlayHeightScreenBottom =
                              (height * (7 / 32)) - 40 - 50;
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
                        show(7);
                        setState(() {
                          _overlayHeightRatio =
                              _overlayHeightRatio == 0 ? 80 : 0;
                          _ratioType = 2;
                          _overlayHeightScreenTop = _overlayHeightScreenBottom =
                              (height - width) / 2 - 40 - 50;
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
                          _overlayHeightScreenBottom =
                              _overlayHeightScreenTop = 0;
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
                /* 비디오 퀄리티 */
                clipBehavior: Clip.antiAlias,
                duration: Duration(milliseconds: 100),
                height: _overlayVideoQuality,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayVideoQuality =
                              _overlayVideoQuality == 0 ? 80 : 0;
                          _videoQualityType = 0;
                        });
                      },
                      child: Text(
                        'UHD60',
                        style: TextStyle(
                            color: _videoQualityType == 0
                                ? Colors.yellow
                                : Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayVideoQuality =
                              _overlayVideoQuality == 0 ? 80 : 0;
                          _videoQualityType = 1;
                        });
                      },
                      child: Text(
                        'UHD30',
                        style: TextStyle(
                            color: _videoQualityType == 1
                                ? Colors.yellow
                                : Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        show(14);
                        setState(() {
                          _overlayVideoQuality =
                              _overlayVideoQuality == 0 ? 80 : 0;
                          _videoQualityType = 2;
                        });
                      },
                      child: Text(
                        'FHD60',
                        style: TextStyle(
                            color: _videoQualityType == 2
                                ? Colors.yellow
                                : Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayVideoQuality =
                              _overlayVideoQuality == 0 ? 80 : 0;
                          _videoQualityType = 3;
                        });
                      },
                      child: Text(
                        'FHD30',
                        style: TextStyle(
                            color: _videoQualityType == 3
                                ? Colors.yellow
                                : Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _overlayVideoQuality =
                              _overlayVideoQuality == 0 ? 80 : 0;
                          _videoQualityType = 4;
                        });
                      },
                      child: Text(
                        'HD30',
                        style: TextStyle(
                            color: _videoQualityType == 4
                                ? Colors.yellow
                                : Colors.white),
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
            /* 앞/뒤 화면 */
            scale: _scopingWidget.currentState?._selectedScope ?? 1.0,
            child: Text(
              _isCameraFront ? '앞' : '뒤',
              style: TextStyle(fontSize: 200),
            ),
          ),
          Container(
            /* 스코프 컨트롤 */
            width: 150.0,
            height: 50.0,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 25.0),
            child: ScopingWidget(
                key: _scopingWidget,
                refresh: () => setState(() {}),
                show: show),
          ),
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
                      color: _isModeCamera ? Colors.grey : Colors.transparent),
                  child: TextButton(
                    onPressed: () => setState(() {
                      _isModeCamera = true;
                      _overlayHeightVideoToolBox = 0;
                      _overlayHeightVideoStarter = 0;
                    }),
                    child: Text(
                      '카메라',
                      style: TextStyle(color: Colors.white, fontSize: 28.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: !_isModeCamera ? Colors.grey : Colors.transparent),
                  child: TextButton(
                    onPressed: () => setState(() {
                      show(12);
                      _isModeCamera = false;
                      _overlayHeightVideoToolBox = 80;
                      _overlayHeightVideoStarter = 120;
                    }),
                    child: Text(
                      '비디오',
                      style: TextStyle(color: Colors.white, fontSize: 28.0),
                    ),
                  ),
                ),
              ],
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
                                show(11);
                                _toast.toast('사진이 촬영되었습니다.',
                                    _overlayHeightScreenTop + 100);
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
                          heroTag: 'btnVideo',
                          backgroundColor: Colors.white,
                          onPressed: () => {
                            show(16),
                            setState(() {
                              _HMSTimer.currentState?.start();
                              _isVideoPaused = false;
                              _overlayHeightVideoControl = 100;
                              _overlayHeightVideoTimer = 80;
                              _overlayHeightVideoStarter = 0;
                            })
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)),
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
                        IconButton(
                          onPressed: () {
                            show(19);
                            setState(() {
                              _toast.toast('사진이 촬영되었습니다.',
                                  _overlayHeightScreenTop + 100);
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
                                    show(18);
                                    show(17);
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
                                    show(20);
                                    _toast.toast(
                                        '${_HMSTimer.currentState?.printTimeAsHMSKorean()} 길이의 비디오가 저장되었습니다.',
                                        _overlayHeightScreenTop + 100);
                                    _HMSTimer.currentState?.stop();
                                    setState(() {
                                      _overlayHeightVideoStarter = 100;
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
  const ScopingWidget({Key? key, required this.refresh, required this.show})
      : super(key: key);
  final Function() refresh;
  final Function(int a) show;

  @override
  _ScopingWidgetState createState() => _ScopingWidgetState();
}

class _ScopingWidgetState extends State<ScopingWidget> {
  double _selectedScope = 1.0;
  final List<bool> _buttonValues = [false, true, false];
  final List<double> _scopingValues = [0.5, 1.0, 2.0];

  void _handleButtonPressed(int buttonIndex) {
    if (buttonIndex == 2) {
      widget.show(9);
    }
    if (buttonIndex == 0) {
      widget.show(10);
    }

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
