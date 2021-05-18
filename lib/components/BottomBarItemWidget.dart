import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photo_editor_pro/utils/Constants.dart';

class BottomBarItemWidget extends StatelessWidget {
  final Color color;
  final Function onTap;
  final String title;
  final IconData icons;

  BottomBarItemWidget({this.color, this.onTap, this.title, this.icons});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: context.width() / 3,
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: viewLineColor), color: color),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icons, color: Green),
              4.height,
              Text(title.validate(),
                      style: boldTextStyle(color: Green, size: 13))
                  .fit(),
            ],
          ),
        ),
      ),
    );
  }
}
