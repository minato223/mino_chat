import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/home/calls/calls.dart';
import 'package:mino_chat/views/home/chats/chats.dart';
import 'package:mino_chat/views/home/models/page_model.dart';
import 'package:mino_chat/views/home/status/status.dart';
import 'package:mino_chat/views/widgets/app_custom_clipper.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentCategoryIndex = 0;
  List<PageModel> pages = [
    PageModel(page: const Chats(), title: "Chats"),
    PageModel(page: const Status(), title: "Status"),
    PageModel(page: const Calls(), title: "Calls"),
  ];
  updateCategory(int categoryIndex) {
    setState(() {
      currentCategoryIndex = categoryIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Expanded(child: pages[currentCategoryIndex].page)
              ],
            ),
          ),
          categoryBuilder()
        ],
      ),
    );
  }

  Widget categoryBuilder() {
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
                        child: AppText(
                      text: "MinoChat",
                      align: TextAlign.center,
                      color: Colors.white,
                      level: 1,
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
                      children: pages
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
                                    child: AppText(
                                      text: entry.value.title,
                                      color: Colors.white,
                                      level: 2,
                                      align: TextAlign.center,
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
}
