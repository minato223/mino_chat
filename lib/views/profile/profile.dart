import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/widgets/app_custom_clipper.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
            onPressed: () {},
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
                XSpace((size.HEIGHT * .5)).y,
                Expanded(
                    child:
                        Container(color: Colors.red, child: const Text("data")))
              ],
            ),
          ),
          ClipPath(
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
                          child: Container(
                            width: size.HEIGHT * .2,
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                                image: const DecorationImage(
                                    image: AssetImage(AppImages.avatar8)),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        XSpace(size.CONTENT_SPACE).y,
                        AppText(
                          text: "Steven Smith",
                          level: 1,
                          color: Colors.white,
                        ),
                        XSpace(size.CONTENT_SPACE / 2).y,
                        AppText(
                          text: "Active now",
                          color: Colors.white54,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.CONTENT_SPACE * 2),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: displayRecord(
                                      title: 'Total Connected', record: 251)),
                              Expanded(
                                  flex: 1,
                                  child: displayRecord(
                                      title: 'Rencently Connected', record: 80))
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
          )
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
