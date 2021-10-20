import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pet/pages/page_main.dart';
import 'package:provider/provider.dart';
import './stateManage.dart';
import './pages/search/search_index.dart';
import './pages/chat/page_chat.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: Store()),
    ],
    child: MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CH'),
      ],
      //注册路由表
      routes:{
        "/searchPage":(context) => SearchIndex(),
        "/chat":(context) => PageChat(),
      } ,
      theme: new ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      title: 'Flutter Tutorial',
      home: new MyApp(),
    ),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Store(), child: new PageMain());
  }
}
