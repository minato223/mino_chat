import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_colors.dart';
import 'package:mino_chat/constants/app_images.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/calls/accepted_call.dart';

class IncomingCall extends StatefulWidget {
  const IncomingCall({super.key});

  @override
  State<IncomingCall> createState() => _IncomingCallState();
}

class _IncomingCallState extends State<IncomingCall>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Duration duration = const Duration(milliseconds: 300);
  bool isDraging = false;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    scaleAnimation = Tween<double>(begin: 0, end: .3)
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(controller);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void resetAnimation() {
    if (isDraging) {
      setState(() {
        isDraging = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String draggableValue = "";
    Color color = AppColors.secondary;
    AppSizes size = AppSizes(context);
    double width = size.HEIGHT * .2;
    Widget user = Container(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: color.withOpacity(.5),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          AppImages.avatar1,
          width: width * .9,
        ));
    Color rippleColor = color.withOpacity(.1);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -.3),
            child: SizedBox(
              height: width,
              width: width,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Stack(children: [
                    Hero(
                      tag: rippleColor,
                      child: Transform.scale(
                        scale: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: rippleColor, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    rippleContainer(color: rippleColor, animationValue: 1.3),
                    rippleContainer(color: color.withOpacity(.3)),
                    Hero(
                      tag: user,
                      child: user,
                    )
                  ]);
                },
              ),
              // color: Colors.red,
            ),
          ),
          dragTarget(
            alignment: Alignment(isDraging ? .8 : 0, .65),
            icon: Icons.call_end_rounded,
            color: Colors.white,
            backgroundColor: Colors.green,
            onAccept: (p0) {
              Navigator.of(context).pushReplacement(PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1),
                  pageBuilder: ((context, animation, secondaryAnimation) {
                    return AcceptedCall(user: user, rippleColor: rippleColor);
                  })));
            },
          ),
          dragTarget(
            alignment: Alignment(isDraging ? -.8 : 0, .65),
            icon: Icons.call_end_rounded,
            color: Colors.white,
            backgroundColor: Colors.red,
            onAccept: (p0) {
              Navigator.pop(context);
            },
          ),
          dragTarget(
              alignment: Alignment(0, isDraging ? .35 : .65),
              icon: Icons.message_rounded),
          dragTarget(
              alignment: Alignment(0, isDraging ? .95 : .65),
              icon: Icons.volume_off_rounded),
          AnimatedBuilder(
              animation: controller,
              builder: ((context, child) {
                return Container(
                  alignment: const Alignment(0, .65),
                  margin:
                      EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE * 2),
                  child: Draggable<String>(
                      data: draggableValue,
                      onDragStarted: () {
                        if (!isDraging) {
                          setState(() {
                            isDraging = true;
                          });
                        }
                      },
                      onDraggableCanceled: (velocity, offset) {
                        resetAnimation();
                      },
                      onDragEnd: (details) {
                        resetAnimation();
                      },
                      childWhenDragging: const SizedBox(),
                      feedback: Container(
                        height: width * .35,
                        width: width * .35,
                        decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(.5),
                            shape: BoxShape.circle),
                      ),
                      child: callIcon(
                          width: width, user: user, rippleColor: rippleColor)),
                );
              })),
        ],
      ),
    );
  }

  Widget dragTarget(
      {required Alignment alignment,
      Color? color,
      Color? backgroundColor,
      Function(Object)? onAccept,
      required IconData icon}) {
    AppSizes size = AppSizes(context);
    double width = size.HEIGHT * .2;
    double ratio = width * .35;
    bool isActive = false;
    return AnimatedContainer(
      duration: duration,
      alignment: alignment,
      margin: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE * 2),
      child: AnimatedRotation(
        turns: isDraging ? 1 : 0,
        duration: duration,
        child: AnimatedScale(
          scale: isDraging ? 1 : 0,
          duration: duration,
          child: AnimatedOpacity(
              opacity: isDraging ? 1 : 0,
              duration: duration,
              child: DragTarget<String>(
                  onLeave: (data) {
                    isActive = false;
                  },
                  onWillAccept: (data) {
                    isActive = true;
                    return true;
                  },
                  onAccept: onAccept,
                  builder: ((context, candidateData, rejectedData) {
                    return AnimatedContainer(
                      duration: duration,
                      height: ratio,
                      width: ratio,
                      padding: EdgeInsets.all(size.CONTENT_SPACE),
                      decoration: BoxDecoration(
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 3),
                                blurRadius: 10,
                                spreadRadius: 1)
                          ],
                          color: isActive
                              ? backgroundColor ??
                                  AppColors.primary.withOpacity(.05)
                              : backgroundColor?.withOpacity(.7) ??
                                  Colors.white,
                          shape: BoxShape.circle),
                      child: FittedBox(
                        child: IgnorePointer(
                          child: Icon(
                            icon,
                            color: color ?? AppColors.primary,
                          ),
                        ),
                      ),
                    );
                  }))),
        ),
      ),
    );
  }

  Widget callIcon({
    required double width,
    required Widget user,
    required Color rippleColor,
  }) {
    AppSizes size = AppSizes(context);
    double ratio = width * .35;
    return SizedBox(
      height: ratio,
      width: ratio,
      child: Stack(
        children: [
          rippleContainer(color: rippleColor, withOpacity: false),
          Container(
            height: ratio,
            width: ratio,
            padding: EdgeInsets.all(size.CONTENT_SPACE),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: rippleColor,
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                  spreadRadius: 1)
            ], color: Colors.white, shape: BoxShape.circle),
            child: const FittedBox(
              child: Icon(
                Icons.call_rounded,
                color: AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rippleContainer({
    required Color color,
    double? animationValue,
    bool? withOpacity = true,
  }) {
    return Builder(builder: (context) {
      return Opacity(
        opacity: withOpacity == true ? (scaleAnimation.value / .3) : 1,
        child: Transform.scale(
          scale: (scaleAnimation.value + (animationValue ?? 1)),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
      );
    });
  }
}
