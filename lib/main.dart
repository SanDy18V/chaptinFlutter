import 'package:chat/controllers/google_signin.dart';
import 'package:chat/screens/Login%20Screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Firebasecontroller());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
   // set the status bar brightness
    systemNavigationBarColor: Colors.white70, // set the navigation bar color
    systemNavigationBarIconBrightness: Brightness.light, // set the navigation bar icon color
  ));

  runApp(const MyApp());
}
const _brandColor = Colors.white70;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blueGrey,
  );

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme = lightDynamic?.harmonized() ??
            ColorScheme.fromSeed(
              seedColor: _brandColor,
            );
        ColorScheme darkColorScheme = darkDynamic?.harmonized() ??
            ColorScheme.fromSeed(
              seedColor: _brandColor,
              brightness: Brightness.dark,
            );
        return 
             GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Chat Box',
               home: const LoginScreen(),
               builder: EasyLoading.init(),

              theme: _themeData(lightColorScheme),
              darkTheme: _themeData(darkColorScheme),
              themeMode: ThemeMode.system,
             
            );
      },
    );
  }
  ThemeData _themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
    );
  }
}

