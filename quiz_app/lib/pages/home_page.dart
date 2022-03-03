import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Align(
        alignment: Alignment.centerRight,
        child: Container(color: Colors.green, child: Text('omg')),
      ),
      // body: Center(
      //   child: Card(
      //     color: Theme.of(context).primaryColorLight,
      //     child: Column(
      //       children: [],
      //     ),
      //   ),
      // ),
    );
  }
}
