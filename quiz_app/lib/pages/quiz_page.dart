import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/classes/question.dart';
import 'package:quiz_app/classes/quiz.dart';
import 'package:quiz_app/pages/results_page.dart';
import 'package:quiz_app/widgets/progress_bar.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  static const routeName = '/quiz_page';

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalQuestions = 5;
  int totalOptions = 4;
  int progressIndex = 0;
  int questionIndex = 0;
  Quiz quiz = Quiz(name: 'Countries in American Continent', questions: []);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/americaCountries.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded = [];
    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      if (questionsAdded.contains(answer)) continue;

      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        otherOptions.add(data[option]['capital']);
      }
      Question question = Question.fromJson(data[answer]);
      question.addOptions(otherOptions);
      quiz.questions.add(question);

      if (quiz.questions.length >= totalQuestions) break;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text(quiz.name, style: Theme.of(context).textTheme.headline1),
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProgressBar(index: progressIndex, total: totalQuestions),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: quiz.questions.isNotEmpty
                  ? QuizCard(
                      question: quiz.questions[questionIndex],
                      callback: _optionSelected,
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          TextButton(
              onPressed: () {
                _optionSelected(false, 'Skipped');
              },
              child: const Text('Skip', style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }

  void _optionSelected(bool correct, String selected) async {
    quiz.questions[progressIndex].selected = selected;
    quiz.questions[progressIndex].correct = correct;

    progressIndex += 1;
    if (correct) {
      quiz.right += 1;
    }
    if (questionIndex < totalQuestions - 1) {
      questionIndex += 1;
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => _buildResultDialog(context),
      );
    }
    setState(() {});
  }

  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title:
          Text('Overall Results', style: Theme.of(context).textTheme.headline1),
      backgroundColor: Theme.of(context).primaryColorDark,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Questions: $totalQuestions",
              style: Theme.of(context).textTheme.bodyText1),
          Text("Correct: ${quiz.right}",
              style: Theme.of(context).textTheme.bodyText1),
          Text("Incorrect: ${totalQuestions - quiz.right}",
              style: Theme.of(context).textTheme.bodyText1),
          Text("Percent: ${quiz.percent}%",
              style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(quiz: quiz),
                ));
          },
          child: Text('See questions',
              style: Theme.of(context).textTheme.bodyText1),
        ),
      ],
    );
  }
}
