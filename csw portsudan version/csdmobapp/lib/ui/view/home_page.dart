import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:csdmobapp/ui/constant/constant.dart';
import 'package:csdmobapp/ui/widgets/app_widgets.dart';
import 'package:csdmobapp/ui/widgets/home_body.dart';
import 'package:csdmobapp/core/api.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,

      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            AppWidget(
              image: "assets/images/do.png",
              tagline: 'Portsudan C19\nSelf Diagnosis ',
              imageTop: 50,
            ),
            SingleChildScrollView(
              child: HomeBody(),
            )
          ],
        ),
      ),
    );
  }
}


