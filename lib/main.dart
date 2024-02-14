import 'package:flutter/material.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:islami_app1/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'hadeth/hadeth_details_screen.dart';
import 'home/home_screen.dart';
import 'package:islami_app1/providers/app_config_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: MyTheme.lightMode,
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
