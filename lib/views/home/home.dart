import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/widgets/app_custom_clipper.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentCategoryIndex = 0;
  updateCategory(int categoryIndex) {
    setState(() {
      currentCategoryIndex = categoryIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.HEIGHT,
            width: size.WIDTH,
            child: Column(
              children: [
                XSpace((size.HEIGHT * .33) * 3 / 4).y,
                Expanded(
                    child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(size.CONTENT_SPACE),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "All Chats",
                          style: theme.textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary),
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
                    Text(
                      "Friends",
                      style: theme.textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black45),
                    ),
                    XSpace(size.CONTENT_SPACE * 1.5).y,
                    Column(
                      children: List.generate(3, (index) => listTile()),
                    ),
                    XSpace(size.CONTENT_SPACE).y,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                "See more",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.secondary),
                              ),
                            ),
                            XSpace(size.CONTENT_SPACE * .2).x,
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.secondary,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                    XSpace(size.CONTENT_SPACE).y,
                    Text(
                      "Group message",
                      style: theme.textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black45),
                    ),
                    XSpace(size.CONTENT_SPACE * 1.5).y,
                    Column(
                      children: List.generate(2, (index) => listTile()),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                "See more",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.secondary),
                              ),
                            ),
                            XSpace(size.CONTENT_SPACE * .2).x,
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.secondary,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          categoryBuilder()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: () {},
        child: const Icon(Icons.add_ic_call_outlined),
      ),
    );
  }

  Widget categoryBuilder() {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    double categoryWidth = ((size.WIDTH * .8) - (size.CONTENT_SPACE * 2)) / 3;
    return ClipPath(
      clipper: AppCustomClipper(reverse: true, clipHeight: size.HEIGHT * .18),
      child: Container(
        height: size.HEIGHT * .33,
        width: size.WIDTH,
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            children: [
              XSpace(size.CONTENT_SPACE / 2).y,
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE / 2),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.camera,
                          color: Colors.white,
                        )),
                    Expanded(
                        child: Text(
                      "MinoChat",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              XSpace(size.CONTENT_SPACE).y,
              Container(
                width: size.WIDTH * .8,
                padding: EdgeInsets.all(size.CONTENT_SPACE),
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                      left: categoryWidth * currentCategoryIndex,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary,
                        ),
                        width: categoryWidth,
                        height: size.HEIGHT * .05,
                      ),
                    ),
                    Row(
                      children: ["Chats", "Status", "Calls "]
                          .asMap()
                          .entries
                          .map((entry) => Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    updateCategory(entry.key);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.CONTENT_SPACE / 2),
                                    child: Text(
                                      entry.value,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyText1!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile() {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Container(
      margin: EdgeInsets.only(bottom: size.CONTENT_SPACE),
      child: IntrinsicHeight(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.WIDTH * .15,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(122, 247, 56, 46)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AppImages.avatar1,
                    width: size.WIDTH * .13,
                  ),
                ),
                Align(
                  alignment: const Alignment(1.3, -1.7),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Text(
                      "2",
                      style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w800, color: Colors.white60),
                    ),
                  ),
                )
              ],
            ),
            // decoration: BoxDecoration(color: Colors.red),
          ),
          XSpace(size.CONTENT_SPACE).x,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE * .3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Joe Root",
                    style: theme.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.primary),
                  ),
                  XSpace(size.CONTENT_SPACE * .5).y,
                  Text(
                    "Labore duis proident fugiat commodo pariatur id.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: theme.textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
          XSpace(size.CONTENT_SPACE).x,
          Text(
            "2:03",
            style: theme.textTheme.bodyText2!
                .copyWith(fontWeight: FontWeight.w600),
          )
        ],
      )),
    );
  }
}
