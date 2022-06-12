import 'package:dellyshop/routes.dart';


import 'package:dellyshop/screens/splash/splash_screen.dart';

import 'package:dellyshop/theme.dart';
import 'package:dellyshop/util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import 'delegates/app_localizations_delegate.dart';
import 'injection.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await iniGetIt();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {

     return    ScreenUtilInit(
            designSize: Size(375, 812),
            builder:(context,child)=>
             MaterialApp(
         routes: routes,
                    theme: theme(),
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar', ''),
          ],

          locale: Utils.appLocale,
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocaleLanguage in supportedLocales) {
              print(supportedLocaleLanguage.languageCode);
              if (supportedLocaleLanguage.languageCode == locale!.languageCode &&
                  supportedLocaleLanguage.countryCode == locale.countryCode) {
                return supportedLocaleLanguage;
              }
            }
            // If device not support with locale to get language code then default get first on from the list
            return supportedLocales.first;
          },
          title: 'Mawashi',
          initialRoute: SplashScreen.routeName,
          home: SplashScreen(),
          
           )
      
   ) ;}  
  }

