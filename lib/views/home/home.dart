import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/animations/home_animation.dart';
import 'package:mino_chat/views/home/calls/calls.dart';
import 'package:mino_chat/views/home/chats/chats.dart';
import 'package:mino_chat/views/home/common/translate_animation.dart';
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int currentCategoryIndex = 0;
  List<PageModel> pages = [];
  late AnimationController _controller;
  late HomeAnimation _homeAnimation;
  bool _isMounted = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _homeAnimation = HomeAnimation(_controller);
    pages = [
      PageModel(page: const Chats(), title: "Chats"),
      PageModel(page: const Status(), title: "Status"),
      PageModel(page: const Calls(), title: "Calls"),
    ];
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
                Expanded(
                    child: GestureDetector(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: SizedBox(
                      key: UniqueKey(),
                      child: !_isMounted
                          ? const SizedBox()
                          : pages[currentCategoryIndex].page,
                    ),
                  ),
                ))
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
    return AnimatedBuilder(
        animation: _controller,
        builder: ((context, child) {
          return ClipPath(
            clipper:
                AppCustomClipper(reverse: true, clipHeight: size.HEIGHT * .18),
            child: Container(
              height: size.HEIGHT * .33,
              width: size.WIDTH,
              color: AppColors.primary,
              child: SafeArea(
                child: Column(
                  children: [
                    XSpace(size.CONTENT_SPACE / 2).y,
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.CONTENT_SPACE / 2),
                      child: Row(
                        children: [
                          TranslateAnimation(
                              offsetY: HomeAnimation.offsetY,
                              animationValue:
                                  _homeAnimation.cameraAnimation.value,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.camera,
                                    color: Colors.white,
                                  ))),
                          Expanded(
                              child: TranslateAnimation(
                            animationValue: _homeAnimation.titleAnimation.value,
                            offsetY: HomeAnimation.offsetY,
                            child: AppText(
                              text: "MinoChat",
                              align: TextAlign.center,
                              color: Colors.white,
                              level: 1,
                            ),
                          )),
                          TranslateAnimation(
                              animationValue:
                                  _homeAnimation.searchAnimation.value,
                              offsetY: HomeAnimation.offsetY,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.search,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                    ),
                    XSpace(size.CONTENT_SPACE).y,
                    Transform.scale(
                      scale: _homeAnimation.categoryContainerAnimation.value,
                      child: Container(
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
                              child: Transform.scale(
                                scale:
                                    _homeAnimation.currentItemAnimation.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primary,
                                  ),
                                  width: categoryWidth,
                                  height: size.HEIGHT * .05,
                                ),
                              ),
                            ),
                            Row(children: [
                              categoryItem(
                                  animationValue:
                                      _homeAnimation.chatAnimation.value,
                                  index: 0),
                              categoryItem(
                                  animationValue:
                                      _homeAnimation.statusAnimation.value,
                                  index: 1),
                              categoryItem(
                                  animationValue:
                                      _homeAnimation.callAnimation.value,
                                  index: 2),
                            ]),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Widget categoryItem({required double animationValue, required int index}) {
    AppSizes size = AppSizes(context);
    PageModel pageModel = pages[index];
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          updateCategory(index);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE / 2),
          child: TranslateAnimation(
              animationValue: animationValue,
              offsetY: HomeAnimation.offsetY,
              child: AppText(
                text: pageModel.title,
                color: Colors.white,
                level: 2,
                align: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
