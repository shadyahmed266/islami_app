import 'package:flutter/material.dart';
import 'package:islami_app1/quran/sura_details_screen.dart';

class ItemSuraDetails extends StatelessWidget {
  String name;
  int index ;

  ItemSuraDetails({super.key, required this.name,required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        '$name {${index+1}}',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
