import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:structurepublic/src/pages/login.dart';

import 'generated/l10n.dart';
import 'route_generator.dart';
import 'src/helpers/custom_trace.dart';
import 'src/models/setting.dart';
import 'src/pages/mainView.dart';
import 'src/repository/settings_repository.dart' as settingRepo;
import 'src/repository/user_repository.dart' as userRepo;
import 'src/helpers/app_config.dart' as config;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("configurations");
  print(CustomTrace(StackTrace.current, message: "base_url: ${GlobalConfiguration().getString('base_url')}"));
 await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    settingRepo.initSettings();
     super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingRepo.setting,
        builder: (context, Setting _setting, _) {
          return  MaterialApp(
              navigatorKey: settingRepo.navigatorKey,
              title: "",
              home:Loginmain(),
              //MainStateWidget(),
              // initialRoute: '/MainStateWidget',
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
              locale: _setting.mobileLanguage.value,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: _setting.brightness.value == Brightness.light
                  ? ThemeData(
                fontFamily: 'Poppins',
                primaryColor: Colors.white,
                floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
                brightness: Brightness.light,
                accentColor: config.ColorsApp().mainColor(1),
                dividerColor: config.ColorsApp().secondColor(0.1),
                focusColor: config.ColorsApp().secondColor(1),
                hintColor: config.ColorsApp().secondColor(1),

                textTheme: TextTheme(
                  headline5: TextStyle(fontSize: 20.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.ColorsApp().secondColor(1), height: 1.35),
                  subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.ColorsApp().secondColor(1), height: 1.35),
                  headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.ColorsApp().mainColor(1), height: 1.35),
                  bodyText2: TextStyle(fontSize: 12.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  bodyText1: TextStyle(fontSize: 14.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  caption: TextStyle(fontSize: 12.0, color: config.ColorsApp().secondColor(1), height: 1.35),

                  headline1: TextStyle(fontSize: 60.0, color: Colors.white),
                  headline2: TextStyle(fontSize: 35, color: Colors.white),
                  headline3: TextStyle(fontSize: 20, color: Colors.white),

                  //                    body2: TextStyle(fontSize: 12, color: Colors.white),
//                    subhead: TextStyle(fontSize: 15, color: Colors.black)
                ),
              )
                  : ThemeData(
                fontFamily: 'Poppins',
                primaryColor: Color(0xFF252525),
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Color(0xFF2C2C2C),
                accentColor: config.ColorsApp().mainDarkColor(1),
                dividerColor: config.ColorsApp().secondColor(0.1),
                hintColor: config.ColorsApp().secondColor(1),
                focusColor: config.ColorsApp().secondColor(1),
                textTheme: TextTheme(
                  headline5: TextStyle(fontSize: 20.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.ColorsApp().secondColor(1), height: 1.35),
                  subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.ColorsApp().secondColor(1), height: 1.35),
                  headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.ColorsApp().mainColor(1), height: 1.35),
                  bodyText2: TextStyle(fontSize: 12.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  bodyText1: TextStyle(fontSize: 14.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  caption: TextStyle(fontSize: 12.0, color: config.ColorsApp().secondColor(1), height: 1.35),

                  headline1: TextStyle(fontSize: 60.0, color: Colors.white),
                  headline2: TextStyle(fontSize: 35, color: Colors.white),
                  headline3: TextStyle(fontSize: 20, color: Colors.white),
//                    headline: TextStyle(fontSize: 60.0, color: Colors.white),
//                    title: TextStyle(fontSize: 35, color: Colors.white),
//                    subtitle: TextStyle(fontSize: 20, color: Colors.white),
//                    body1: TextStyle(fontSize: 15, color: Colors.white),
//                    body2: TextStyle(fontSize: 12, color: Colors.white),
//                    subhead: TextStyle(fontSize: 15, color: Colors.black)
                ),
              ));

        });
  }
}
