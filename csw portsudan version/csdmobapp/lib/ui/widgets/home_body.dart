import 'package:csdmobapp/core/models/home-model.dart';
import 'package:csdmobapp/core/models/post-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:csdmobapp/ui/constant/constant.dart';
import 'package:csdmobapp/ui/widgets/news_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:csdmobapp/core/api.dart';

import 'card_widget.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double initialPercentage = 0.65;
  TextEditingController regionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    /* regionController.text = 'المنطقة';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<IndonesiaBloc>(context).add(LoadDataIndonesiaEvent());
      BlocProvider.of<DuniaBloc>(context).add(LoadDuniaEvent());
    }); */
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Api api = Api();
    return FutureBuilder(
        future: api.FetchHome(),
        builder: (context, AsyncSnapshot<HomeModel> snapshot) {

            switch (snapshot.connectionState) {
              case ConnectionState.done:
                HomeModel h = snapshot.data;
                if(h.updateTitle == null) {
                   return Padding(
                      padding: EdgeInsets.only(top: 234),
                      child: Container(

                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: Color(0xFFFEFEFE)),
                          padding: EdgeInsets.only(
                              top: 30, left: 22, right: 22, bottom: 300),
                        child: Column(
                          children: <Widget>[
                            Text( "الرجاء التاكد من الاتصال بالانترنت"),

                            Icon(
                            Icons.error_outline,
                              size: 90,
                            ),
                          ],
                        ),
                      ));
                }
                else
                  {
                     return Padding(
                         padding: EdgeInsets.only(top: 234),
                         child: Container(
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(36),
                               color: Color(0xFFFEFEFE)),
                           padding: EdgeInsets.only(
                               top: 5, left: 22, right: 22, bottom: 100),
                           child: Column(children: <Widget>[
                             SizedBox(height: spacing(2)),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.stretch,
                               //TODO first thing update title and statsitic uncomment it
                               children: <Widget>[

                                 //************************************************************ Posts Section
                                 SizedBox(height: spacing(3)),
                                 Text(
                                   //"الخريطة التفاعلية ( اخر تحديث منذ " + " 3 ساعات " +")",
                                   h.postTitle.toString(),
                                   style: TextStyle(
                                     fontFamily: 'Poppins',
                                     color: Colors.black87,
                                     fontWeight: FontWeight.w600,
                                     fontSize: 16,
                                   ),
                                 ),
                                 Text(
                                   h.postDesc.toString(),
                                   style: TextStyle(
                                     fontFamily: 'Poppins',
                                     color: Colors.black45,
                                     fontWeight: FontWeight.w600,
                                     fontSize: 16,
                                   ),
                                 ),

                                 WidgetPageList(h.postlist),
                               ],
                             ),

                             ///// *********************************************************Help

                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 SizedBox(height: spacing(3)),
                                 Text(
                                   h.contactTitle,
                                   style: TextStyle(
                                     fontFamily: 'Poppins',
                                     fontWeight: FontWeight.w700,
                                     fontSize: 16,
                                     color: Color(0XFF353535),
                                   ),
                                 ),
                                 Container(
                                   height: 250,
                                   padding: EdgeInsets.symmetric(
                                       horizontal: 10, vertical: 20),
                                   child: Container(
                                     child: Stack(
                                       children: <Widget>[
                                         Positioned(
                                           top: 0,
                                           right: 0,
                                           child: Text(
                                             h.contactDesc,
                                             style: TextStyle(
                                               fontSize: 12,
                                             ),
                                           ),
                                         ),
                                         Positioned(
                                           top: 30,
                                           child: RaisedButton(
                                             onPressed: () {
                                               _launchURL(h.contactNumber1);
                                             },
                                             color: Color(0XFFEE0000),
                                             child: Text(
                                               h.contactNumber1Title,
                                               style: TextStyle(
                                                 color: Colors.white,
                                               ),
                                             ),
                                             shape: RoundedRectangleBorder(
                                               borderRadius:
                                               BorderRadius.circular(26),
                                             ),
                                           ),
                                         ),
                                         Positioned(
                                           top: 90,
                                           child: RaisedButton(
                                             onPressed: () {
                                               _launchURL(h.contactNumber2);
                                             },
                                             color: Color(0XFFEE0000),
                                             child: Text(
                                               h.contactNumber2Title,
                                               style: TextStyle(
                                                 color: Colors.white,
                                               ),
                                             ),
                                             shape: RoundedRectangleBorder(
                                               borderRadius:
                                               BorderRadius.circular(26),
                                             ),
                                           ),
                                         ),
                                         Positioned(
                                           top: 150,
                                           child: RaisedButton(
                                             onPressed: () {
                                               _launchURL(h.contactNumber3);
                                             },
                                             color: Color(0XFFEE0000),
                                             child: Text(
                                               h.contactNumber3Title,
                                               style: TextStyle(
                                                 color: Colors.white,
                                               ),
                                             ),
                                             shape: RoundedRectangleBorder(
                                               borderRadius:
                                               BorderRadius.circular(26),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ]),
                         ));
                  }



                break;

              case ConnectionState.active:
              case ConnectionState.waiting:
                print("loading must apear");
                return this._loading();
                break;
              case ConnectionState.none:
                return this._loading();
                break;
              default:
                print("loading must apear");
                return this._loading();
            }
          });

  }

  Widget _loading() {
    return Padding(
      padding: EdgeInsets.only(top: 234),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36), color: Color(0xFFFEFEFE)),
        padding: EdgeInsets.only(top: 26, left: 22, right: 22, bottom: 300),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  /* return Padding(
      padding: EdgeInsets.only(top: 234),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36), color: Color(0xFFFEFEFE)),
        padding: EdgeInsets.only(top: 26, left: 22, right: 22, bottom: 100),
        child: Column(
          children: <Widget>[
            // SizedBox(height: spacing(2)),

            PetaPersebaran(), // Counters and Map
            SizedBox(height: spacing(2)),

            //  NewsList(),

           // UpdateKasus(), // News
            //   _buildRegionInput(),


            SizedBox(height: spacing(2)),
            buildHeader(title: "نصائح وارشادات عامه", desc: ),
            PageWidget(),

            HelpCenterWidget(),

            /*  SizedBox(height: spacing(2)),
            CardKasusIndonesia(), */
            // SizedBox(height: spacing(2)),
            //  BeritaTerbaru(),
            //   SizedBox(height: spacing(2)),
            //  ListBerita(),
            // SizedBox(height: spacing(2)),
            //  BeritaDunia(),
            //   SizedBox(height: spacing(3)),
            //  CardKasusDunia(),
          ],
        ),
      ),
    );
*/

  Widget WidgetPageList(List<PostModel> postList) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < postList.length; i++) {
      list.add( CardWidget(

        label: postList[i].Title,
        id: postList[i].Id,
        content: postList[i].Content,

      ));
    }
    return new Container(
        child: Column(
      children: list,
    ));
  }

  Widget _buildRegionInput() {
    return Container(
      height: 50.0,
      child: TextField(
        controller: regionController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          hintText: 'بداية البحث',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Color(0xffE1E1E1), width: 0.8),
          ),
        ),
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class PageWidget extends StatefulWidget {
  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {}
}

class HelpCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'الاتصال بنا',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0XFF353535),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 178,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  'إذا كنت تشعر  الاعراض الرجاء الاتصال فوراً',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Positioned(
                top: 25,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '9090' + " او " + "221",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    /* Text(
                      'EXT 9',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ) */
                  ],
                ),
              ),
              Positioned(
                top: 90,
                child: RaisedButton(
                  onPressed: () {
                    _launchURL("9090");
                  },
                  color: Color(0XFFEE0000),
                  child: Text(
                    'الاتصال المباشر ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

_launchURL(String number) async {

  String url = "tel://" + number;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/*class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(spacing(2)),
        child: Column(
          children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
            return NewsList();
          }).toList(),
        ));}
}
*/

// important class ###################

class PetaPersebaran extends StatelessWidget {
  const PetaPersebaran({
    Key key,
  }) : super(key: key);

  Widget _loading() {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Api api = Api();
    return FutureBuilder(
      future: api.FetchHome(),
      builder: (context, AsyncSnapshot<HomeModel> snapshot) {
        HomeModel h = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  h.updateTitle.toString(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                /* Text(
            ' اليوم: ' + "الخميس 23\\4\\2020" + "-" + "17:23:23" + "(GMT+2)",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black45,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ), */
                SizedBox(height: spacing(1)),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 8,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '+' +
                                            snapshot.data.todayCases.toString(),
                                        style:
                                            theme.textTheme.display1.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          height: 1.0,
                                        ),
                                      ),
                                      Text(
                                        'الحالات الجديدة',
                                        style: theme.textTheme.body1.copyWith(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data.recovered.toString(),
                                        style:
                                            theme.textTheme.display1.copyWith(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          height: 1.0,
                                        ),
                                      ),
                                      Text(
                                        'الشفاء',
                                        style: theme.textTheme.body1.copyWith(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data.cases.toString(),
                                        style:
                                            theme.textTheme.display1.copyWith(
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                          height: 1.0,
                                        ),
                                      ),
                                      Text(
                                        'الكل',
                                        style: theme.textTheme.body1.copyWith(
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: spacing(2)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        h.active.toString(),
                                        style:
                                            theme.textTheme.display1.copyWith(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          height: 1.0,
                                        ),
                                      ),
                                      Text(
                                        'الحالات النشطة',
                                        style: theme.textTheme.body1.copyWith(
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        h.critical.toString(),
                                        style:
                                            theme.textTheme.display1.copyWith(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                          height: 1.0,
                                        ),
                                      ),
                                      Text(
                                        'الحالات الحرجة',
                                        style: theme.textTheme.body1.copyWith(
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        h.deaths.toString(),
                                        style:
                                            theme.textTheme.display1.copyWith(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          height: 1.0,
                                        ),
                                      ),
                                      Text(
                                        'الوفيات',
                                        style: theme.textTheme.body1.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: spacing(3)),
                Text(
                  //"الخريطة التفاعلية ( اخر تحديث منذ " + " 3 ساعات " +")",
                  "الخريطة التفاعلية (قريباً)",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "خريطة توضح كل الاماكن التي ",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "قريباً",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 20.0);
                  },
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset('assets/images/Bitmap.png'),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
            break;
          case ConnectionState.active:
          case ConnectionState.waiting:
            print("loading must apear");
            return this._loading();
            break;
          case ConnectionState.none:
            print("No Data");
            break;
          default:
            print("loading must apear");
            return this._loading();
        }
      },
    );
  }
}

class CardBerita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 238,
        child: Column(
          children: <Widget>[
            Container(
              height: 134,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(spacing(2))),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.camera,
                size: 80,
              ),
            ),
            SizedBox(
              height: spacing(1),
            ),
            Container(
              width: 136,
              child: Text(
                'Video wanita sakit paru-paru BUKAN COVID-19',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeritaDunia extends StatelessWidget {
  const BeritaDunia({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Data COVID-19 Dunia",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: 16,
              ),
            ),
            SizedBox(height: spacing(0.5)),
            Text(
              "Data akumulasi dari awal muncul",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: 11,
              ),
            ),
          ],
        ),
        OutlineButton(
          onPressed: () {},
          child: Text("ما عارف شنو"),
          color: deepBlue,
          highlightedBorderColor: deepBlue,
        )
      ],
    );
  }
}

class ListBerita extends StatelessWidget {
  const ListBerita({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 253,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return CardBerita();
        },
      ),
    );
  }
}

class BeritaTerbaru extends StatelessWidget {
  const BeritaTerbaru({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildHeader(
        title: 'الاخبار',
        desc: 'Diperbaharui 1 jam yang lalu',
        onPressedAction: () {
          Navigator.pushNamed(context, '/news');
        });
  }
}


class UpdateKasus extends StatelessWidget {
  const UpdateKasus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildHeader(
      title: " الاخبار",
      desc: " تفاصل الاخبار ",
      onPressedAction: () {},
    );
  }
}

Container buildIconHeader({icon, color}) {
  return Container(
    width: 26,
    height: 26,
    decoration: BoxDecoration(
      color: Color.alphaBlend(Colors.white70, color),
      borderRadius: BorderRadius.circular(26.0),
    ),
    child: Center(
      child: Icon(
        icon,
        size: 24.0,
        color: color,
      ),
    ),
  );
}

Text buildNumberCount({String value, Color color}) {
  return Text(
    value,
    style: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget buildHeader({String title, String desc = '', Function onPressedAction}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontSize: 16,
            ),
          ),
          SizedBox(height: spacing(0.5)),
          Text(
            desc,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Poppins",
              fontSize: 12,
            ),
          ),
        ],
      ),
      /* onPressedAction == null
          ? Container()
          : OutlineButton(
              onPressed: onPressedAction,
              child: Text("Lihat Detail"),
              color: deepBlue,
              textColor: Colors.purple,
              highlightedBorderColor: deepBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ), */
    ],
  );
}

