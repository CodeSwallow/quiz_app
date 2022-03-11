import 'package:flutter/material.dart';
import 'package:quiz_app/classes/question.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key, required this.question, required this.callback})
      : super(key: key);
  final Question question;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    final int rightIndex =
        question.options.indexWhere((element) => element == question.answer);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(question.question,
                style: Theme.of(context).textTheme.headline2),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo.shade100, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  leading: Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  title: Text(question.options[index],
                      style: Theme.of(context).textTheme.bodyText1),
                  onTap: () {
                    bool correct = false;
                    if (rightIndex == index) {
                      correct = true;
                    }
                    callback(correct, question.options[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
