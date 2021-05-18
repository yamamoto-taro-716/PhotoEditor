import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget text;
  final Widget icon;
  final Color color;
  final Function onTap;
  const CustomButton({this.text, this.icon, this.color, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: [icon, text],
            ),
          ),
          onTap: onTap,
        ));
  }
}
