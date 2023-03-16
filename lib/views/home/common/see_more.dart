import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: AppText(
                text: "See more",
                level: 2,
                color: AppColors.secondary,
              ),
            ),
            XSpace(size.CONTENT_SPACE * .2).x,
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.secondary,
              size: 14,
            )
          ],
        ),
      ),
    );
  }
}
