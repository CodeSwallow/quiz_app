import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child:
                Text('Question', style: Theme.of(context).textTheme.headline2),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
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
                  title: Text('Options',
                      style: Theme.of(context).textTheme.bodyText1),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
