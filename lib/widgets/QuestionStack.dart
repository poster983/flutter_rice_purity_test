import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rice_purity_test/GetController.dart';
import 'package:flutter_rice_purity_test/types/Question.dart';
import 'package:flutter_rice_purity_test/widgets/QuestionCard.dart';
import 'package:flutter_rice_purity_test/widgets/RoundIconButton.dart';
import 'package:flutter_rice_purity_test/widgets/SwipeDirectionIndicator.dart';
import 'package:get/get.dart';
import 'package:tcard/tcard.dart';

class QuestionStack extends StatefulWidget {
  QuestionStack(this.questions, {Key key, this.onEnd}) : super(key: key);

  final List<Question> questions;

  final Function(List<Question>) onEnd;

  @override
  State<StatefulWidget> createState() => _QuestionStackState();
}

class _QuestionStackState extends State<QuestionStack> {
  final GetController controller = Get.find();

  //Widget _cardStack;
  _QuestionStackState() {
    super.initState();
    controller.currentQuizIndex.value = 0;
    controller.horizontalSwipeStartValue.value = null;
    controller.horizontalSwipeValue.value = null;
    //_cardStack = _buildCards();
  }

  Widget _buildBottomActions() {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Stack(children: [
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: GetX<GetController>(builder: (_) {
                  return LinearProgressIndicator(
                    value: _.currentQuizIndex.value / widget.questions.length,
                    semanticsLabel: 'Progress',
                  );
                })),
          ),
          new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new RoundIconButton.small(
                      icon: Icons.arrow_left,
                      iconColor: Colors.purple,
                      onPressed: () {
                        previousCard();
                      },
                    ),
                    new SizedBox(
                      width: 10,
                    ),
                    new RoundIconButton.large(
                      icon: Icons.clear,
                      iconColor: Colors.red,
                      onPressed: () {
                        currentNo();
                      },
                    ),
                    new SizedBox(
                      width: 10,
                    ),
                    new RoundIconButton.large(
                      icon: Icons.check,
                      iconColor: Colors.green,
                      onPressed: () {
                        currentYes();
                      },
                    ),
                    new SizedBox(
                      width: 10,
                    ),
                    new RoundIconButton.small(
                      icon: Icons.arrow_right,
                      iconColor: Colors.blue,
                      onPressed: () {
                        nextCard();
                      },
                    ),
                  ]))
        ]));
  }

  TCardController cardControlller;

  Widget _buildCards(context) {
    List<Widget> cards = List.generate(
        widget.questions.length,
        (index) => QuestionCard(
              widget.questions[index],
              background: widget.questions[index].cardBackground,
              questionNumber: index + 1,
            ));

    Widget tcard = TCard(
      delaySlideFor: 100,
      slideSpeed: 20,
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.8),
      cards: cards,
      controller: cardControlller = TCardController(),
      onEnd: () {
        if (widget.onEnd != null) {
          widget.onEnd(widget.questions);
        }
      },
      onBack: (index, info) {
        controller.currentQuizIndex.value = index;
      },
      onForward: (int index, SwipInfo swipe) {
        controller.currentQuizIndex.value = index;
        switch (swipe.direction) {
          case SwipDirection.Left:
            print("NO");
            widget.questions[index - 1].no();

            break;
          case SwipDirection.Right:
            print("YES");
            widget.questions[index - 1].yes();

            break;
          case SwipDirection.None:
            print("SKIP");
            break;
        }
      },
    );

    /*return GestureDetector(
      behavior: HitTestBehavior.translucent,
        child: tcard,
        onHorizontalDragUpdate: (details) {
          print(details);
        });*/

    return RawGestureDetector(
        gestures: {
          AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
              AllowMultipleGestureRecognizer>(
            () => AllowMultipleGestureRecognizer(),
            (AllowMultipleGestureRecognizer instance) {
              instance.onUpdate = (details) {
                //print(details.localPosition.distance);
                controller.horizontalSwipeValue.value =
                    details.localPosition.dx;
                //print(controller.horizontalSwipeValue.value - controller.horizontalSwipeStartValue.value);
              };
              instance.onStart = (details) {
                //print(details);
                controller.horizontalSwipeStartValue.value =
                    details.localPosition.dx;
              };

              instance.onEnd = (details) {
                controller.horizontalSwipeStartValue.value = null;
                controller.horizontalSwipeValue.value = null;
              };
            },
          )
        },
        behavior: HitTestBehavior.opaque,
        //Parent Container
        child: tcard);
  }

  void currentYes() {
    print("Yes");
    //widget.questions[currentQuestion].yes();
    cardControlller.forward(direction: SwipDirection.Right);
    HapticFeedback.heavyImpact();
    //controller.triggerRight();
  }

  void currentNo() {
    print("No");
    cardControlller.forward(direction: SwipDirection.Left);
    HapticFeedback.heavyImpact();
    //controller.triggerLeft();
  }

  void previousCard() {
    if (cardControlller.index == 0) {
      return;
    }
    HapticFeedback.lightImpact();
    cardControlller.back();
    //controller.triggerDown();
  }

  void nextCard() {
    if (cardControlller.index == widget.questions.length - 1) {
      return;
    }
    HapticFeedback.lightImpact();
    cardControlller.forward(direction: SwipDirection.None);
    //controller.triggerUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(children: [
              
              Positioned(top: MediaQuery.of(context).padding.top, child: _buildCards(context)),
              
              Transform.translate(
                offset: Offset(0.0, MediaQuery.of(context).padding.top),
                child: SwipeDirectionIndicator(),
              )
          //SwipeDirectionIndicator(),
          
          /*
          Align(
            alignment: Alignment.topCenter,
            child: Positioned(
              child: SwipeDirectionIndicator(),
              top: -100
            )
          )*/
          
        ])),
        bottomNavigationBar: _buildBottomActions());
  }
}

class AllowMultipleGestureRecognizer extends PanGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
