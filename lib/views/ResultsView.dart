import 'package:flutter/material.dart';
import 'package:flutter_rice_purity_test/types/Question.dart';
import 'package:flutter_rice_purity_test/widgets/PurityScore.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

class ResultsView extends StatefulWidget {
  final String testName;
  final List<Question> results;
  ResultsView({Key key, this.testName, this.results}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  int calculateScore() {
    int score = 0;
    widget.results.forEach((element) {
      if (element.decision == QuestionDecision.no || element.decision == QuestionDecision.undecided) {
        score++;
      }
    });
    return score;
  }

  List<Widget> questionList;
  @override
  void initState() {
    super.initState();
    questionList = List.generate(widget.results.length, (index) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: Center(
              child: Column(
                children: [
                  new TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Restart Test")),
                  new Text(
                    "Results for",
                    style: new TextStyle(
                        fontSize:
                            ScreenUtil().setSp(24, allowFontScalingSelf: true),
                        fontFamily: 'Roboto'),
                  ),
                  new Text(
                    widget.testName,
                    style: new TextStyle(
                        fontSize:
                            ScreenUtil().setSp(30, allowFontScalingSelf: true),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  PurityScore(calculateScore(), widget.results.length)
                ],
              ),
            )));
  }
}
