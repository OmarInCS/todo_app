
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/app_theme.dart';
import 'package:todo_app/screens/tabs/list_tab.dart';
import 'package:todo_app/screens/tabs/settings_tab.dart';
import 'package:todo_app/screens/widgets/add_task_modal.dart';
import 'package:todo_app/screens/widgets/custom_fab.dart';
import 'package:todo_app/screens/widgets/day_card.dart';
import 'package:todo_app/screens/widgets/days_list.dart';

import '../providers/settings_provider.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;


  static const List<Widget> _widgetOptions = <Widget>[
    ListTab(),
    SettingsTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mainScreenTitle),
        bottom: PreferredSize(
          child: _selectedIndex == 0
              ? Container(
                height: 50,
                clipBehavior: Clip.none,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 80,
                          child: DaysList()
                      ),
                    )
                  ],
                ),
              )
              : Container(),
          preferredSize: Size.fromHeight(50),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icon_list.png")),
            label: "List"
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icon_settings.png",)),
            label: "Settings"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFAB(),
    );
  }
}




