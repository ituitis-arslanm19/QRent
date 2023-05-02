// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:qrent/core/managers/theme/app_theme.dart';

class BaseIconButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final double height;
  final double width;
  final Function()? onPressed;

  const BaseIconButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color == myTheme.primaryColor
                ? myTheme.colorScheme.surface
                : myTheme.primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50)),
        child: IconButton(
          color: color,
          icon: icon,
          onPressed: onPressed,
        ));
  }
}
