import 'package:flutter/material.dart';

class ListDemo extends StatelessWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('3ページ目'),
        ),
        body: Center(
            child: Container(
          // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 13),
          height: 100,
          child: Card(
            elevation: 3,
            color: Colors.cyan,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
              child: Row(
                children: [
                  Container(
                    color: Colors.black38,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        '井上研究室',
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        'プログラミング',
                        style: TextStyle(fontSize: 17),
                      ),
                      Row(
                        children: [
                          Text(
                            'オンライン',
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            '場所',
                            style: TextStyle(fontSize: 9),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
