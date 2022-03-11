import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/classes/question.dart';
import 'package:quiz_app/classes/quiz.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/widgets/progress_bar.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  static const routeName = '/quiz_page';
  final int numberQuestions = 5;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late int totalQuestions;
  int progressIndex = 0;
  int questionIndex = 0;
  late Quiz quiz = Quiz(name: 'Us States', questions: []);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/questions.json');
    final List<dynamic> data = await json.decode(response);
    data.shuffle();
    for (var item in data.sublist(0, totalQuestions)) {
      quiz.questions.add(Question.fromJson(item));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    totalQuestions = widget.numberQuestions;
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
          Text('Timer', style: Theme.of(context).textTheme.headline1),
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
                _optionSelected(false);
              },
              child: const Text('Skip', style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }

  void _optionSelected(bool correct) {
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
    progressIndex += 1;
    setState(() {});
  }

  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Results'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Questions: $totalQuestions"),
          Text("Correct: ${quiz.right}"),
          Text("Incorrect: ${totalQuestions - quiz.right}"),
          Text("Percent: ${quiz.percent}%"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
