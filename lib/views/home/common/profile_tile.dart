import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/profile/models/profile_tile_model.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.model});
  final ProfileTileModel model;

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.CONTENT_SPACE * .7, horizontal: size.CONTENT_SPACE),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(size.CONTENT_SPACE * .8),
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.1),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              model.icon,
              color: AppColors.primary,
            ),
          ),
          XSpace(size.CONTENT_SPACE).x,
          Expanded(
              child: AppText(
            text: model.name,
            level: 2,
          )),
          XSpace(size.CONTENT_SPACE).x,
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: size.CONTENT_SPACE,
              ))
        ],
      ),
    );
  }
}
