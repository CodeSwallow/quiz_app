import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/progress_bar.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  static const routeName = '/quiz_page';

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  double progressIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text('Quiz Name', style: Theme.of(context).textTheme.headline1),
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
              child: const QuizCard(),
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
}
