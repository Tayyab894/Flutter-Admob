import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task_one/admob_data/admob_manager.dart';

class ScreenInterstitialRewarded extends StatefulWidget {
  const ScreenInterstitialRewarded({super.key});

  @override
  State<ScreenInterstitialRewarded> createState() =>
      _ScreenInterstitialRewardedState();
}

class _ScreenInterstitialRewardedState
    extends State<ScreenInterstitialRewarded> {
  late RewardedInterstitialAd rewardedInterstitialAd;
  bool isRewardedInterstitialAdLoad = false;

  initRewardedIntertitialAds() {
    RewardedInterstitialAd.load(
        adUnitId: AdmobManager.rewarded_intertitial_id,
        request: AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
            onAdLoaded: (RewardedInterstitialAd rInterAd) {
          setState(() {
            rewardedInterstitialAd = rInterAd;
            isRewardedInterstitialAdLoad = true;
          });

          rewardedInterstitialAd.fullScreenContentCallback =
              FullScreenContentCallback(
            onAdFailedToShowFullScreenContent:
                (RewardedInterstitialAd ad, AdError error) {
              print("Error in Interstitial Rewarded ${error.code}");
              print("Error in Interstitial Rewarded ${error.message}");
            },

            onAdShowedFullScreenContent: (RewardedInterstitialAd ad) {},
            // onAdDismissedFullScreenContent: (RewardedInterstitialAd Ad){

            // },
          );
        }, onAdFailedToLoad: (AdError error) {
          print("Error in Interstitial Rewarded ${error.code}");
          print("Error in Interstitial Rewarded ${error.message}");
        }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRewardedIntertitialAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interstitial Rewarded Ads"),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  if (isRewardedInterstitialAdLoad) {
                    rewardedInterstitialAd.show(
                        onUserEarnedReward: ((ad, reward) {
                      print("Reward Won");
                    }));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Open Rewarded Interstitials Ad",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
