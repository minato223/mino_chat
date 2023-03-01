// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';

class AppText extends Text {
  String text;
  int? level;
  bool? isMuted;
  Color? color;
  TextAlign? align;
  AppText(
      {super.key,
      required this.text,
      this.color,
      this.isMuted,
      this.level,
      this.align})
      : super(text);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle? style = theme.textTheme.bodyText2!
        .copyWith(fontWeight: FontWeight.w600, color: Colors.black45);
    if (isMuted == true) {
      style = theme.textTheme.bodyText1!
          .copyWith(fontWeight: FontWeight.w500, color: Colors.black45);
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
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: align,
      style: style,
    );
  }
}
