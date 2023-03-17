import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/animations/landscape_animation.dart';
import 'package:mino_chat/views/home/home.dart';
import 'package:mino_chat/views/widgets/app_custom_clipper.dart';
import 'package:mino_chat/views/widgets/xspace.dart';
import 'package:mino_chat/tools/extensions/context_ext.dart';

class Landscape extends StatefulWidget {
  const Landscape({super.key});

  @override
  State<Landscape> createState() => _LandscapeState();
}

class _LandscapeState extends State<Landscape>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late LandscapeAnimation _landscapeAnimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _landscapeAnimation = LandscapeAnimation(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Scaffold(
      body: AnimatedBuilder(
          animation: _controller,
          builder: ((context, child) {
            return Stack(
              children: [
                Container(
                  height: size.HEIGHT,
                  width: size.WIDTH,
                  color: AppColors.primary,
                ),
                ClipPath(
                  clipper: AppCustomClipper(
                      clipHeight: ((size.HEIGHT *
                              .65 *
                              _landscapeAnimation.clipAnimation.value) /
                          3)),
                  child: Container(
                    height: size.HEIGHT *
                        .65 *
                        _landscapeAnimation.clipAnimation.value,
                    width: size.WIDTH,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.HEIGHT,
                  width: size.WIDTH,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Transform.scale(
                          scale: _landscapeAnimation.imageAnimation.value,
                          child: Image.asset(AppImages.landscape),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: SizedBox(
                            width: size.WIDTH * .7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                translateAnimation(
                                    animationValue: _landscapeAnimation
                                        .titleAnimation.value,
                                    child: Text(
                                      "Let's connect with each other",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.headline4!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                    )),
                                XSpace(size.CONTENT_SPACE * 2).y,
                                translateAnimation(
                                    animationValue: _landscapeAnimation
                                        .subTitleAnimation.value,
                                    child: Text(
                                      "A message is a discrete communication intended by the source consumption",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              color: Colors.white30,
                                              fontWeight: FontWeight.w600),
                                    )),
                                XSpace(size.CONTENT_SPACE * 3).y,
                                translateAnimation(
                                    animationValue:
                                        _landscapeAnimation.startButton.value,
                                    direction: TranslateAnimationDirection.x,
                                    child: InkWell(
                                      onTap: () {
                                        context.pushRoute(const Home(),
                                            replacement: true);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                size.CONTENT_SPACE * 1.7,
                                            vertical: size.CONTENT_SPACE * 1.2),
                                        decoration: BoxDecoration(
                                            color: AppColors.secondary,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Let's Start",
                                              textAlign: TextAlign.center,
                                              style: theme
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                            ),
                                            XSpace(size.CONTENT_SPACE / 2).x,
                                            const Icon(
                                              Icons.arrow_forward_rounded,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            );
          })),
    );
  }

  Widget translateAnimation(
      {required Widget child,
      required double animationValue,
      TranslateAnimationDirection? direction}) {
    double opacity = ((animationValue / LandscapeAnimation.offsetY) - 1) * (-1);
    Offset offset = Offset(0, animationValue);
    if (direction == TranslateAnimationDirection.x) {
      offset = Offset(animationValue, 0);
      opacity = ((animationValue / LandscapeAnimation.offsetY) + 1);
    }
    return Transform.translate(
      offset: offset,
      child: Opacity(opacity: opacity, child: child),
    );
  }
}

enum TranslateAnimationDirection { x, y }
