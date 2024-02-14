
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app1/hadeth/item_hadeth_details.dart';
import 'package:islami_app1/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';
import 'hadeth_tap.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return SafeArea(
      child: Stack(
        children: [
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
                "${args.title}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                  vertical: MediaQuery.of(context).size.height * 0.05),
              decoration: BoxDecoration(
                  color:provider.isDarkMode()?
                  MyTheme.primaryDark:
                  MyTheme.whiteColor,
                  borderRadius: BorderRadius.circular(25)),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ItemHadethDetails(content: args.content[index]);
                },
                itemCount: args.content.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
