import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, required this.btnText, required this.routeName})
      : super(key: key);
  final String btnText;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(btnText),
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.indigo.shade100,
        elevation: 4,
        side: const BorderSide(width: 1),
      ),
    );
  }
}
