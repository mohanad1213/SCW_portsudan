import 'package:csdmobapp/core/api.dart';
import 'package:csdmobapp/core/models/news-list-model.dart';
import 'package:csdmobapp/core/models/news-model.dart';
import 'package:flutter/material.dart';
import 'package:csdmobapp/ui/constant/constant.dart';
import 'package:csdmobapp/ui/shared/images.dart';
import 'dart:async';

import 'custom-dialog.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Api api = Api();

    return FutureBuilder(
        future: api.FetchNews(),
        builder: (context, AsyncSnapshot<NewsListModel> snapshot) {
          NewsListModel h = NewsListModel();
          h = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return WidgetNewsList(context, h.NewsList);

              break;
            case ConnectionState.active:
              print("Active News Call :)");
              return this._loading();
              break;
            case ConnectionState.waiting:
              print("Waiting News Call: :)");
              return this._loading();
              break;
            case ConnectionState.none:
              print("No Data");
              return this._loading();
              break;
            default:
              print("News ");
              return this._loading();
              break;
          }
        });
  }

  Widget NewsPosts(context, List<NewsModel> NewsList) {

    return Container(
      margin: EdgeInsets.only(bottom: spacing(3)),
      child: Row(
        children: <Widget>[
          ClipRRect(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Image.asset(
                newsDefaultImages,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          SizedBox(width: 16),
          Expanded(
              child: ListView.builder(
                itemBuilder: (context, position) {
                  return _drawNew(context, NewsList[position]);
                },
                itemCount: NewsList.length,
              )),
        ],
      ),
    );
  }

  Widget WidgetNewsList(context, List<NewsModel> newsList) {

    List<Widget> list = new List<Widget>();
    if(newsList.length > 0)
      {

        for (var i = 0; i < newsList.length; i++) {
          list.add(InkWell(
            onTap:() {


              showDialog(
                context: context,
                builder: (BuildContext context) => CustomDialog(
                  title: newsList[i].Title,
                  description:
                  newsList[i].Content,
                  buttonText: "Okay",
                ),
              );

            },
            child: Row(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  child: Container(
                    width: 110,
                    height: 100,
                    color: Colors.grey,
                    child: Image.asset(
                      newsDefaultImages,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                SizedBox(width: 16),
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(

                      child: Text(
                        newsList[i].Title,

                        textAlign: TextAlign.right,
                        overflow: TextOverflow.clip,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      HumanReadabeFormateDate(newsList[i].CreateDate),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.clip,
                      style: Theme
                          .of(context)
                          .textTheme
                          .overline
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ));
        }
      }
    else
      {
        list.add(Text( "لا يوجد اخبار جديدة"));
      }

    return new Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          children: list,
        ));
  }

  Widget _drawNew(context, NewsModel newsModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "test" + newsModel.Title,
          overflow: TextOverflow.clip,
          style: Theme
              .of(context)
              .textTheme
              .subtitle
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '25/4/2020',
          textAlign: TextAlign.right,
          overflow: TextOverflow.clip,
          style: Theme
              .of(context)
              .textTheme
              .overline
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }


  HumanReadabeFormateDate(var dateString) {
    String year=DateTime.parse(dateString).year.toString();
    var month=DateTime.parse(dateString).month.toString();
    var day=DateTime.parse(dateString).day.toString();
   return year+"/"+month+"/"+day;
  }

  Widget _loading() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 26, left: 22, right: 22, bottom: 200),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
