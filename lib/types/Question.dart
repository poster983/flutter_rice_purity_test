import 'package:flutter/widgets.dart';

enum QuestionSeverity { tame, immoral, raunchy, scandlus, unspeakable }

enum QuestionDecision { undecided, yes, no }

class Question {
  final String question;
  final String secondLine;
  final QuestionSeverity severity;
  final Widget cardBackground;

  QuestionDecision decision = QuestionDecision.undecided;

  Question({this.question, this.severity, this.cardBackground, this.secondLine}) {}

  void yes() {
    decision = QuestionDecision.yes;
  }

  void no() {
    decision = QuestionDecision.no;
  }
}
