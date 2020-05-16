/*
itacov-flutter - news
created by: stefensuhat at 06 Apr 2020 20.42
*/

import 'package:csdmobapp/ui/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:csdmobapp/ui/constant/constant.dart';
import 'package:csdmobapp/ui/widgets/news_list.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.purple, //change your color here
        ),
        elevation: 0.0,
        title: const Text('Daftar Berita'),
        textTheme: TextTheme(
          headline: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body:
      Column(
        children: <Widget>[
          buildHeader(title: "نصائح وارشادات عامه", desc: " الرجاء الاطلاع علي كل النصائح والارشادات لتجنب الاصابة بالمرض "),
          Container(
              padding: EdgeInsets.all(spacing(2)),
              child: NewsList(),
          )],
      )

    );
  }
}
