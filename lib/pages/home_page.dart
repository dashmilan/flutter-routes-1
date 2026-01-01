import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouteapp/router/route_names.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Home page', style: TextStyle(fontSize: 30))),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).go("/profile");
              GoRouter.of(context).goNamed(
                RouteNamesClass.profile,
              ); //named route ekak use karanawa
            },
            child: Text("Go to profile"),
          ),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/profile/child");
            },
            child: Text("Go to Child page"),
          ),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).go(
              //   "/user",
              //   extra: {
              //     "name":
              //         "Samin chandeepa", //2. route page ekedi extra eka hadagannawa. 3.methanin eka pass karanawa
              //     "age": 25,
              //   },
              // );

              //path parameters walid data pass karana widiya

              String names = 'samin ';
              int age = 25;
              GoRouter.of(context).go("/user/$names/$age");
            },
            child: Text("Go to Child page"),
          ),

          //query parameters walin data pass karanwa
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(
                RouteNamesClass.age,
                queryParameters: {
                  "age": "24",
                }, //unit 4 lesson 1 1.08.00 balanna
              ); //named parameters (goNamed) nathnam query parameters use karanna be.
            },
            child: Text("Go to Age page"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(
                context,
              ).push("/back"); //push kiyala dunnahama back wenna puluwan
            },
            child: Text("Go to Back page"),
          ),
        ],
      ),
    );
  }
}
