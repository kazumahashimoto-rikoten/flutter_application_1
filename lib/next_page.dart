import 'package:flutter/material.dart';
import 'package:flutter_application_1/animation_practice.dart';
import 'package:flutter_application_1/logistic_regression.dart';
import 'package:flutter_application_1/list_demo.dart';

import 'decision_tree.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('2つ目のページ'),
            ElevatedButton(
              child: Text('戻る'),
              onPressed: () {
                //ここに押したら反応する
                Navigator.pop(context);
              },
            ),
            Container(
              height: 150,
              width: 200,
              color: Colors.black26,
              child: const Text('data'),
              padding: EdgeInsets.all(30.0),
            ),
            ListView(
              shrinkWrap: true, //ListViewでこれないとColumnの中でリスト使えない
              children: [
                Text('Item 1'),
                Text('Item 2'),
                Text('Item 3'),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Text(index.toString());
                }),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListDemo(),
                    ));
              },
              child: Text('企画一覧'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimationPractice()));
              },
              child: Text('アニメーション'),
            ),
            ElevatedButton(
              onPressed: () {
                hoge();
              },
              child: Text('機械学習'),
            ),
            ElevatedButton(
              onPressed: () {
                decisionTree();
              },
              child: Text('決定木'),
            ),
          ],
        ),
      ),
    );
  }
}
