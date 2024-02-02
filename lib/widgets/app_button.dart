import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color borderColor;
  final Color color;
  final String text;
  final IconData icon;
  final bool isIcon;
  AppButton(
      {this.size = 60,
      this.isIcon = false,
      this.text = 'Hi',
      this.icon = Icons.add,
      required this.backgroundColor,
      required this.borderColor,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size,
      width: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: isIcon
          ? Icon(
              icon,
              color: color,
            )
          : Text(
              text,
              style: TextStyle(color: color),
            ),
    );
  }
}
