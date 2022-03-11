import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.index, required this.total})
      : super(key: key);
  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: LinearProgressIndicator(
          color: Colors.amber.shade900,
          value: index / total,
          minHeight: 20,
        ),
      ),
    );
  }
}
