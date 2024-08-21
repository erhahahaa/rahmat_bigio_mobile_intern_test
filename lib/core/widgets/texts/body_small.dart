import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class BodySmall extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final FontWeight? fontWeight;

  const BodySmall(
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
          context.moonTypography?.body.text12.copyWith(
            color: color,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
    );
  }
}
