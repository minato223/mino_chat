// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class AvatarWithBadge extends StatelessWidget {
  double width;
  double? height;
  Color? backgroundColor;
  Color? badgeColor;
  Color? badgeBackgroundColor;
  String? imagePath;
  bool? addbutton;
  int? badgeValue;
  AvatarWithBadge(
      {super.key,
      required this.width,
      this.height,
      this.backgroundColor,
      this.badgeColor,
      this.badgeBackgroundColor,
      this.imagePath,
      this.badgeValue = 0,
      this.addbutton});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    backgroundColor ?? const Color.fromARGB(122, 247, 56, 46)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imagePath ?? AppImages.avatar1,
                    width: width * .9)),
          ),
          (badgeValue != null && badgeValue! > 0)
              ? Align(
                  alignment: const Alignment(1.3, -1.7),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: badgeBackgroundColor ?? Colors.red,
                        shape: BoxShape.circle),
                    child: Text(
                      badgeValue.toString(),
                      style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w800, color: Colors.white60),
                    ),
                  ),
                )
              : XSpace(0).x,
          addbutton == true
              ? Align(
                  alignment: const Alignment(1.4, 1.5),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: badgeBackgroundColor ?? AppColors.secondary,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.add_rounded,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                )
              : XSpace(0).x
        ],
      ),
      // decoration: BoxDecoration(color: Colors.red),
    );
  }
}
