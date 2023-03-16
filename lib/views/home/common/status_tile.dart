// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/models/user.dart';
import 'package:mino_chat/views/widgets/app_list_tile.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/avatar_with_badge.dart';

class StatusTile extends StatelessWidget {
  StatusTile({Key? key, required this.user, this.isCurrentUser})
      : super(key: key);

  final User user;
  bool? isCurrentUser;

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    String subtitle = isCurrentUser == true
        ? "Tap to add status"
        : "${user.lastConnexion} minutes ago";
    return AppListTile(
      title: user.username,
      leading: AvatarWithBadge(
        width: size.WIDTH * .15,
        imagePath: user.profil,
        addbutton: isCurrentUser,
      ),
      subtitle: subtitle,
      trailing: AppText(
        text: "2:03",
        level: 2,
      ),
    );
  }
}
