import 'package:flutter/material.dart';
import 'package:rick_morty/utils/utils.dart';

class TitleLarge extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final FontWeight? fontWeight;

  const TitleLarge(
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
          context.theme.textTheme.titleLarge?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }
}
