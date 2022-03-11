import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/classes/question.dart';
import 'package:quiz_app/classes/quiz.dart';
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
  double progressIndex = 0;
  int questionIndex = 0;
  late Quiz quiz = Quiz(name: 'Us States', questions: []);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/questions.json');
    final List<dynamic> data = await json.decode(response);
    for (var item in data) {
      quiz.questions.add(Question.fromJson(item));
    }
    quiz.questions.shuffle();
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
          Text('Timer', style: Theme.of(context).textTheme.headline1),
          ProgressBar(index: progressIndex),
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
                setState(() {
                  progressIndex += .1;
                });
              },
              child: const Text('Skip', style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }

  void _optionSelected(bool correct) {
    if (correct) {
      print('Correct');
    } else {
      print('Not correct');
    }
  }
}
