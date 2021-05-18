import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photo_editor_pro/services/FileService.dart';
import 'package:photo_editor_pro/utils/Colors.dart';
import 'package:photo_editor_pro/utils/Common.dart';
import 'package:photo_editor_pro/utils/Constants.dart';

import 'PhotoViewerWidget.dart';

class LastEditedPicturesWidget extends StatefulWidget {
  static String tag = '/LastEditedPicturesWidget';

  @override
  _LastEditedPicturesWidgetState createState() =>
      _LastEditedPicturesWidgetState();
}

class _LastEditedPicturesWidgetState extends State<LastEditedPicturesWidget> {
  InterstitialAd myInterstitial;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (!disableAdMob) myInterstitial = buildInterstitialAd()..load();

    LiveStream().on('refresh', (v) {
      setState(() {});
    });
  }

  InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: getInterstitialId,
      listener: AdListener(onAdLoaded: (ad) {
        //
      }, onAdClosed: (ad) {
        myInterstitial.load();
      }, onAdOpened: (ad) {
        myInterstitial.load();
      }, onAdFailedToLoad: (ad, error) {
        myInterstitial.load();
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
    LiveStream().dispose('refresh');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: isWeb ? 500 : context.width(),
      child: FutureBuilder<List<FileSystemEntity>>(
        future: getLocalSavedImageDirectories(),
        builder: (_, snap) {
          if (snap.hasData) {
            // if (snap.data.isEmpty) return SizedBox();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('最近保存された写真', style: boldTextStyle()).paddingLeft(8),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        size: 30,
                        color: Red,
                      ),
                      onPressed: () {
                        if (snap.data.length == 0) return;
                        showConfirmDialog(context, '保存した写真をすべて削除しますか？',
                                buttonColor: Blue,
                                positiveText: 'はい',
                                negativeText: 'いいえ')
                            .then((value) {
                          if (value ?? false) {
                            getFileSaveDirectory().then((value) async {
                              value.deleteSync(recursive: true);

                              setState(() {});

                              await 500.milliseconds.delay;

                              if (myInterstitial != null &&
                                  await myInterstitial.isLoaded()) {
                                myInterstitial.show().then((value) {
                                  myInterstitial?.dispose();
                                });
                              } else {
                                myInterstitial.load();
                              }
                            });
                          }
                        });
                      },
                    ),
                  ],
                ),
                Wrap(
                  children: snap.data.map((data) {
                    if (data.path.isImage) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        child: Image.file(File(data.path),
                            width: context.width() * 0.21),
                      ).onTap(() {
                        PhotoViewerWidget(data).launch(context).then((value) {
                          setState(() {});
                        });
                      });
                    } else {
                      return SizedBox();
                    }
                  }).toList(),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
