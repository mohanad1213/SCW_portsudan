import 'package:csdmobapp/core/models/about-app-model.dart';
import 'package:csdmobapp/core/models/home-model.dart';
import 'package:csdmobapp/core/models/news-model.dart';
import 'package:csdmobapp/core/models/post-model.dart';
import 'package:csdmobapp/ui/constant/constant.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'models/news-list-model.dart';

class Api {
  // static String mainUrl = "http://mohanad1213-003-site6.htempurl.com/api";
  static String mainUrl = "http://mohanad1213-003-site6.htempurl.com/api";
  var _HomeUrl = '$mainUrl/home';
  var _NewsUrl = '$mainUrl/news';
  var _AboutAppUrl = '$mainUrl/AboutApp';

  Future<NewsListModel> FetchNews() async {
    NewsListModel NewsList = NewsListModel();
    try {
      print("Call:" + _NewsUrl);
      var response = await http.get(_NewsUrl);

      //TODO: Delete this log
      print("Status Code:" + response.statusCode.toString());
      print("Body:" + response.body);

      var model = jsonDecode(response.body);
      //print(model);
      NewsList.NewsList = List<NewsModel>();
      for (var item in model) {
        NewsModel m = NewsModel();
        m.Id = item["id"];
        m.Title = item["title"];

        m.Content = item["content"];
        m.CreateDate = item["createDate"];

       // m.FormatedCreateDate = item["FormatedCreateDate"];
       // m.ViewCounter = item["ViewCounter"];

        NewsList.NewsList.add(m);
      }

      //print(NewsList.NewsList);
      return NewsList;
    } catch (ex) {
      NewsListModel NewsList = NewsListModel();
      NewsList.NewsList=List<NewsModel>();
      print("Error" + ex.toString());
      return NewsList;
    }
  }

  Future<NewsModel> FetchOneNews(int id) async {
    try {
      print("Call:" + _NewsUrl + "/" + id.toString());
      var response = await http.get(_NewsUrl);

      //TODO: Delete this log
      // print("Status Code:"+response.statusCode.toString());
      // print("Body:"+response.body);

      var model = jsonDecode(response.body);
      NewsModel m = NewsModel();
      m.Id = model["id"];
      m.Title = model["title"];

      m.Content = model["content"];
      m.CreateDate = model["createDate"];

      m.FormatedCreateDate = model["FormatedCreateDate"];
      m.ViewCounter = model["ViewCounter"];

      return m;
    } catch (ex) {
      NewsModel m = NewsModel();
      return m;
    }
  }

  Future<AboutAppModel> FetchAboutApp() async {
    try {
      print("Call:" + _AboutAppUrl);
      var response = await http.get(_AboutAppUrl);

    //  print(response.body);

      var model = jsonDecode(response.body);
      AboutAppModel m = AboutAppModel();
      m.aboutAppTitle = model["aboutAppTitle"];
      m.aboutAppContent = model["aboutAppContent"];

      return m;
    } catch (ex) {
      AboutAppModel m = AboutAppModel();
      m.aboutAppTitle = "الرجاء التأكد من الاتصال بالانترنت";
      m.aboutAppContent = " ";
      return m;
    }

    /*List<HomeModel> test;

      HomeModel x;
      x.updateTitle = "اختبار";
      test.add(x); */
  }

  Future<HomeModel> FetchHome() async {
    try {
      print("Call:" + _HomeUrl);
      var response = await http.get(_HomeUrl);

      //TODO: Delete this log
      // print("Status Code:"+response.statusCode.toString());
      // print("Body:"+response.body);

      var model = jsonDecode(response.body);
      HomeModel m = HomeModel();
      m.updateTitle = model["updateTitle"];
      m.updated = model["updated"];

      m.mapTitle = model["mapTitle"];
      m.mapDesc = model["mapDesc"];

      m.newsTitle = model["newsTitle"];
      m.newsDesc = model["newsDesc"];

      m.cases = model["cases"];
      m.todayCases = model["todayCases"];
      m.deaths = model["deaths"];
      m.recovered = model["recovered"];
      m.active = model["active"];
      m.critical = model["critical"];

      m.contactTitle = model["contactTitle"];
      m.contactDesc = model["contactDesc"];

      m.contactNumber1Title = model["contactNumber1Title"];
      m.contactNumber1 = model["contactNumber1"];
      m.contactNumber2Title = model["contactNumber2Title"];
      m.contactNumber2 = model["contactNumber2"];
      m.contactNumber3Title = model["contactNumber3Title"];
      m.contactNumber3 = model["contactNumber3"];


      m.postTitle = model["postTitle"];
      m.postDesc = model["postDesc"];


     /// print( JsonDecoder(model["postList"]));

      m.postlist=List<PostModel>();





      for (var postItem in model["postList"]) {
        m.postlist.add(PostModel(
          postItem["id"],
          postItem["title"],
          postItem["content"],
          postItem["order"],
          postItem["createDate"],
        ));

      }

      return m;
    } catch (ex) {
      HomeModel m=HomeModel();
      return m;
    }

    /*List<HomeModel> test;

      HomeModel x;
      x.updateTitle = "اختبار";
      test.add(x); */
  }
}
