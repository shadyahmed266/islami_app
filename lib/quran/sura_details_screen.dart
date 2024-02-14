import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app1/providers/app_config_provider.dart';
import 'package:islami_app1/quran/item_sura_details.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return SafeArea(
      child: Stack(children: [
        provider.isDarkMode()
            ? Image.asset(
          "assets/images/bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        )
            : Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "${args.name}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                      color:provider.isDarkMode()?
                          MyTheme.primaryDark:
                      MyTheme.whiteColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color:provider.isDarkMode()?
                          MyTheme.yellowColor:
                          MyTheme.primaryLight,
                          thickness: 3,
                        );
                      },
                      itemBuilder: (context, index) {
                        return ItemSuraDetails(
                          name: verses[index],
                          index: index,
                        );
                      },
                      itemCount: verses.length),
                ),
        ),
      ]),
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
