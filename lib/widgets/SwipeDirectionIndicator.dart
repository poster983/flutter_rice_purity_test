import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rice_purity_test/GetController.dart';
import 'package:get/get.dart';
//import 'dart:ui';

class SwipeDirectionIndicator extends StatelessWidget {
  SwipeDirectionIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(window.physicalSize);
    return GetX<GetController>(builder: (_) {
      if (_.horizontalSwipeStartValue.value == null ||
          _.horizontalSwipeValue.value == null) {
        return Container();
      }
      double absoluteDX = (_.horizontalSwipeValue.value - _.horizontalSwipeStartValue.value)
              .abs();
      double opacity = (Get.height * 0.01) *
           absoluteDX /
          Get.height;
      if (opacity > 1) {
        opacity = 1;
      }

      double blurAmount = (Get.height * 0.1) *
          absoluteDX /
          Get.height;
      if (blurAmount > 20) {
        blurAmount = 20;
      }
      print(blurAmount);
      Color color =
          (_.horizontalSwipeValue.value > _.horizontalSwipeStartValue.value)
              ? Colors.green
              : Colors.red;
      return Stack(children: [
        Align(
            alignment: Alignment.topCenter,
            child: Transform.translate(
                offset: Offset(
                    0.0,
                    (Get.height * 0.5) *
                        (absoluteDX)
                            .abs() /
                        Get.height),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: new BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
                        child: Opacity(
                            opacity: opacity,
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                border: Border.all(width: 5.0, color: color),
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.grey.shade200.withOpacity(0.5),
                              ),
                              child: Text(
                                (_.horizontalSwipeValue.value >
                                        _.horizontalSwipeStartValue.value)
                                    ? "YES"
                                    : "NO",
                                style: TextStyle(color: color, fontSize: 60),
                              ),
                            ))))))
      ]);
    });
  }
}

/*class SwipeDirectionIndicator extends StatefulWidget {
  SwipeDirectionIndicator(this.progress, {Key key}) : super(key: key);

  final double progress;
  

  @override
  State<StatefulWidget> createState() => _SwipeDirectionIndicatorState();
}

class _SwipeDirectionIndicatorState extends State<SwipeDirectionIndicator>
    with SingleTickerProviderStateMixin {
  

  AnimationController _controller;
  Animation<Color> animation;
  @override
  void initState() {
    super.initState();

    /*_controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    animation = ColorTween(
      begin: Colors.black,
      end: Color.lerp(Colors.black, Colors.red, 1-(widget.score/widget.total))//Colors.red,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();*/
  }

  @override
  dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ;
  }
}
*/
