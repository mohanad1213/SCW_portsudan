import 'package:flutter/material.dart';

class Consts {
  Consts._();

  static const double padding = 10.0;
  static const double avatarRadius = 0.0;
}


class CustomDialog extends StatelessWidget {



  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(

      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context,title,description),
    );
  }
}

dialogContent(BuildContext context,String title,String content) {
  return Stack(
    children: <Widget>[
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Align(

                alignment: Alignment.topRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Icon(
                    Icons.close
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w900,

                ),
              ),
              SizedBox(height: 16.0),


                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),

              SizedBox(height: 24.0),

            ],
          ),
        ),
      ),
      //...top circlular image part,
    ],
  );
}