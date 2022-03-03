import 'package:flutter/material.dart';

class ChooseQuizPage extends StatelessWidget {
  const ChooseQuizPage({Key? key}) : super(key: key);
  static const routeName = '/choose_quiz_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 0,
      ),
      body: const Center(child: Text('Choose Quiz Page')),
    );
  }
}
