// ignore_for_file: must_be_immutable, annotate_overrides, overridden_fields

import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_typography.dart';

class AppText extends Text {
  String text;
  int? level;
  int? maxLines;
  bool? isMuted;
  Color? color;
  TextAlign? align;
  AppText(
      {super.key,
      required this.text,
      this.color,
      this.isMuted,
      this.level,
      this.align,
      this.maxLines})
      : super(text);

  @override
  Widget build(BuildContext context) {
    TextStyle? style = AppTypography(context)
        .getTextStyle(color: color, isMuted: isMuted, level: level);
    return Text(
      text,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
      textAlign: align,
      style: style,
    );
  }
}
