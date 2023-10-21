import 'package:flutter/material.dart';
import 'package:flutter_admob/admob/admob_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ScreenBannerAds extends StatefulWidget {
  const ScreenBannerAds({Key? key}) : super(key: key);

  @override
  State<ScreenBannerAds> createState() => _ScreenBannerAdsState();
}

class _ScreenBannerAdsState extends State<ScreenBannerAds> {
  late BannerAd _bannerAd;
  bool isBannerAdLoaded = false;

  void InitBanerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdmobManager.banner_id,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (Ad ad) {
        print("object_object onAdLoaded");
        setState(() {
          isBannerAdLoaded = true;
        });
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print("object_object onAdFailedToLoad");
        print("object_object ${error}");
      }),
    );
    _bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    InitBanerAd();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(title: Text("Banner Ads")),
        body: Container(),
        bottomNavigationBar: isBannerAdLoaded
            ? Container(
          color: Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 5),
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(
                  ad: _bannerAd,
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
