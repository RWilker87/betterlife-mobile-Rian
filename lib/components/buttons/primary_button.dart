import 'package:flutter/material.dart';
import '../../shared/constants/style_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onPressed});
  final Text text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: kDetailColor),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
          child: text,
        ),
      ),
    );
  }
}
