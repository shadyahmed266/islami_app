import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app1/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}
late AppConfigProvider provider ;
class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  build(BuildContext context) {
     provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.appLanguage == 'en' ?
              getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.english),),
          const SizedBox(height: 15),
          InkWell(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: provider.appLanguage == 'ar' ?
                   getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic)),


        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      children: [
        Text(text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                )),
        Icon(
          Icons.check,
          size: 35,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(text,
        style: provider.isDarkMode() ?
    Theme.of(context).textTheme.titleSmall?.copyWith(
        color: MyTheme.blackColor
    )
        :
    Theme.of(context).textTheme.titleSmall,
        );
  }
}
