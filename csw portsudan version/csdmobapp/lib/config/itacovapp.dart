import 'package:flutter/material.dart';
import 'package:csdmobapp/config/routes/routes.dart';
import 'package:csdmobapp/ui/constant/constant.dart';

class ItacovApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: appName,
      debugShowCheckedModeBanner: false,
      initialRoute: splashPage,
      onGenerateRoute: Routes().onGenerateRoute,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Cairo-SemiBold',
        primaryColor: Colors.indigo,
      ),

      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );},
    );
  }
}