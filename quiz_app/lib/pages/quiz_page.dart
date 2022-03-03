import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);
  static const routeName = '/quiz_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 0,
      ),
      body: const Center(child: Text('Quiz Page')),
    );
  }
}
