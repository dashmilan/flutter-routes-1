// flutter pub add go_router

import 'package:flutter/material.dart';

import 'package:gorouteapp/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterClass().router,
    );
  }
}
