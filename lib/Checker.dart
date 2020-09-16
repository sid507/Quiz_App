import 'Question.dart';

class Checker {
  int _qnum = 0;
  List<Question> q = [
    Question("Everything in Flutter is Widget", true),
    Question("Flutter is based on Java Programming lang", false),
    Question(
        "Widgets in flutter are categorized as Stateful and Stateless", true)
  ];
  bool finished() {
    if (_qnum >= q.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void next() {
    if (_qnum < q.length - 1) _qnum++;
  }

  String question() {
    return q[_qnum].question;
  }

  bool answer() {
    return q[_qnum].ans;
  }

  void reset() {
    _qnum = 0;
  }
}
