class Question {
  String question;
  String answer;
  List<dynamic> options;
  String selected = 'Skipped';
  bool correct = false;

  Question(
      {required this.question, required this.answer, required this.options});

  Question.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        answer = json['answer'],
        options = json['options'];

  Map<String, dynamic> toJson() =>
      {'question': question, 'answer': answer, 'options': options};

  List<String> get opsStr {
    List<String> ops = [];
    for (var option in options) {
      ops.add(option as String);
    }
    return ops;
  }
}
