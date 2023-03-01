// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class AppListTile extends StatelessWidget {
  Widget? leading;
  String? title;
  String? subtitle;
  Widget? trailing;
  AppListTile(
      {super.key, this.leading, this.title, this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    return Container(
      margin: EdgeInsets.only(bottom: size.CONTENT_SPACE * 1.5),
      child: IntrinsicHeight(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading != null
              ? Container(
                  margin: EdgeInsets.only(right: size.CONTENT_SPACE),
                  width: size.WIDTH * .15,
                  child: leading,
                )
              : XSpace(0).x,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE * .3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title ?? "Joe Root",
                    level: 3,
                  ),
                  XSpace(size.CONTENT_SPACE * .5).y,
                  AppText(
                    text: subtitle ??
                        "Labore duis proident fugiat commodo pariatur id.",
                  )
                ],
              ),
            ),
          ),
          trailing != null
              ? Padding(
                  padding: EdgeInsets.only(left: size.CONTENT_SPACE),
                  child: trailing,
                )
              : XSpace(0).x
        ],
      )),
    );
  }
}
