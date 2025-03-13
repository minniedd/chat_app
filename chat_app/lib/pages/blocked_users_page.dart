import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:flutter/material.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({super.key});

  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  void _showUnblockBox(BuildContext context, String userId) {
    showDialog(context: context, builder:(context)=> AlertDialog(
      title: const Text("Unblock user"),
      content: const Text("Are you sure you want to unblock this user?"),
      actions: [
        TextButton(onPressed:()=> Navigator.pop(context), child: const Text("No")),
        TextButton(onPressed: (){
          ChatService().unblockUser(userId);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User has been succesfully unblocked!"),backgroundColor: Color.fromRGBO(236, 64, 122, 1)));
        }, child: const Text("Yes"))
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    String userId = authService.getCurrentUser()!.uid;

    return Scaffold(
        appBar: AppBar(
          title: Text("blocked users"),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.pink.shade300,
          elevation: 0,
        ),
        body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: chatService.getBlockedUsers(userId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error loading..."),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final blockedUsers = snapshot.data ?? [];

            if(blockedUsers.isEmpty) {
              return const Center(
                child: Text("No blocked users!",style: TextStyle(color: Color.fromRGBO(236, 64, 122, 1),fontWeight: FontWeight.bold),),
              );
            }

            return ListView.builder(itemCount: blockedUsers.length,itemBuilder: (context,index){
              final user = blockedUsers[index];

              return UserTile(text: user["email"], onTap: ()=>_showUnblockBox(context,user['uid']));
            });
          },
        ));
  }
}
