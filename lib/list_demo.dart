import 'package:flutter/material.dart';

class ListDemo extends StatelessWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3ページ目'),
      ),
      body: Container(
        color: Colors.lime,
      ),
    );
  }
}
