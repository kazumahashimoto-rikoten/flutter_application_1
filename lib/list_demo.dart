import 'package:flutter/material.dart';
import 'package:flutter_application_1/pj_detail.dart';

class ListDemo extends StatelessWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('3ページ目'),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  const Color(0xffe4a972).withOpacity(0.6),
                  const Color(0xff9941d8).withOpacity(0.6),
                ],
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
            ),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListCard(
                  'ビジュアルで学ぶプログラミング${index}',
                  num: 1,
                );
              },
            )));
  }
}

class ListCard extends StatelessWidget {
  // const ListCard({Key? key}) : super(key: key);
  ListCard(this.plan_title, {required this.num});
  final String? plan_title;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      height: 100,
      child: ElevatedButton(
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
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
                  Text(
                    '井上研究室${num}hogehoge',
                    style: const TextStyle(fontSize: 11),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    height: 45,
                    width: 200,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      plan_title ?? 'fffff',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.place,
                        color: Colors.blueAccent,
                        size: 9,
                      ),
                      Text(
                        'オンライン',
                        style: TextStyle(fontSize: 9),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.place,
                        color: Colors.blueAccent,
                        size: 9,
                      ),
                      Text(
                        '場所',
                        style: TextStyle(fontSize: 9),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              const FavButton(),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          elevation: 16,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PjDetail(),
              ));
          // Navigator.pop(context);
        },
      ),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({Key? key}) : super(key: key);

  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isChanged ? Icons.bookmark : Icons.bookmark_border,
      ),
      onPressed: () {
        setState(() {
          isChanged = !isChanged;
        });
      },
    );
  }
}
