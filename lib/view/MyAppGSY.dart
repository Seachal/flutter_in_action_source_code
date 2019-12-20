

import 'package:camera/camera.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_in_action/routes/index.dart';
import 'package:flutter_in_action/widgets/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_in_action/i10n/localization_intl.dart';
import 'package:dio/dio.dart';

class MyAppGSY extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GSY Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GSY Flutter Demo'),
      routes: routers,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
//              sca:点击事件
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(routerName[index]),
                ),
              ),
            );
          },
          itemCount: routers.length,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

const routerName = [
  "路由传值",
  "文本、字体样式",
];

Map<String, WidgetBuilder> routers = {
  "widget/controller": (context) {
    return new RouterTestRoute();
  },
// 不能这样写的原因是， the element type" Controllerdemopage'can't be assigned to the map value type Widget Function (Buildcontext
/*   "widget/controller": new ControllerDemoPage();
  ,*/
  "widget/clip": (context) {
    return new TextRoute();
  },
};
