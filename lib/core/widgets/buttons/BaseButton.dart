// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrent/core/managers/theme/app_theme.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final Function()? onPressed;

  const BaseButton({
    Key? key,
    required this.text,
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
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )),
          child: Text(
            text,
            style: GoogleFonts.rubik(
                fontSize: height / 1.95,
                fontWeight: FontWeight.w400,
                color: color == myTheme.primaryColor
                    ? myTheme.colorScheme.surface
                    : myTheme.primaryColor),
          )),
    );
  }
}
