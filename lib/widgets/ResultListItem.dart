import 'package:flutter/material.dart';
import 'package:flutter_rice_purity_test/types/Question.dart';

class ResultListItem extends StatefulWidget {
  ResultListItem(this.questions, {Key key}) : super(key: key);

  final List<Question> questions;

  @override
  State<StatefulWidget> createState() => _ResultListItemState();
}

class _ResultListItemState extends State<ResultListItem> {
  


  @override
  void initState() {
    super.initState();

   
  }

  @override
  dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
