import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rice_purity_test/types/Question.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:simple_animations/simple_animations.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard(this.question, {Key key, this.background, this.questionNumber})
      : super(key: key);

  final Question question;
  final int questionNumber;
  Widget background;

  @override
  State<StatefulWidget> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  Widget defaultBG = Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        tileMode: TileMode.mirror,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xfff44336),
          Color(0xff21c9f3),
        ],
        stops: [
          0,
          1,
        ],
      ),
      backgroundBlendMode: BlendMode.srcOver,
    ),
    child: PlasmaRenderer(
      type: PlasmaType.infinity,
      particles: 7,
      color: Color(0x44fa0000),
      blur: 1,
      size: 0.65,
      speed: 10,
      offset: 0,
      blendMode: BlendMode.plus,
      particleType: ParticleType.atlas,
      variation1: 0,
      variation2: 0,
      variation3: 0,
      rotation: 0,
    ),
  );

  Widget _buildTextBlock(String text, num size, double padding) {
      return ClipRect(
      child: new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: new Container(
              padding: EdgeInsets.all(padding),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade200.withOpacity(0.3),
              ),
              child: new Text(
                text,
                style: new TextStyle(
                    fontSize: ScreenUtil()
                        .setSp(size, allowFontScalingSelf: true),
                    fontFamily: 'Roboto'),
              ))));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      new Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: (widget.background != null) ? widget.background : defaultBG,
      ),
      /*Image(
        image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      ),*/
      Center(
          child: Container(
              padding: EdgeInsets.all(25.0),
              child:
                  new FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: _buildTextBlock(widget.question.question, 24, 25.0)),
                  
                
          
        )
      ),
    
      Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: _buildTextBlock(widget.questionNumber.toString(), 15, 15.0),
      ),
      bottom: MediaQuery.of(context).size.height * 0.05
    )
    
    ]);
  }
}

/*Center(
          child: Container(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  new FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: new BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: new Container(
                          padding: EdgeInsets.all(25.0),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey.shade200.withOpacity(0.5),
                          ),
                          child: new Text(
                            widget.question.question,
                            style: new TextStyle(
                                fontSize: 20.0, fontFamily: 'Roboto'),
                          )))
                  )
                  
                ],
              )))*/
