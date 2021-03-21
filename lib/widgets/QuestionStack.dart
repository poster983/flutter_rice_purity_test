import 'package:flutter/material.dart';
import 'package:flutter_rice_purity_test/types/Question.dart';
import 'package:flutter_rice_purity_test/widgets/QuestionCard.dart';
import 'package:flutter_rice_purity_test/widgets/RoundIconButton.dart';
import 'package:tcard/tcard.dart';

class QuestionStack extends StatefulWidget {
  QuestionStack(this.questions, {Key key, this.onEnd}) : super(key: key);

  final List<Question> questions;

  final Function(List<Question>) onEnd;

  @override
  State<StatefulWidget> createState() => _QuestionStackState();
}

class _QuestionStackState extends State<QuestionStack> {
  //Widget _cardStack;
  _QuestionStackState() {
    super.initState();
    //_cardStack = _buildCards();
  }

  Widget _buildBottomActions() {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: new Padding(
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
                    icon: Icons.favorite,
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
                ])));
  }

  TCardController cardControlller;
  int currentIndex=0;
  Widget _buildCards(context) {
    
    List<Widget> cards = List.generate(widget.questions.length,
        (index) => QuestionCard(widget.questions[index], questionNumber: index+1,));

    return TCard(
      delaySlideFor: 100,
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
        setState(() {
          currentIndex = index;
        });
      },
      onForward: (int index, SwipInfo swipe) {
        setState(() {
          if(index != widget.questions.length) {
            currentIndex = index; 
          }
          
        });
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
  }

  void currentYes() {
    print("Yes");
    //widget.questions[currentQuestion].yes();
    cardControlller.forward(direction: SwipDirection.Right);
    //controller.triggerRight();
  }

  void currentNo() {
    print("No");
    cardControlller.forward(direction: SwipDirection.Left);
    //controller.triggerLeft();
  }

  void previousCard() {
    if (cardControlller.index == 0) {
      return;
    }
    cardControlller.back();
    //controller.triggerDown();
  }

  void nextCard() {
    if (cardControlller.index == widget.questions.length - 1) {
      return;
    }
    cardControlller.forward(direction: SwipDirection.None);
    //controller.triggerUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: _buildCards(context),
        ),
        bottomNavigationBar: _buildBottomActions());
  }
}