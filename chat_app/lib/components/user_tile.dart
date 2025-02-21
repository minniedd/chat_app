import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key,required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
          SizedBox(width: 10,),
          Icon(Icons.wb_cloudy_rounded,color: Colors.white,),
          SizedBox(width: 10,),
          Text(text,style: TextStyle(color: Colors.white),)
        ],),
      ),
    );
  }
}