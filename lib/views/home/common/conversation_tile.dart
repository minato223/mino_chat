// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/models/user.dart';
import 'package:mino_chat/views/widgets/app_list_tile.dart';
import 'package:mino_chat/views/widgets/avatar_with_badge.dart';

class ConversationTile extends StatelessWidget {
  ConversationTile({Key? key, required this.user, this.onTap})
      : super(key: key);

  final User user;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return AppListTile(
      onTap: onTap,
      leading: AvatarWithBadge(
        width: size.WIDTH * .15,
        badgeValue: user.unreadMessage,
        imagePath: user.profil,
      ),
      title: user.username,
      subtitle: user.description,
      trailing: Text(
        "2:03",
        style: theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
