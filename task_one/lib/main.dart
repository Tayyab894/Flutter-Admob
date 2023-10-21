import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task_one/screen_banner.dart';
import 'package:task_one/screen_interstitial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "flutter Demo",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ScreenBanner(),
        );
  }
}
