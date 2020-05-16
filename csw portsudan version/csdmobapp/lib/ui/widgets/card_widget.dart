import 'package:flutter/material.dart';
import 'package:csdmobapp/ui/constant/constant.dart';

import 'custom-dialog.dart';

class CardWidget extends StatelessWidget {
  //final Icon icon;
  final String label;
  final int id;
  final String content;

  CardWidget({this.label,this.id,this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            title: this.label,
            description:
            content,
            buttonText: "Okay",
          ),
        );
      },

      child: Container(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Color(0XFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.all(spacing(2.5)),
            child: Row(
              children: <Widget>[
               Icon(Icons.question_answer),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(

                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0XFF353535),
                    ),
                  ),
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
