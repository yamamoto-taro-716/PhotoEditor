import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photo_editor_pro/AppTheme.dart';
import 'package:photo_editor_pro/screens/HomeScreen.dart';
import 'package:photo_editor_pro/screens/SplashScreen.dart';
import 'package:photo_editor_pro/store/AppStore.dart';
import 'package:photo_editor_pro/utils/Constants.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  defaultSpreadRadius = 0.5;
  defaultBlurRadius = 3.0;
  appButtonBackgroundColorGlobal = Colors.white;

  await initialize();

  await Firebase.initializeApp().then((value) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    MobileAds.instance.initialize();
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: mAppName,
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
