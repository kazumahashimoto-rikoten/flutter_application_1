import 'package:flutter/material.dart';

class PjDetail extends StatelessWidget {
  const PjDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('井上まこと研究室'),
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            height: 100,
            color: Colors.black38,
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(color: Colors.black, width: 3))),
            child: Column(
              children: [Text('ビジュアルで学ぶプログラミング'), Text('ビジュアルで学ぶプログラミング')],
            ),
          ),
          Container(
            child: Column(
              children: [Text('井上研究室'), Text('場所')],
            ),
          ),
          ColoredBox(
            color: Colors.black38,
            child: SizedBox(
              width: 200,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
