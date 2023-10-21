import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task_one/admob_data/admob_manager.dart';

class ScreenIntertitialAds extends StatefulWidget {
  const ScreenIntertitialAds({Key? key}) : super(key: key);

  @override
  State<ScreenIntertitialAds> createState() => _ScreenIntertitialAdsState();
}

class _ScreenIntertitialAdsState extends State<ScreenIntertitialAds> {
  late InterstitialAd _intertitialAd;
  bool isIntertitialAdsLoad = false;
  intersTitialAdsLoad() {
    InterstitialAd.load(
        adUnitId: AdmobManager.inter_id,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              _intertitialAd = ad;
              isIntertitialAdsLoad = true;
              _intertitialAd.fullScreenContentCallback =
                  FullScreenContentCallback(
                      onAdDismissedFullScreenContent: (ad) {
                _intertitialAd.dispose();
                print('object ${ad.toString()}');
              }, onAdFailedToShowFullScreenContent: (ad, error) {
                print('object ${error.toString()}');
              });
            },
            onAdFailedToLoad: (error) {}));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intersTitialAdsLoad();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (isIntertitialAdsLoad) {
          _intertitialAd.show();
        }
        return null!;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              if (isIntertitialAdsLoad) {
                _intertitialAd.show();
              }
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          title: const Text('Intertitial ads'),
        ),
      ),
    );
  }
}