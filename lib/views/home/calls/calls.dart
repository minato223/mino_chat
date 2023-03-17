import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/calls/incoming_call.dart';
import 'package:mino_chat/views/home/common/call_tile.dart';
import 'package:mino_chat/views/home/common/see_more.dart';
import 'package:mino_chat/views/widgets/app_animated_list_view.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';
import 'package:mino_chat/tools/extensions/context_ext.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    return Scaffold(
      body: AppAnimatedListView(
        animationStart: AppAnimationStart.bottom,
        widgets: [
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
          ...List.generate(4, (index) => CallTile(index: index)),
          XSpace(size.CONTENT_SPACE).y,
          const SeeMore(),
          XSpace(size.CONTENT_SPACE).y,
          AppText(
            text: "Group message",
            isMuted: true,
          ),
          XSpace(size.CONTENT_SPACE * 1.5).y,
          ...List.generate(3, (index) => CallTile(index: index + 4)),
          const SeeMore(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: () {
          context.pushRoute(const IncomingCall());
        },
        child: const Icon(Icons.add_ic_call_outlined),
      ),
    );
  }
}
