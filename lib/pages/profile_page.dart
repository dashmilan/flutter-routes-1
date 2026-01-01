import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Profile page', style: TextStyle(fontSize: 30))),
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
