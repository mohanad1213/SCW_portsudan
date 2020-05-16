import 'package:csdmobapp/core/models/about-app-model.dart';
import 'package:csdmobapp/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:csdmobapp/core/api.dart';
import 'dart:async';


import 'do_page.dart';

class ProfilePage extends StatelessWidget {
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
            SingleChildScrollView(child:
                Column(
                  children: <Widget>[
                    AboutApp(),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}




class AboutApp extends StatelessWidget {
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
    padding: EdgeInsets.only(top: 26, left: 22, right: 22, bottom: 200),
    child:AboutAppHome(),
    )
    );
  }




}



class AboutAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Api api=Api();
    return FutureBuilder(

        future: api.FetchAboutApp(),
        builder: (context, AsyncSnapshot<AboutAppModel> snapshot) {
          AboutAppModel h = snapshot.data;



          switch(snapshot.connectionState)
          {
            case ConnectionState.done:

                 return Column(
                     crossAxisAlignment:CrossAxisAlignment.center,
                     children: <Widget>[
                       Text(h.aboutAppTitle),
                       SizedBox(height: 20,),
                       Text(h.aboutAppContent,

                       ),
                     ],
                 );

            break;
            case ConnectionState.active:
              return _loading();
            case ConnectionState.waiting:
              return _loading();

              break;
            case ConnectionState.none:
              return _loading();
              break;
            default:
              return _loading();
          }

        }


    );
  }
}



Widget _loading() {
  return Center(

    child: Container(
      padding:EdgeInsets.only(top: 26, left: 22, right: 22, bottom: 200),
      child: CircularProgressIndicator(),
    ),
  );
}