import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String ButtonText;
  const MyButton({super.key,required this.ButtonText,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Text(ButtonText,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),),
        ),
      ),
    );
  }
}