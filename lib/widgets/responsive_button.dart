import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool isResponsive;
  ResponsiveButton({this.width, this.isResponsive = false});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 60,
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStatePropertyAll(AppColors.mainColor)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: isResponsive
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive
                  ? AppText(
                      text: 'Book Trip Now',
                      color: Colors.white,
                    )
                  : Container(),
              Icon(
                FontAwesomeIcons.chevronRight,
                color: CupertinoColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
