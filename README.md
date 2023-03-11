# common/timer

A Timer displays time in HH:MM:SS form.
You can also get korean form of current time in 시:분:초 format.
Passing parameters will customize the widget height, width, box color and text styles.

## functions
Use `GlobalKey()` to excute this functions.

- `void start()` 
Start timer. Time is 'counted' in `_timerCount` variable, counted at every 10 milliseconds.

- `void pause()`  
Pause timer. Current value of `_timerCount` will be preserved.

- `void stop()`    
Stop timer. This will reset `_timerCount` to `0`.

- `String printTimeAsHMS()`  
Return recorded time in `HH:MM:SS` form.

- `String printTimeAsHMSKorean()`
Return recorded time in `0시0분0초` form. If hour or minute is `0`, then they will not be returned. EX) `123`seconds -> `2분3초`


## Usage

```Dart
class ExampleState extends State<Example> {
  final GlobalKey<HMSTimerState> _HMSTimer = GlobalKey<HMSTimerState>();
  ...
  @override
  Widget build(BuildContext context){
    return Container(
        child:Col(
            childeren:[
                HMSTimer(key:_HMSTimer),
                Row(
                    childeren:[
                        IconButton(
                            icon: Icons.play_arrow,
                            onPressed: () {
                                _HMSTimer.currentState?.start();
                            }
                        ),
                        IconButton(
                            icon: Icons.pause,
                            onPressed: () {
                                _HMSTimer.currentState?.pause();
                            }
                        ),
                        IconButton(
                            icon: Icons.stop,
                            onPressed: () {
                                _HMSTimer.currentState?.stop();
                            }
                        )
                    ]
                )

            ]
        )
  }
}

```