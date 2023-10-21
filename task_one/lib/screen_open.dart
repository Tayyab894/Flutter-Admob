import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task_one/admob_data/admob_manager.dart';

class ScreenOpen extends StatefulWidget {
  const ScreenOpen({super.key});

  @override
  State<ScreenOpen> createState() => _ScreenOpenState();
}

class _ScreenOpenState extends State<ScreenOpen> {
  late AppOpenAd _openAd;
  bool isAppOpenAdsLoad = false;
  appOpenAdsLoad() {
    AppOpenAd.load(
        adUnitId: AdmobManager.app_open_id,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (AppOpenAd ad) {
              _openAd = ad;
              isAppOpenAdsLoad = true;
              _openAd.fullScreenContentCallback = FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  _openAd.dispose();
                  print('object ${ad.toString()}');
                },
                onAdFailedToShowFullScreenContent: (ad, error) {
                  print('object ${error.toString()}');
                },
              );
            },
            onAdFailedToLoad: (error) {}),
        orientation: AppOpenAd.orientationPortrait);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appOpenAdsLoad();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (isAppOpenAdsLoad) {
          _openAd.show();
        }
        return null!;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              if (isAppOpenAdsLoad) {
                _openAd.show();
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
