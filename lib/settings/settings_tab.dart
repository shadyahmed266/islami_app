import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:islami_app1/settings/language_bottom_sheet.dart';
import 'package:islami_app1/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showLangugeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: MyTheme.primaryLight,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage == 'en' ?
                  AppLocalizations.of(context)!.english:
                  AppLocalizations.of(context)!.arabic,

                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,),
                  Icon(Icons.arrow_drop_down, size: 30),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: MyTheme.primaryLight,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDarkMode() ?
                  AppLocalizations.of(context)!.dark:
                  AppLocalizations.of(context)!.light,

                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,),
                  Icon(Icons.arrow_drop_down, size: 30),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  void showLangugeBottomSheet() {
    showModalBottomSheet(

      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) =>ThemeBottomSheet()  );
  }


}
