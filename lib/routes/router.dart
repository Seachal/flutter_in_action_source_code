import 'package:flutter/material.dart';
import '../widgets/index.dart';

///  async
// await
class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("打开提示页"),
        onPressed: () async {
//          await 后面是一个Future，表示等待该异步任务完成，异步完成后才会往下走；await必须出现在 async 函数内部。
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TipRoute(
                  text: "我是提示xxxx，我来自上一个页面",
                );
              },
            ),
          );
          print("路由返回值: $result");
        },
      ),
    );
  }
}

// 这个是路由到的新的页面
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
//
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}



//  https://juejin.im/post/5ad33bcaf265da238d512840
////HTTP的get请求返回值为Future<String>类型，即其返回值未来是一个String类型的值
//getData() async {
//  //async关键字声明该函数内部有代码需要延迟执行
//  return await http.get(Uri.encodeFull(url),
//      headers: {"Accept": "application/json"}); //await关键字声明运算为延迟执行，然后return运算结果
//}
