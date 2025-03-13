import 'package:chat_app/services/chat_service.dart';
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
            title: const Text("Report"),
            onTap: () {
              Navigator.pop(context);
              _reportMessage(context,messageId,userId);
            },
          ),

          ListTile(
            textColor: Colors.pink.shade300,
            leading: const Icon(Icons.block_rounded),
            title: const Text("Block user"),
            onTap: () {
              Navigator.pop(context);
              _blockUser(context,userId);
            },),

            ListTile(
            textColor: Colors.pink.shade300,
            leading: const Icon(Icons.cancel_rounded,color: Colors.pink,),
            title: const Text("Cancel"),
            onTap: () {
              Navigator.pop(context);
            },)
        ],
      ));
    });
  }

  void _reportMessage(BuildContext context, String messageId, String userId) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Report message"),
      content: const Text("Are you sure you want to report this message?"),
      actions: [
        TextButton(onPressed: ()=> Navigator.pop(context), child: const Text("No")),
        TextButton(onPressed: (){
          ChatService().reportUser(messageId, userId);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Message has been succesfully reported!"),backgroundColor: Color.fromRGBO(236, 64, 122, 1),));
        }, child: const Text("Yes"))
      ],
    ));
  }

  void _blockUser(BuildContext context, String userId) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Block user"),
      content: const Text("Are you sure you want to block this user?"),
      actions: [
        TextButton(onPressed: ()=> Navigator.pop(context), child: const Text("No")),
        TextButton(onPressed: (){
          ChatService().blockUser(userId);
          Navigator.pop(context);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User has been succesfully blocked!"),backgroundColor: Color.fromRGBO(236, 64, 122, 1)));
        }, child: const Text("Yes"))
      ],
    ));
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
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
        child: Text(message),
      ),
    );
  }
}