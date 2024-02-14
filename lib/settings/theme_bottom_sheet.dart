import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:islami_app1/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
 late AppConfigProvider provider ;
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
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDarkMode() ?
              getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.dark),),
          const SizedBox(height: 15),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light?
                   getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.light)),


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
        style:provider.isDarkMode() ?
        Theme.of(context).textTheme.titleSmall?.copyWith(
          color: MyTheme.blackColor
        )
            :
        Theme.of(context).textTheme.titleSmall,
        );
  }
}
