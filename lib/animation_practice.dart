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
          top: 320,
          right: _holrightpos,
          duration: Duration(seconds: 1),
          onEnd: () {
            setState(() {
              _verlineh = 400;
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
        Positioned(
          top: 320,
          right: 200,
          child: AnimatedSize(
            duration: Duration(seconds: 2),
            child: Container(
              width: 10,
              height: _verlineh,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        // ボックス
        AnimatedPositioned(
          top: 280,
          left: _boxleftpos,
          duration: Duration(seconds: 1),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blueAccent,
          ),
        )
      ])),
      floatingActionButton: FloatingActionButton(onPressed: _onTap),
    );
  }
}
