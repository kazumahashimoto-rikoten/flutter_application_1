import 'package:flutter/material.dart';

class AnimationPractice extends StatefulWidget {
  const AnimationPractice({Key? key}) : super(key: key);

  @override
  _AnimationPracticeState createState() => _AnimationPracticeState();
}

class _AnimationPracticeState extends State<AnimationPractice> {
  bool _isFirstChanged = false;
  bool _isSecondChanged = false;

  int hollinedurtime = 1;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    void _onTap() {
      setState(() {
        _isFirstChanged = true;
      });
    }

    return Scaffold(
      body: Center(
          child: Stack(alignment: AlignmentDirectional.center, children: [
        // 横ライン
        AnimatedPositioned(
          //横ラインの位置変更
          top: _isSecondChanged ? -10 : _screenSize.height * 0.6,
          right: _isFirstChanged ? _screenSize.width * 0.5 : 100,
          duration: Duration(seconds: hollinedurtime),
          onEnd: () {
            hollinedurtime = 2;
            setState(() {
              _isSecondChanged = true;
            });
          },
          child: AnimatedSize(
            //横ラインの太さ変更
            // vsync: this,
            duration: Duration(seconds: 1),
            child: Container(
              width: _isFirstChanged ? _screenSize.width * 0.5 : 50,
              height: 10,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        // 折り返し縦ライン
        AnimatedPositioned(
          top: _isSecondChanged ? -10 : _screenSize.height * 0.6,
          right: _screenSize.width * 0.5,
          duration: Duration(seconds: hollinedurtime),
          child: AnimatedSize(
            duration: Duration(seconds: 2),
            child: Container(
              width: 10,
              height: _isSecondChanged ? _screenSize.height * 0.4 : 0,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        // 最初のボックス
        AnimatedPositioned(
          top: _screenSize.height * 0.3,
          right: _isFirstChanged
              ? _screenSize.width
              : (_screenSize.width - 250) / 2,
          duration: Duration(seconds: 1),
          child: Container(
            alignment: Alignment.center,
            width: 250,
            height: 300,
            child: Column(
              children: [
                const Card(
                  elevation: 3,
                  margin: EdgeInsets.only(top: 4, bottom: 6, left: 4, right: 4),
                  child: SizedBox(
                    width: 250,
                    height: 190,
                    child: Text('アニメーション前'),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4),
                      width: 100,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.redAccent,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: const BorderSide(
                              color: Colors.redAccent,
                              width: 3,
                            )),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: const EdgeInsets.all(4),
                      width: 100,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: (_onTap),
                        child: const Text(
                          'No',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.blueAccent,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: const BorderSide(
                              color: Colors.blueAccent,
                              width: 3,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // 出てくるボックス
        AnimatedPositioned(
          top: _isSecondChanged ? _screenSize.height * 0.3 : _screenSize.height,
          // right: 100,
          duration: Duration(seconds: 2),
          child: Container(
            alignment: Alignment.center,
            width: 250,
            height: 300,
            color: Colors.blueAccent,
            child: Text('アニメーション後'),
          ),
        ),
      ])),
      floatingActionButton: FloatingActionButton(onPressed: _onTap),
    );
  }
}
