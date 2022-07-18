import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:qrent/core/managers/theme/app_theme.dart';

class BaseCard extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final Widget? child;

  const BaseCard(
      {Key? key,
      required this.color,
      required this.height,
      required this.width,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent),
      height: height,
      width: width,
      child: Card(
        color: color,
        child: child,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
