import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String messageId;
  final String userId;



  const ChatBubble({super.key,required this.message, required this.isCurrentUser, required this.messageId, required this.userId});

  void _showOpstions(BuildContext context, String messageId, String userId) {
    showModalBottomSheet(context: context, builder: (context){
      return SafeArea(child: Wrap(
        children: [
          ListTile(
            textColor: Colors.pink.shade300,
            leading: const Icon(Icons.report_rounded),
            title: Text("Report"),
            onTap: () {
              
            },
          ),

          ListTile(
            textColor: Colors.pink.shade300,
            leading: const Icon(Icons.block_rounded),
            title: Text("Block user"),
            onTap: () {
              
            },),

            ListTile(
            textColor: Colors.pink.shade300,
            leading: const Icon(Icons.cancel_rounded,color: Colors.pink,),
            title: Text("Cancel"),
            onTap: () {
              
            },)
        ],
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if(!isCurrentUser) {
          _showOpstions(context, messageId, userId);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentUser ? Colors.pink.shade300 : Colors.pink.shade200,
          borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
        child: Text(message),
      ),
    );
  }
}