import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  ResponsiveButton({this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStatePropertyAll(AppColors.mainColor)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.chevronRight,
              color: CupertinoColors.white,
            )
          ],
        ),
      ),
    );
  }
}
