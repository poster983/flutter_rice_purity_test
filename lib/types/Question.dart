import 'package:flutter/widgets.dart';

enum QuestionSeverity { tame, immoral, raunchy, scandalous, unspeakable }

enum QuestionDecision { undecided, yes, no }

class Question {
  String question;
  String secondLine;
  QuestionSeverity severity;
  Widget cardBackground;

  QuestionDecision decision = QuestionDecision.undecided;

  Question({this.question, this.severity, this.cardBackground, this.secondLine}) {}

  void yes() {
    decision = QuestionDecision.yes;
  }

  void no() {
    decision = QuestionDecision.no;
  }
}
