import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/core/core.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  Strings? get str => Strings.of(this);
  
  Locale get locale => Localizations.localeOf(this);

  void changeFocus(FocusNode currentFocus, FocusNode? nextFocus) {
    currentFocus.unfocus();
    if (nextFocus != null) {
      FocusScope.of(this).requestFocus(nextFocus);
    }
  }

  void errorToast({
    String? title,
    String? description,
  }) {
    ElegantNotification.error(
      title: TitleSmall(title),
      description: BodySmall(description),
      width: 300.w,
      animationCurve: Curves.easeInOut,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      background: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(8.r),
      stackedOptions: StackedOptions(
        key: 'top',
        type: StackedType.same,
        itemOffset: const Offset(-5, -5),
      ),
      progressBarPadding: EdgeInsets.all(4.w),
    ).show(this);
  }

  void successToast({
    String? title,
    String? description,
  }) {
    ElegantNotification.success(
      title: TitleSmall(title),
      description: BodySmall(description),
      width: 300.w,
      animationCurve: Curves.easeInOut,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      background: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(8.r),
      stackedOptions: StackedOptions(
        key: 'top',
        type: StackedType.same,
        itemOffset: const Offset(-5, -5),
      ),
      progressBarPadding: EdgeInsets.all(4.w),
    ).show(this);
  }

  void infoToast({
    String? title,
    String? description,
  }) {
    ElegantNotification.info(
      title: TitleSmall(title),
      description: BodySmall(description),
      width: 300.w,
      animationCurve: Curves.easeInOut,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      background: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(8.r),
      stackedOptions: StackedOptions(
        key: 'top',
        type: StackedType.same,
        itemOffset: const Offset(-5, -5),
      ),
      progressBarPadding: EdgeInsets.all(4.w),
    ).show(this);
  }

  void showSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
  }
}
