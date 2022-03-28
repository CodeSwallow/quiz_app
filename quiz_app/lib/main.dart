import 'package:flutter/material.dart';
import 'package:quiz_app/pages/review_page.dart';
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
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  color: Colors.purple.shade50.withOpacity(.3),
                  offset: const Offset(3, 3),
                  blurRadius: 5,
                ),
              ],
            ),
            headline2: TextStyle(
              color: Colors.purple.shade50,
              fontSize: 20,
            ),
            bodyText1: TextStyle(
              color: Colors.purple.shade50,
              fontSize: 18,
            ),
          ),
          cardTheme: CardTheme(
            elevation: 8,
            color: Colors.indigo.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          QuizPage.routeName: (ctx) => const QuizPage(),
          ReviewPage.routeName: (ctx) => const ReviewPage(),
        });
  }
}
