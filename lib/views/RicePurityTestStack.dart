import 'package:flutter/material.dart';
import 'package:flutter_rice_purity_test/types/Question.dart';
import 'package:flutter_rice_purity_test/views/ResultsView.dart';
import 'package:flutter_rice_purity_test/widgets/QuestionStack.dart';
import 'package:get/get.dart';

class RicePurityTestStack extends StatefulWidget {
  RicePurityTestStack({Key key}) : super(key: key);

  final List<Question> questions = [
    new Question(question: "Held hands romantically?", severity: QuestionSeverity.tame),
    new Question(question: "Been on a date?", severity: QuestionSeverity.tame, cardBackground: Image(
        image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      )),
    new Question(question: "Been in a relationship?", severity: QuestionSeverity.tame),
    new Question(question: "Danced without leaving room for Jesus?", severity: QuestionSeverity.tame),
    new Question(question: "Kissed a non-family member?", severity: QuestionSeverity.tame),
    new Question(question: "Kissed a non-family member on the lips?", severity: QuestionSeverity.tame),
    new Question(question: "French kissed?", severity: QuestionSeverity.tame),
    new Question(question: "French kissed in public?", severity: QuestionSeverity.tame),
    new Question(question: "Kissed on the neck?", severity: QuestionSeverity.tame),
    new Question(question: "Kissed horizontally?", severity: QuestionSeverity.tame),
    new Question(question: "Given or received a hickey?", severity: QuestionSeverity.tame),
    new Question(question: "Kissed or been kissed on the breast?", severity: QuestionSeverity.immoral), 
    new Question(question: "Kissed someone below the belt?", severity: QuestionSeverity.immoral), 
    new Question(question: "Kissed for more than two hours consecutively?", severity: QuestionSeverity.immoral), 
    new Question(question: "Played a game involving stripping?", severity: QuestionSeverity.immoral), 
    new Question(question: "Seen or been seen by another person in a sensual context?", severity: QuestionSeverity.immoral), 
    new Question(question: "Masturbated?", severity: QuestionSeverity.immoral), 
    new Question(question: "Masturbated to a picture or video?", severity: QuestionSeverity.immoral), 
    new Question(question: "Masturbated while someone else was in the room?", severity: QuestionSeverity.immoral), 
    new Question(question: "Been caught masturbating?", severity: QuestionSeverity.immoral), 
    new Question(question: "Masturbated with an inanimate object?", severity: QuestionSeverity.immoral), 
    new Question(question: "Seen or read pornographic material?", severity: QuestionSeverity.immoral), 
    new Question(question: "Massaged or been massaged sensually?", severity: QuestionSeverity.immoral), 
    new Question(question: "Gone through the motions of intercourse while fully dressed?", severity: QuestionSeverity.immoral), 
  ];

  @override
  State<StatefulWidget> createState() => _RicePurityTestStackState();
}

class _RicePurityTestStackState extends State<RicePurityTestStack> {
  @override
  Widget build(BuildContext context) {
    return QuestionStack(widget.questions, onEnd: (results) {
      results.forEach((element) {
          print(element.decision);
        });
        Get.off(() => ResultsView(testName: "Rice Purity Test", results: results,));
        //open results page
    });
  }
}
