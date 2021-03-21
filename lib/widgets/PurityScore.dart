import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rice_purity_test/types/Question.dart';
import 'package:flutter_screenutil/screen_util.dart';

class PurityScore extends StatefulWidget {
  PurityScore(this.score, this.total, {Key key}) : super(key: key);

  final int score;
  final int total;

  @override
  State<StatefulWidget> createState() => _PurityScoreState();
}

class _PurityScoreState extends State<PurityScore>
    with SingleTickerProviderStateMixin {
  

  AnimationController _controller;
  Animation<Color> animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
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
    _controller.forward();
  }

  @override
  dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Countup(
        begin: widget.total.toDouble(),
        end: widget.score.toDouble(),
        duration: Duration(seconds: 3),
        separator: ',',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(60, allowFontScalingSelf: true),
            color: animation.value),
      ),
      SizedBox(height: 10),
      Text("of ${widget.total}")
    ]);
  }
}
