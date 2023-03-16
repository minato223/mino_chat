import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/fixtures/user_fixtures.dart';
import 'package:mino_chat/views/home/chats/chats_detail.dart';
import 'package:mino_chat/views/home/common/conversation_tile.dart';
import 'package:mino_chat/views/home/common/see_more.dart';
import 'package:mino_chat/views/widgets/app_animated_list_view.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';
import 'package:mino_chat/tools/extensions/context_ext.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    print("mounted");
    return Scaffold(
      body: AppAnimatedListView(
        animationStart: AppAnimationStart.bottom,
        // startAnimationDelay: Duration(seconds: 3),
        widgets: [
          const FilterSection(),
          XSpace(size.CONTENT_SPACE * .2).y,
          AppText(
            text: "Friends",
            isMuted: true,
          ),
          XSpace(size.CONTENT_SPACE * 1.5).y,
          ...List.generate(
              4,
              (index) => ConversationTile(
                    user: UserFixtures.allUser[index],
                    onTap: () {
                      context.pushRoute(
                          ChatsDetail(user: UserFixtures.allUser[index]));
                    },
                  )),
          XSpace(size.CONTENT_SPACE).y,
          const SeeMore(),
          XSpace(size.CONTENT_SPACE).y,
          AppText(
            text: "Group message",
            isMuted: true,
          ),
          XSpace(size.CONTENT_SPACE * 1.5).y,
          ...List.generate(
              3,
              (index) => ConversationTile(
                  user: UserFixtures.allUser[index + 4],
                  onTap: () {
                    context.pushRoute(
                        ChatsDetail(user: UserFixtures.allUser[index]));
                  })),
          const SeeMore(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: () {},
        child: const Icon(Icons.mark_email_read_outlined),
      ),
    );
  }
}

class FilterSection extends StatelessWidget {
  const FilterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText(
          text: "All Chats",
          level: 1,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list_rounded,
              color: AppColors.primary,
            ))
      ],
    );
  }
}
