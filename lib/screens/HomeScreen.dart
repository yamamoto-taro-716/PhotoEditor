import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photo_editor_pro/components/AppLogoWidget.dart';
import 'package:photo_editor_pro/components/HomeItemListWidget.dart';
import 'package:photo_editor_pro/components/LastEditedPicturesWidget.dart';
import 'package:photo_editor_pro/utils/Common.dart';
import 'package:photo_editor_pro/utils/Constants.dart';

class HomeScreen extends StatefulWidget {
  static String tag = '/HomeScreen';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  BannerAd myBanner;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (!disableAdMob) myBanner = buildBannerAd()..load();

    setStatusBarColor(Colors.white70);
  }

  BannerAd buildBannerAd() {
    return BannerAd(
      adUnitId: getBannerAdId,
      size: AdSize.fullBanner,
      listener: AdListener(onAdLoaded: (ad) {
        //
      }),
      request: AdRequest(testDevices: testIds),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    myBanner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        // height: context.height(),
        // width: context.width(),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('images/background.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: AdSize.banner.height.toDouble()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLogoWidget(),
                  HomeItemListWidget(),
                  LastEditedPicturesWidget(),
                ],
              ),
            ),
            // if (myBanner != null)
            //   Positioned(
            //     child: Container(child: AdWidget(ad: myBanner), color: Color(0xFFEEF6FD)),
            //     bottom: 0,
            //     height: AdSize.banner.height.toDouble(),
            //     width: context.width(),
            //   ),
          ],
        ),
      ),
    ));
  }
}
