import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photo_editor_pro/utils/Colors.dart';

class AppLogoWidget extends StatelessWidget {
  static String tag = '/AppLogoWidget';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      width: context.width(),
      child: Column(
        children: [
          180.height,
          // Text('写真を', style: boldTextStyle(size: 30)),
          // Text('美しく作りましょう！', style: boldTextStyle(size: 30))
          //     .withShaderMaskGradient(
          //         LinearGradient(colors: [itemGradient1, itemGradient2]))
        ],
      ),
    );
  }
}
