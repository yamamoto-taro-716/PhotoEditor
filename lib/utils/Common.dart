import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Constants.dart';

extension IntExt on int {
  Size get size => Size(this.toDouble(), this.toDouble());
}

String get getBannerAdId => kReleaseMode ? mAdMobBannerId : BannerAd.testAdUnitId;

String get getInterstitialId => kReleaseMode ? mAdMobInterstitialId : InterstitialAd.testAdUnitId;

String get getNativeAdvancedId => kReleaseMode ? mAdMobNativeAdvancedId : NativeAd.testAdUnitId;

String get getRewardedId => kReleaseMode ? mAdMobRewardedId : RewardedAd.testAdUnitId;
