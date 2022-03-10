import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.index}) : super(key: key);
  final double index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: LinearProgressIndicator(
        color: Theme.of(context).cardTheme.color,
        value: index,
        minHeight: 20,
      ),
    );
  }
}
