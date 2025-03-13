import 'package:chat_app/pages/blocked_users_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.pink.shade300,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(12)
            ),
            margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blocked users",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade300
                  ),
                ),
                IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> BlockedUsersPage())), icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.pink.shade400,))
              ],
            ),
          )
        ],
      ),
    );
  }
}