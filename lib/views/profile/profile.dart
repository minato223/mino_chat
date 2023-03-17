import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/fixtures/profile_fixtures.dart';
import 'package:mino_chat/views/animations/profile_animation.dart';
import 'package:mino_chat/views/home/common/profile_tile.dart';
import 'package:mino_chat/views/home/common/translate_animation.dart';
import 'package:mino_chat/views/widgets/app_animated_list_view.dart';
import 'package:mino_chat/views/widgets/app_custom_clipper.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ProfileAnimation _profileAnimation;
  bool _isMounted = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _profileAnimation = ProfileAnimation(_controller);
    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        setState(() {
          _isMounted = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    setState(() {
      _isMounted = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: Colors.white,
            )),
        centerTitle: true,
        title: AppText(
          text: "Profile",
          align: TextAlign.center,
          color: Colors.white,
          level: 1,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mode_edit_outlined,
                size: 20,
                color: Colors.white,
              ))
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.HEIGHT,
            width: size.WIDTH,
            child: Column(
              children: [
                XSpace((size.HEIGHT * .45)).y,
                Expanded(
                    child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    key: UniqueKey(),
                    child: !_isMounted
                        ? const SizedBox()
                        : AppAnimatedListView(
                            animationStart: AppAnimationStart.bottom,
                            widgets: [
                              ...List.generate(
                                  ProfileFixtures.getTiles.length,
                                  (index) => ProfileTile(
                                      model: ProfileFixtures.getTiles[index]))
                            ],
                          ),
                  ),
                ))
              ],
            ),
          ),
          AnimatedBuilder(
              animation: _controller,
              builder: ((context, child) {
                return ClipPath(
                  clipper: AppCustomClipper(
                      reverse: true, clipHeight: (size.HEIGHT * .65 / 3)),
                  child: Container(
                    height: (size.HEIGHT * .5) + kTextTabBarHeight,
                    width: size.WIDTH,
                    color: AppColors.primary,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              XSpace(size.CONTENT_SPACE / 3).y,
                              Expanded(
                                child: Transform.scale(
                                  scale:
                                      _profileAnimation.avatarAnimation.value,
                                  child: Container(
                                    width: size.HEIGHT * .2,
                                    decoration: BoxDecoration(
                                        color: AppColors.secondary,
                                        image: const DecorationImage(
                                            image:
                                                AssetImage(AppImages.avatar8)),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              ),
                              XSpace(size.CONTENT_SPACE).y,
                              TranslateAnimation(
                                  child: AppText(
                                    text: "Steven Smith",
                                    level: 1,
                                    color: Colors.white,
                                  ),
                                  animationValue:
                                      _profileAnimation.titleAnimation.value,
                                  offsetY: ProfileAnimation.offsetY),
                              XSpace(size.CONTENT_SPACE / 2).y,
                              TranslateAnimation(
                                  child: AppText(
                                    text: "Active now",
                                    color: Colors.white54,
                                  ),
                                  animationValue:
                                      _profileAnimation.subTitleAnimation.value,
                                  offsetY: ProfileAnimation.offsetY),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.CONTENT_SPACE * 2),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: TranslateAnimation(
                                          animationValue: _profileAnimation
                                              .totalConnectedAnimation.value,
                                          offsetY: ProfileAnimation.offsetY,
                                          child: displayRecord(
                                              title: 'Total Connected',
                                              record: 251),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: TranslateAnimation(
                                            animationValue: _profileAnimation
                                                .recentlyConnectedAnimation
                                                .value,
                                            offsetY: ProfileAnimation.offsetY,
                                            child: displayRecord(
                                                title: 'Rencently Connected',
                                                record: 80)))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        XSpace((size.HEIGHT * .65) * 2 / 9).y
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }

  Widget displayRecord({required String title, required int record}) {
    return Builder(builder: (context) {
      AppSizes size = AppSizes(context);
      int maxLength = 250;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            text: title,
            color: Colors.white54,
          ),
          XSpace(size.CONTENT_SPACE / 3).y,
          AppText(
            text: "$record${record > maxLength ? '+' : ''}",
            level: 1,
            color: AppColors.secondary,
          )
        ],
      );
    });
  }
}
