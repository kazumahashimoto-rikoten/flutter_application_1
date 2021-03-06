import 'package:flutter/material.dart';
import 'package:flutter_application_1/next_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListPage(),
    );
  }
}

class Cnt extends StatefulWidget {
  const Cnt({Key? key}) : super(key: key);

  @override
  _CntState createState() => _CntState();
}

class _CntState extends State<Cnt> {
  var cnt = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      width: 200,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text("$cnt"),
          ElevatedButton(
            onPressed: () {
              setState(() {
                cnt += 1;
              });
            },
            child: Text('click here'),
          )
        ],
      ),
    );
  }
}

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var myName = 30001;
    return Scaffold(
      appBar: AppBar(
        title: const Text('First App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("mun=$myName"),
            Text("data"),
            Cnt(),
            Pager(),
          ],
        ),
        // child: Text('リスト一覧画面!!!!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myName += 1;
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatelessWidget {
  const TodoAddPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First App'),
      ),
      body: Center(
        child: TextButton(
          // ボタンをクリックした時の処理
          onPressed: () {
            // "pop"で前の画面に戻る
            Navigator.of(context).pop();
          },
          child: Text('リスト追加画面（クリックで戻る）'),
        ),
      ),
    );
  }
}

class Pager extends StatelessWidget {
  const Pager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('次へ'),
        onPressed: () {
          //ここに押したら反応する
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NextPage(),
              ));
        },
      ),
    );
  }
}
