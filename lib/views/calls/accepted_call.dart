// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mino_chat/constants/app_sizes.dart';
import 'package:mino_chat/views/widgets/app_text.dart';
import 'package:mino_chat/views/widgets/xspace.dart';

class AcceptedCall extends StatefulWidget {
  Widget user;
  Color rippleColor;
  AcceptedCall({super.key, required this.user, required this.rippleColor});

  @override
  State<AcceptedCall> createState() => _AcceptedCallState();
}

class _AcceptedCallState extends State<AcceptedCall> {
  bool isMounted = false;
  Duration duration = const Duration(milliseconds: 600);
  @override
  void initState() {
    super.initState();
    Future.delayed(duration, (() {
      setState(() {
        isMounted = true;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> list1 = [
      Icons.add_rounded,
      Icons.pause_rounded,
      Icons.volume_up_rounded
    ];
    List<IconData> list2 = [
      Icons.bluetooth_audio_rounded,
      Icons.volume_off_rounded,
      Icons.grid_3x3_rounded
    ];
    AppSizes size = AppSizes(context);
    double width = size.HEIGHT * .2;
    // Color color = AppColors.secondary;
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.rippleColor,
            child: Transform.scale(
              scale: 3,
              child: Container(
                decoration: BoxDecoration(
                    color: widget.rippleColor.withOpacity(.1),
                    shape: BoxShape.circle),
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: -.5),
              duration: const Duration(milliseconds: 500),
              builder: ((context, value, child) {
                return Align(
                    alignment: Alignment(0, value),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            height: width,
                            width: width,
                            child: Hero(tag: widget.user, child: widget.user)),
                        XSpace(size.CONTENT_SPACE).y,
                        AppText(
                          text: "John Doe",
                          level: 1,
                        ),
                        XSpace(size.CONTENT_SPACE).y,
                        AppText(
                          text: "00:08",
                        )
                      ],
                    ));
              })),
          Align(
            alignment: const Alignment(0, .7),
            child: AnimatedContainer(
              curve: Curves.elasticOut,
              clipBehavior: Clip.hardEdge,
              duration: duration,
              padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE * 2),
              width: isMounted ? size.WIDTH * .8 : 0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white54),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: list1.map((e) {
                      return Expanded(
                          child: iconButton(onPressed: () {}, icon: e));
                    }).toList(),
                  ),
                  XSpace(size.CONTENT_SPACE * 1.5).y,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: list2.map((e) {
                      return Expanded(
                          child: iconButton(onPressed: () {}, icon: e));
                    }).toList(),
                  ),
                  XSpace(size.CONTENT_SPACE * 1.5).y,
                  iconButton(
                    icon: Icons.call_end_rounded,
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget iconButton({Color? color, Function()? onPressed, IconData? icon}) {
    return Builder(builder: (context) {
      AppSizes size = AppSizes(context);
      return IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon ?? Icons.call_end_rounded,
            color: color,
            size: size.CONTENT_SPACE * 2.5,
          ));
    });
  }
}
