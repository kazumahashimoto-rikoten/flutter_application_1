import 'package:flutter/material.dart';

class ListDemo extends StatelessWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('3ページ目'),
        ),
        body: Center(
            child: Container(
          height: 100,
          child: Card(
            elevation: 3,
            color: Colors.cyan,
            child: Container(
              padding: EdgeInsets.only(left: 13, top: 15, right: 13),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '井上研究室',
                        style: TextStyle(fontSize: 11),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        height: 45,
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'プログラミング',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
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
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
