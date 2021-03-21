import 'package:flutter/widgets.dart';

enum QuestionSeverity { tame, immoral, raunchy, scandlus, unspeakable }

enum QuestionDecision { undecided, yes, no }

class Question {
  final String question;
  final QuestionSeverity severity;
  final Widget cardBackground;

  QuestionDecision decision = QuestionDecision.undecided;

  Question({this.question, this.severity, this.cardBackground}) {
    
  }

  void yes() {
    decision = QuestionDecision.yes;
  }

  void no() {
    decision = QuestionDecision.no;
  }
}
