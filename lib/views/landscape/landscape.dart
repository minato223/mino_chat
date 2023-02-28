import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class Landscape extends StatelessWidget {
  const Landscape({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.HEIGHT,
            width: size.WIDTH,
            color: AppColors.primary,
          ),
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: size.HEIGHT * .65,
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
                  child: Image.asset(AppImages.landscape),
                ),
                Expanded(
                    flex: 4,
                    child: SizedBox(
                      width: size.WIDTH * .7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Let's connect with each other",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headline4!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                          XSpace(size.CONTENT_SPACE).y,
                          Text(
                            "A message is a discrete communication intended by the source consumption",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: Colors.white30,
                                fontWeight: FontWeight.w600),
                          ),
                          XSpace(size.CONTENT_SPACE).y,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.CONTENT_SPACE * 1.7,
                                vertical: size.CONTENT_SPACE * 1.2),
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Let's Start",
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                XSpace(size.CONTENT_SPACE / 2).x,
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double x = size.width;
    double y = size.height;
    double center = (5 / 6) * y;
    Path path = Path()
      ..lineTo(0, y)
      ..quadraticBezierTo(0, center, x * .3, center)
      ..lineTo(x * .7, center)
      ..quadraticBezierTo(x, center, x, (4 / 6) * y)
      ..lineTo(x, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
