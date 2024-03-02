
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/app_theme.dart';
import 'package:todo_app/screens/tabs/list_tab.dart';
import 'package:todo_app/screens/tabs/settings_tab.dart';
import 'package:todo_app/screens/widgets/day_card.dart';
import 'package:todo_app/screens/widgets/days_list.dart';


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
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundLight,
          borderRadius: BorderRadius.circular(50),
        ),
        child: FloatingActionButton(
          shape: CircleBorder(
            side: BorderSide(
              width: 4,
              color: Colors.white
            )
          ),
          elevation: 0,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              ),
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Add new Task",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 32,),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Enter your task title"
                        ),
                      ),
                      SizedBox(height: 32,),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Enter your task details",
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                      ),
                      SizedBox(height: 32,),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DateFormat("HH:mm").format(DateTime.now()),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        onTap: () async {
                          await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                      ),
                      SizedBox(height: 32,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 20
                          ),
                          padding: EdgeInsets.all(16)
                        ),
                        child: Text(
                          "Add",
                          // style: Theme.of(context).textTheme.titleLarge,
                        ),
                        onPressed: () {

                        },
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: Icon(
            Icons.add
          ),
        ),
      ),
    );
  }
}

