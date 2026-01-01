import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:gorouteapp/data/user.dart';
import 'package:gorouteapp/pages/age_page.dart';
import 'package:gorouteapp/pages/back_page.dart';
import 'package:gorouteapp/pages/child_page.dart';
import 'package:gorouteapp/pages/home_page.dart';
import 'package:gorouteapp/pages/login.dart';
import 'package:gorouteapp/pages/profile_page.dart';
import 'package:gorouteapp/pages/user_page.dart';
import 'package:gorouteapp/router/route_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/", //mulinma load wenna one mokadda kiyala denna puluwan
    errorPageBuilder: (context, state) {
      //router eke nathi page ekakata giyoth render karana msg eka
      return MaterialPage<dynamic>(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("This page is not found")),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go("/");
                },
                child: Text("Go to Home page"),
              ),
            ],
          ),
        ),
      );
    },

    //user log wela nethanam redirect karanawa
    // redirect: (context, state) {
    //   bool isUserLoggedIn = UserData.isUserLoggedIn;

    //   if (isUserLoggedIn) {
    //     return "/";
    //   } else {
    //     return "/login";
    //   }
    // },
    routes: [
      //Home Page
      GoRoute(
        name: "Home", // kamathi name ekak add karaganna puluwan
        path: "/",
        builder: (context, state) {
          return HomePage();
        },
      ),

      //profile page
      GoRoute(
        // name: 'Profile',
        name: RouteNamesClass.profile,
        path: "/profile",
        builder: (context, state) {
          return ProfilePage();
        },
        //profile/chile kiyana route eka hadaganna widiya
        routes: [
          GoRoute(
            path: "child", //child kiyala dunnahama athi
            builder: (context, state) {
              return ChildPage();
            },
            //profile/child/details kiyana eka me widiyata hadanna puluwan
            // routes: [
            //   GoRoute(
            //     path: "details",
            //     builder: (context, state) {
            //     },
            //   ),
            // ],
          ),
        ],
      ),

      //          //use extra parameter to pass the data
      // GoRoute(
      //   path: "/user",
      //   builder: (context, state) {
      //     /**
      //      *
      //      *  ********* parameters ekak witharak pass karanawa nam me widiyata denawa
      //      *
      //      *  final String name =
      //         state.extra
      //             as String; // 1.  me route eka call karanakota extra parameter ekak pass karaganna one. eka thamai me name eka. mehema thamai eka  hadaganne

      //      *
      //      */

      //     //parameters godak denawa nam me widiyata denawa
      //     //map ekak widiyata ena nisa mehema convert karala ganna one
      //     final  name =
      //         (state.extra
      //                 as Map<
      //                   String,
      //                   dynamic
      //                 >)["name" /*me name kiyana key eka aniwaryaynema pass karana key ekata galapenna one */]
      //             as String;

      //     final  age = (state.extra as Map<String, dynamic>)["age"] as int;
      //     return UserPage(userName: name, userAge: age);
      //   },
      // ),

      // path parameters use karala data pass karana widiya
      GoRoute(
        path: "/user/:name/:age",
        builder: (context, state) {
          return UserPage(
            userName:
                state.pathParameters["name"]!, //path parameters use karanawa
            userAge: int.parse(state.pathParameters["age"]!),
          );
        },
      ),

      GoRoute(
        path: "/age",
        name: RouteNamesClass.age,
        builder: (context, state) {
          //named parameters wala thiyanawa query parameters

          final int age = state.uri.queryParameters['age'] == null
              ? 0
              : int.parse(state.uri.queryParameters['age']!);
          return AgePage(age: age);
        },
      ),

      GoRoute(
        path: "/login",
        builder: (context, state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: "/back",
        builder: (context, state) {
          return BackPage();
        },
      ),
    ],
  );
}
