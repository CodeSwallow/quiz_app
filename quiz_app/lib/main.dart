import 'package:flutter/material.dart';
import 'package:quiz_app/pages/choose_quiz_page.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          QuizPage.routeName: (ctx) => const QuizPage(),
          ChooseQuizPage.routeName: (ctx) => const ChooseQuizPage(),
        });
  }
}
