import 'package:flutter/material.dart';

class AnimationPractice extends StatefulWidget {
  const AnimationPractice({Key? key}) : super(key: key);

  @override
  _AnimationPracticeState createState() => _AnimationPracticeState();
}

class _AnimationPracticeState extends State<AnimationPractice> {
  double _boxleftpos = 200;
  double _hollinew = 50;
  double _holrightpos = 100;
  double _verlineh = 0;
  double _endedtopup = 320;

  int hollinedurtime = 1;

  void _onTap() {
    setState(() {
      _boxleftpos = -100;
      _hollinew = 250;
      _holrightpos = 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アニメーション'),
      ),
      body: Center(
          child: Stack(children: <Widget>[
        // 横ライン
        AnimatedPositioned(
          top: _endedtopup,
          right: _holrightpos,
          duration: Duration(seconds: hollinedurtime),
          onEnd: () {
            hollinedurtime = 2;
            setState(() {
              _verlineh = 430;
              _endedtopup = -150;
            });
          },
          child: AnimatedSize(
            // vsync: this,
            duration: Duration(seconds: 1),
            child: Container(
              width: _hollinew,
              height: 10,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        // 折り返し縦ライン
        AnimatedPositioned(
          top: _endedtopup,
          right: 200,
          duration: Duration(seconds: hollinedurtime),
          child: AnimatedSize(
            duration: Duration(seconds: 2),
            child: Container(
              width: 10,
              height: _verlineh,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        // 最初のボックス
        AnimatedPositioned(
          top: 280,
          left: _boxleftpos,
          duration: Duration(seconds: 1),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blueAccent,
          ),
        ),
        // 出てくるボックス
        AnimatedPositioned(
          top: _endedtopup + 430,
          right: 100,
          duration: Duration(seconds: 2),
          child: Container(
            width: 200,
            height: 150,
            color: Colors.blueAccent,
          ),
        ),
      ])),
      floatingActionButton: FloatingActionButton(onPressed: _onTap),
    );
  }
}
