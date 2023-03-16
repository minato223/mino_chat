import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/constants/app_typography.dart';
import 'package:mino_chat/models/user.dart';
import 'package:mino_chat/views/home/chats/models/bottom_action_menu.dart';
import 'package:mino_chat/views/widgets/app_custom_clipper.dart';
import 'package:mino_chat/views/widgets/app_list_tile.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/avatar_with_badge.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class ChatsDetail extends StatefulWidget {
  const ChatsDetail({super.key, required this.user});
  final User user;

  @override
  State<ChatsDetail> createState() => _ChatsDetailState();
}

class _ChatsDetailState extends State<ChatsDetail> {
  @override
  Widget build(BuildContext context) {
    List<BottomActionMenu> actions = [
      BottomActionMenu(icon: Icons.image_outlined, color: AppColors.secondary),
      BottomActionMenu(icon: Icons.feed_outlined, color: Colors.deepPurple),
      BottomActionMenu(icon: Icons.person_outline_rounded, color: Colors.blue),
      BottomActionMenu(icon: Icons.location_on_outlined, color: Colors.orange),
    ];
    AppSizes size = AppSizes(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            )),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.primary,
          ),
          ClipPath(
            clipper: AppCustomClipper(clipHeight: (size.HEIGHT * .65 / 3)),
            child: Container(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: size.HEIGHT,
            width: size.WIDTH,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.all(size.CONTENT_SPACE),
                    child: Column(
                      children: [
                        Hero(
                          tag: widget.user.profil,
                          child: AppListTile(
                            title: widget.user.username,
                            leading: AvatarWithBadge(
                              width: size.WIDTH * .15,
                              imagePath: widget.user.profil,
                            ),
                            subtitle: "Tap to add status",
                            trailing: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.videocam,
                                      color: Colors.black45,
                                      size: size.CONTENT_SPACE * 2.5,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call_outlined,
                                        color: Colors.black45,
                                        size: size.CONTENT_SPACE * 1.6))
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            AppText(
                              text: "8:12 Wednesday",
                              align: TextAlign.center,
                            ),
                            conversation(isSender: false, messages: [
                              "Hello world 👋",
                              "Deserunt amet id ad qui ad veniam duis magna duis dolore exercitation irure mollit commodo."
                            ]),
                            AppText(
                              text: "8:12 Wednesday",
                              align: TextAlign.center,
                            ),
                            conversation(messages: [
                              "Hello world 👋",
                              "Deserunt amet id ad qui ad veniam duis magna duis dolore exercitation irure mollit commodo."
                            ]),
                            AppText(
                              text: "8:12 Wednesday",
                              align: TextAlign.center,
                            ),
                            conversation(isSender: false, messages: [
                              "Hello world 👋",
                              "Deserunt amet id ad qui ad veniam duis magna duis dolore exercitation irure mollit commodo."
                            ])
                          ],
                        )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: size.CONTENT_SPACE),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                customIconButton(icon: Icons.close_outlined),
                                customIconButton(
                                    icon: Icons.mic_none_rounded,
                                    color: Colors.black45),
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.CONTENT_SPACE),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[50],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextFormField(
                                        style: AppTypography(context)
                                            .getTextStyle(),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      )),
                                ),
                                XSpace(size.CONTENT_SPACE).x
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: size.WIDTH * .8,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: actions
                              .map((action) => GestureDetector(
                                    onTap: action.onclick,
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          size.CONTENT_SPACE * .7),
                                      decoration: BoxDecoration(
                                          color: action.color,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Icon(
                                        action.icon,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                              .toList()),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customIconButton(
      {required IconData icon, Color? color, Function()? onPressed}) {
    return Builder(builder: (context) {
      AppSizes size = AppSizes(context);
      return Container(
          padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE * .7),
          margin: EdgeInsets.only(right: size.CONTENT_SPACE * .5),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(15)),
          child: Icon(
            icon,
            color: color ?? AppColors.secondary,
          ));
    });
  }

  Widget conversation(
      {String? avatar, required List<String> messages, bool isSender = true}) {
    return Builder(builder: (context) {
      AppSizes size = AppSizes(context);
      List<Widget> rowChildren = [
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: messages
                  .asMap()
                  .entries
                  .map((e) => chatBubble(
                      message: e.value,
                      isLast: e.key == messages.length - 1,
                      isSender: isSender))
                  .toList()),
        ),
        XSpace(size.CONTENT_SPACE / 2).x,
        AvatarWithBadge(
          width: size.WIDTH * .12,
          imagePath: avatar ?? AppImages.avatar4,
          height: size.WIDTH * .12,
        )
      ];
      if (!isSender) {
        rowChildren = rowChildren.reversed.toList();
      }
      return Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
          width: size.WIDTH * .7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: rowChildren,
          ),
        ),
      );
    });
  }

  Widget chatBubble(
      {required String message, bool isLast = true, bool isSender = true}) {
    return Builder(builder: (context) {
      AppSizes size = AppSizes(context);
      return Container(
        padding: EdgeInsets.all(size.CONTENT_SPACE),
        margin: EdgeInsets.only(bottom: isLast ? 0 : size.CONTENT_SPACE / 2),
        decoration: BoxDecoration(
            color: isSender ? AppColors.secondary : Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(10)),
        child: AppText(
          text: message,
          color: isSender ? Colors.white : null,
        ),
      );
    });
  }
}
