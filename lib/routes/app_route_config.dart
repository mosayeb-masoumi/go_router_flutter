import 'package:flutter/material.dart';
import 'package:flutter_router/MyModel.dart';
import 'package:flutter_router/pages/error_page.dart';
import 'package:flutter_router/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

import '../screens.dart';

// class MyAppRouter {
//   GoRouter router = GoRouter(
//       routes:  <GoRoute> [
//         GoRoute(
//             name: MyAppRouteConstants.homeRouteName,
//             path: "/",
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: HomePage());
//             }),
//
//         GoRoute(
//             name: MyAppRouteConstants.profileRouteName,
//             path: "/profile",
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: ProfilePage());
//             }
//         ),
//
//         // GoRoute(
//         //     path: "/profile",
//         //     builder: (BuildContext context, GoRouterState state) {
//         //       return const ProfilePage();
//         //     }),
//
//         GoRoute(
//             name: MyAppRouteConstants.contactRouteName,
//             path: "/contact",
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: ContactPage());
//             }),
//
//         GoRoute(
//             name: MyAppRouteConstants.aboutRouteName,
//             path: "/about",
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: AboutPage());
//             }),
//       ],
//       errorPageBuilder: (context, state) {
//         return const MaterialPage(child: ErrorPage());
//       });
// }

/// The route configuration.
final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: MyAppRouteConstants.profileRouteName,
            path: 'profile/:userName/:city', // user (:) to define parameters
            builder: (BuildContext context, GoRouterState state) {
              // MyModel myModel = state.extra as MyModel; // -> casting is import
              // List<MyModel> myList = state.extra as List<MyModel>;

              List<dynamic>? extra = state.extra as List?;
              MyModel myModel = extra![0] as MyModel;
              List<MyModel> myList = extra[1] as List<MyModel>;
              int age = extra[2] as int;
              bool married = extra[3] as bool;


              return ProfilePage(
                userName: state.pathParameters["userName"]!,
                city: state.pathParameters["city"]!,
                myList: myList,
                myModel: myModel,
                age: age,
                married: married,
              );
            },
          ),
          GoRoute(
            name: MyAppRouteConstants.contactRouteName,
            path: 'contact',
            builder: (BuildContext context, GoRouterState state) {
              return const ContactPage();
            },
          ),
          GoRoute(
            name: MyAppRouteConstants.aboutRouteName,
            path: 'about',
            builder: (BuildContext context, GoRouterState state) {
              return const AboutPage();
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
