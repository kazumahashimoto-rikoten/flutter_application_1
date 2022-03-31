import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
