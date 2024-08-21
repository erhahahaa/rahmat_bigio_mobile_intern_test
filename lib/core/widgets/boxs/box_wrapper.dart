import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_design/moon_design.dart';

class BoxWrapper extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final double? width, height;
  final EdgeInsetsGeometry? padding, margin;

  const BoxWrapper({
    super.key,
    this.color,
    this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.all(8.w),
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color ?? context.moonColors?.hit.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: child,
    );
  }
}
