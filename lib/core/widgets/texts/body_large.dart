import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class BodyLarge extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final FontWeight? fontWeight;

  const BodyLarge(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'Unassigned',
      style: style ??
          context.moonTypography?.body.text16.copyWith(
            color: color,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
    );
  }
}
