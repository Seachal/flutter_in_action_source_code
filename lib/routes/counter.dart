import 'package:flutter/material.dart';
import 'package:flutter_in_action/Practise/EchoRoute.dart';
import 'package:flutter_in_action/Practise/NewRoute.dart';

/**
 *
 *
 * 现在，我们将整个计数器执行流程串起来：当右下角的floatingActionButton按钮被点击之后，
 * 会调用_incrementCounter方法。在_incrementCounter方法中，首先会自增_counter计数器（状态），
 * 然后setState会通知Flutter框架状态发生变化，接着，Flutter框架会调用build方法以新的状态重新构建UI，
 * 最终显示在设备屏幕上。
 *
 *
 * 为什么要将build方法放在State中，而不是放在StatefulWidget中？
 *
 *
 */
class CounterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//    应用名称
      title: 'Flutter Demo',
      theme: new ThemeData(
//      蓝色主题
        primarySwatch: Colors.blue,
      ),

// //注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
        "new_page_1": (context) => EchoRoute(),

//        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },

//    应用 home 路由
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // 1 .用于记录按钮点击的总次数

//  2. 设置状态的自增函数。
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("点击即可跳转到新页面"),
              textColor: Colors.blue,
//              onPressed 的类型是一个Function，匿名函数可以赋值给一个函数
              onPressed: () {
/*//                路由到新界面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));*/

//                   路由 2， 通过命名路由，路由到新页面
                Navigator.pushNamed(context, "new_page");
              },
            ),
            FlatButton(
              child: Text("点击即可跳转到新页面"),
              textColor: Colors.blue,
//              onPressed 的类型是一个Function，匿名函数可以赋值给一个函数
              onPressed: () {
//              路由 2， 通过命名路由，路由到新页面,并传参，  之前使用的是默认的路由方式传参
                Navigator.of(context).pushNamed("new_page_1", arguments: "hi");
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
