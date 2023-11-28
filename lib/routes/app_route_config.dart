import 'package:flutter/material.dart';
import 'package:flutter_router/MyModel.dart';
import 'package:flutter_router/pages/error_page.dart';
import 'package:flutter_router/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

import '../screens.dart';


/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[

        /****** pass query parameters *******/
        GoRoute(
          name: MyAppRouteConstants.contactRouteName,
          path: 'contact',
          builder: (BuildContext context, GoRouterState state) {
            String name = state.uri.queryParameters["name"]!;
            int age = int.parse(state.uri.queryParameters["age"]!);
            bool married = bool.parse(state.uri.queryParameters["married"]!);
            return ContactPage(
              name: name,
              age: age,
              married: married,
            );
          },
        ),

        /****** pass Object, List , int , String by EXTRA *******/
        GoRoute(
          name: MyAppRouteConstants.aboutRouteName,
          path: 'about',
          builder: (BuildContext context, GoRouterState state) {
            // MyModel myModel = state.extra as MyModel; // -> casting is import
            // List<MyModel> myList = state.extra as List<MyModel>;

            List<dynamic>? extra = state.extra as List?;
            MyModel myModel = extra![0] as MyModel;
            List<MyModel> myList = extra[1] as List<MyModel>;
            int age = extra[2] as int;
            bool married = extra[3] as bool;

            return AboutPage(
              myModel: myModel,
              myList: myList,
              age: age,
              married: married,
            );
          },
        ),

        /****** pass pathParameters *******/
        GoRoute(
          name: MyAppRouteConstants.profileRouteName,
          path: 'profile/:userName/:city', // user (:) to define parameters
          builder: (BuildContext context, GoRouterState state) {
            return ProfilePage(
              userName: state.pathParameters["userName"]!,
              city: state.pathParameters["city"]!,
            );
          },
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: ErrorPage());
  },
  // redirect: (context, state) {
  //   return MyAppRouteConstants.isLoggedIn ? "/about" : "/contact";
  // }
);
