import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, required this.btnText}) : super(key: key);
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
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
