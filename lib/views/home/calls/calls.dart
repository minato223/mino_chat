import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/widgets/app_list_tile.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/avatar_with_badge.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  Icon getIcon(int index) {
    if (index % 3 == 0) {
      return const Icon(
        Icons.phone_locked_outlined,
        color: Colors.red,
      );
    }
    if (index % 2 == 0) {
      return Icon(
        Icons.phone_callback_outlined,
        color: Colors.green.shade900,
      );
    }
    return const Icon(
      Icons.phone_in_talk_outlined,
      color: Colors.orange,
    );
  }

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
                text: "All Calls",
                level: 1,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list_rounded,
                    color: AppColors.primary,
                  ))
            ],
          ),
          XSpace(size.CONTENT_SPACE * .2).y,
          AppText(
            text: "Friends",
            isMuted: true,
          ),
          XSpace(size.CONTENT_SPACE * 1.5).y,
          Column(
            children: List.generate(
                3,
                (index) => AppListTile(
                      leading: AvatarWithBadge(width: size.WIDTH * .15),
                      trailing: IconButton(
                          onPressed: () {}, icon: getIcon(index + 1)),
                    )),
          ),
          XSpace(size.CONTENT_SPACE).y,
          Align(
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
          ),
          XSpace(size.CONTENT_SPACE).y,
          AppText(
            text: "Group message",
            isMuted: true,
          ),
          XSpace(size.CONTENT_SPACE * 1.5).y,
          Column(
            children: List.generate(
                2,
                (index) => AppListTile(
                      leading: AvatarWithBadge(width: size.WIDTH * .15),
                      trailing: IconButton(
                          onPressed: () {}, icon: getIcon(index + 1)),
                    )),
          ),
          Align(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: () {},
        child: const Icon(Icons.add_ic_call_outlined),
      ),
    );
  }
}
