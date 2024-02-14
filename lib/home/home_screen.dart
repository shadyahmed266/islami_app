import 'package:flutter/material.dart';
import 'package:islami_app1/hadeth/hadeth_tap.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:islami_app1/providers/app_config_provider.dart';
import 'package:islami_app1/quran/quran_tab.dart';
import 'package:islami_app1/radio/radio_tap.dart';
import 'package:islami_app1/sebha/sebha_tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app1/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
                AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: Theme.of(context).primaryColor),
              child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                   items: [
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/quran.png")),
                      label: AppLocalizations.of(context)!.quran,
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(
                          "assets/images/quran-quran-svgrepo-com.png")),
                      label: AppLocalizations.of(context)!.hadeth,
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                      label: AppLocalizations.of(context)!.sebha,
                    ),
                    BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/radio_icon.png")),
                      label: AppLocalizations.of(context)!.radio,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings,
                    ),
                  ]),
            ),
            body: tabs[selectedIndex],
          )
        ],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];
}
