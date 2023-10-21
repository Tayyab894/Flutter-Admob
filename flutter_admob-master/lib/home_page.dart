import 'package:flutter/material.dart';
import 'package:flutter_admob/admob/screen_banner_ads.dart';
import 'package:flutter_admob/admob/screen_intertitial_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("AdMob Plugin example app"),
      ),
      body: Container(
        child: Column(
          children: [
            GetTextButton(context, "Show Banner Ads", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ScreenBannerAds()));
            }, EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
            GetTextButton(context, "Show Intertitial Ads", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => ScreenIntertitialAds()));
            }, EdgeInsets.symmetric(horizontal: 20, vertical: 20))
          ],
        ),
      ),
    );
  }

  static Widget GetTextButton(context, String text, onTap, edgeinsets) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: edgeinsets,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        alignment: Alignment.center,
        height: 60,
        child: Text(
          text,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
