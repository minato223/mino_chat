import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/widgets/app_list_tile.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/avatar_with_badge.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(size.CONTENT_SPACE),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: "My Status",
                level: 1,
              ),
            ],
          ),
          XSpace(size.CONTENT_SPACE).y,
          AppListTile(
            leading: AvatarWithBadge(
              width: size.WIDTH * .15,
              addbutton: true,
            ),
            subtitle: "Tap to add status",
            trailing: AppText(
              text: "2:03",
              level: 2,
            ),
          ),
          XSpace(size.CONTENT_SPACE * .2).y,
          Text(
            "Friends",
            style: theme.textTheme.bodyText1!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.black45),
          ),
          XSpace(size.CONTENT_SPACE * 1.5).y,
          Column(
            children: List.generate(
                5,
                (index) => AppListTile(
                      leading: AvatarWithBadge(width: size.WIDTH * .15),
                      subtitle: "25 minutes ago",
                      trailing: AppText(
                        text: "2:03",
                        level: 2,
                      ),
                    )),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: EdgeInsets.symmetric(
            horizontal: size.CONTENT_SPACE, vertical: size.CONTENT_SPACE / 2),
        child: Padding(
          padding: EdgeInsets.only(bottom: size.CONTENT_SPACE / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.edit_outlined),
              ),
              XSpace(size.CONTENT_SPACE / 2).x,
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColors.secondary,
                child: const Icon(Icons.camera_alt_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
