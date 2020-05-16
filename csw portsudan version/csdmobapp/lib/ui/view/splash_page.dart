import 'dart:async';

import 'package:flutter/material.dart';
import 'package:csdmobapp/ui/constant/constant.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushNamed(mainPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: white,
        /*  gradient: LinearGradient(
            colors: [deepBlue, midPurple, midPink],
            begin: Alignment(-1.0, -1.0),
            end: Alignment(1.0, 1.0),
          ), */
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(

                    "assets/statelogo.png",
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(

                      "assets/mohlog.png",
                      width: 150,
                    ),
                  ),
                  /* Text(
                    ' SCW  ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1.copyWith(
                          color: txtPink,
                          fontWeight: FontWeight.bold,
                        ),
                  ), */
                ],
              ),
              Text(
                'المشخص الرقمي بورتسودان',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline.copyWith(
                  color: deepBlue,
                  height: 1.5,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
