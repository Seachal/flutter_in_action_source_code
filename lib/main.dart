import 'dart:async';

import 'package:camera/camera.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_in_action/view/MyApp.dart';
import 'package:flutter_in_action/view/MyAppGSY.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_in_action/i10n/localization_intl.dart';
import 'widgets/index.dart';
import 'routes/index.dart';
import 'package:dio/dio.dart';
import 'http.dart';
//导入后该行代码将会显示为灰色，表示导入的库尚未使用。
import 'common.dart';

//void main() async {
//  cameras = await availableCameras();
//  dio.interceptors..add(CookieManager(CookieJar()))..add(LogInterceptor());
//  runApp(MyApp());
//  PaintingBinding.instance.imageCache.maximumSize = 2000; //最多2000张
//  PaintingBinding.instance.imageCache.maximumSizeBytes = 200 << 20; //200 M
//}

// sca: MyApp 渲染太久，造成白屏? ,  所以改写成这样？
void main() => runApp(MyApp());



//void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  Global.init().then((e) => runApp(MyApp()));
//}
// https://github.com/wendux/flutter_in_action_source_code/issues/3


