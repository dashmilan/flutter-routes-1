import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserPage extends StatelessWidget {
  final String userName;
  final int userAge;
  const UserPage({super.key, required this.userName, required this.userAge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("user Name: $userName and user age is :$userAge")),

          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/");
            },
            child: Text("Go to Home page"),
          ),
        ],
      ),
    );
  }
}
