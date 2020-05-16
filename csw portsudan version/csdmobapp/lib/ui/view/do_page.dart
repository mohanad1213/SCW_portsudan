import 'dart:ui';

import 'package:csdmobapp/ui/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:csdmobapp/ui/widgets/app_widgets.dart';
import 'package:csdmobapp/ui/widgets/card_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/constant.dart';

class DoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            AppWidget(
              image: "assets/images/do.png",
              tagline: 'Portsudan C19\nSelf Diagnosis ',
              imageTop: 50,
            ),
            SingleChildScrollView(child: BodyWidget()),
          ],
        ),
      ),
    );
  }
}



class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 234),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Color(0xFFFEFEFE),
        ),
        padding: EdgeInsets.only(top: 26, left: 22, right: 22, bottom: 100),
        child: Column(
          children: <Widget>[


                      buildHeader(title: "اخر الاخبار"),
                     NewsList(),
                    ],



            /*PahlawanWidget(),
            SizedBox(
              height: spacing(5),
            ),
           KerumunanWidget(),
            SizedBox(
              height: spacing(5),
            ),*/
            //HoaxPage(),
        ),
      ),
    );
  }


  Widget buildHeader({String title, String desc = ''}) {
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
}




class PahlawanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [deepBlue, midPurple, midPink],
          begin: Alignment(-1.0, -1.0),
          end: Alignment(1.0, 1.0),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bantu Para Pahlawan Kita',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: spacing(0.5),
          ),
          Container(
            width: 166,
            child: Text(
              'Yuk, berdonasi untuk pembelian APD & kebutuhan lain bagi pahlawan kita!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: spacing(1),
          ),
          RaisedButton(
            onPressed: () {},
            color: Color(0XFF8950CA),
            child: Text(
              'Donasi',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          ),
        ],
      ),
    );
  }
}

class KerumunanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Color(0XFFF0CBFF),
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Laporkan kerumunan',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Untuk mendukung program social distancing, Anda dapat melaporkan pada petugas keamanan jika menemukan kerumunan.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0XFF818181),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              color: Color(0XFF8950CA),
              child: Text(
                'Lapor & dapatkan 10 Poin',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class HoaxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Aksi Berantas HOAX COVID-19',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: spacing(1),
        ),
        Text(
          'Berikut adalah beberapa informasi bantahan terhadap HOAX yang beredar yang telah dikonfirmasi oleh Humas POLRI. Bagikan informasi ini dan dapatkan ITACOV-Poin!',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0XFF818181),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          height: 253,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return CardHoax();
            },
          ),
        ),
//        CardHoax(),
      ],
    );
  }
}

class CardHoax extends StatelessWidget {
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
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
            SizedBox(height: spacing(1.5)),
            Container(
              width: 136,
              child: Text(
                'Video wanita sakit paru-paru BUKAN COVID-19',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              '+ 2 Poin',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0XFFDC10AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
