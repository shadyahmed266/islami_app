import 'package:flutter/material.dart';

import '../my_theme.dart';

class RadioTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150),
        Center(child: Image.asset("assets/images/radio_image.png")),


        SizedBox(height: 30),

        Text(
          "إذاعة القرآن الكريم",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 50),

        Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/icon_pause.png"),
        ],)


      ],
    );

  }



}