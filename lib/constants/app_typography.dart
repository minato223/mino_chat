import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';

class AppTypography {
  late BuildContext context;
  late ThemeData theme;
  AppTypography(this.context) {
    theme = Theme.of(context);
  }
  TextStyle? getTextStyle({bool? isMuted, int? level, Color? color}) {
    TextStyle? style = theme.textTheme.bodyText2!
        .copyWith(fontWeight: FontWeight.w600, color: color ?? Colors.black45);
    if (isMuted == true) {
      style = theme.textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w500, color: color ?? Colors.black45);
    } else {
      switch (level) {
        case 1:
          style = theme.textTheme.titleLarge!.copyWith(
              color: color ?? AppColors.primary, fontWeight: FontWeight.w800);
          break;
        case 2:
          style = theme.textTheme.bodyText1!.copyWith(
              color: color ?? AppColors.primary, fontWeight: FontWeight.w800);
          break;
        case 3:
          style = theme.textTheme.bodyText1!.copyWith(
              color: color ?? AppColors.primary, fontWeight: FontWeight.w600);
          break;
        default:
      }
    }
    return style;
  }
}
