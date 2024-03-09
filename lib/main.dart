import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/selected_day_provider.dart';
import 'package:todo_app/providers/settings_provider.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/screens/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>(create: (context) => SettingsProvider(),),
          ChangeNotifierProvider<SelectedDayProvider>(create: (context) => SelectedDayProvider(),),
          ChangeNotifierProxyProvider<SelectedDayProvider, TasksProvider>(
            create: (context) => TasksProvider(),
            update: (context, value, previous) => TasksProvider(value),
          ),
        ],
        child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<SettingsProvider>(context).currentTheme,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Provider.of<SettingsProvider>(context).currentLocale,
      home: MainScreen(),
    );
  }
}
