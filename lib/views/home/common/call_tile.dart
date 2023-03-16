import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/fixtures/user_fixtures.dart';
import 'package:mino_chat/models/user.dart';
import 'package:mino_chat/views/widgets/app_list_tile.dart';
import 'package:mino_chat/views/widgets/avatar_with_badge.dart';

class CallTile extends StatelessWidget {
  const CallTile({super.key, required this.index});
  final int index;

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
    AppSizes size = AppSizes(context);
    User user = UserFixtures.allUser[index];
    return AppListTile(
      title: user.username,
      subtitle: user.description,
      leading: AvatarWithBadge(width: size.WIDTH * .15, imagePath: user.profil),
      trailing: IconButton(onPressed: () {}, icon: getIcon(index + 1)),
    );
  }
}
