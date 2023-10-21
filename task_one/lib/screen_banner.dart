import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task_one/admob_data/admob_manager.dart';
import 'package:task_one/screen_interstitial.dart';
import 'package:task_one/screen_interstitial_rewarded.dart';
import 'package:task_one/screen_open.dart';

class ScreenBanner extends StatefulWidget {
  @override
  State<ScreenBanner> createState() => _ScreenBannerState();
}

class _ScreenBannerState extends State<ScreenBanner> {
  late BannerAd _bannerAd;
  bool isBannerAdLoaded = false;
  double height_banner = 50;

  initBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdmobManager.banner_id,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
        onAdOpened: (Ad ad) {},
      ),
    );
    _bannerAd.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerAd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bannerAd.dispose();
  }

  Widget GetBanner() {
    return isBannerAdLoaded
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.white,
            width: _bannerAd.size.width.toDouble(),
            height: _bannerAd.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd),
          )
        : SizedBox(
            height: height_banner,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Screen Banner Ad"))),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ScreenIntertitialAds()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Open Interstitials Screen", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                )),

                 InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ScreenInterstitialRewarded()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Open Interstitials Rewarded Screen", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                )),
                

                     InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ScreenOpen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Open Screen Ads", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                )),
          ],
        ),
      ),
      bottomNavigationBar: GetBanner(),
    );
  }
}
