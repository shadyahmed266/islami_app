import 'package:flutter/material.dart';
import 'package:islami_app1/quran/sura_details_screen.dart';

class ItemHadethDetails extends StatelessWidget {
String content ;
  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
       content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
