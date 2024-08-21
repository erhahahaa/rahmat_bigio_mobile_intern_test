import 'package:flutter/material.dart';
import 'package:rick_morty/utils/utils.dart';

class TitleSmall extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final FontWeight? fontWeight;

  const TitleSmall(
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
          context.theme.textTheme.titleSmall?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }
}
