import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/classes/question.dart';
import 'package:quiz_app/classes/quiz.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);
  static const routeName = '/review_page';

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late Quiz quiz = Quiz(name: 'Us States', questions: []);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/questions.json');
    final List<dynamic> data = await json.decode(response);
    for (var item in data) {
      quiz.questions.add(Question.fromJson(item));
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
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin:
                const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo.shade50, width: 1)),
            child: Center(
              child: Text("Questions: ${quiz.questions.length}",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo.shade50, width: 1)),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: quiz.questions.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Theme.of(context).primaryColorLight,
                      child: ListTile(
                        leading: Text("${index + 1}"),
                        title: Text(quiz.questions[index].question),
                        // subtitle: Text(quiz.questions[index].selected),
                        trailing: Text(quiz.questions[index].answer),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
