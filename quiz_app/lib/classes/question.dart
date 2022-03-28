class Question {
  late String country;
  String question = 'What is the capital of: ';
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Question.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        answer = json['capital'];

  Map<String, dynamic> toJson() =>
      {'question': question, 'answer': answer, 'options': options};

  void addOptions(List<String> newOptions) {
    question += '$country?';
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }

  List<String> get opsStr {
    List<String> ops = [];
    for (var option in options) {
      ops.add(option as String);
    }
    return ops;
  }
}
