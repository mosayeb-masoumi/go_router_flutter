import 'package:flutter/material.dart';
import 'package:flutter_router/routes/app_route_config.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy(); // Go router gr web
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      routeInformationParser: router.routeInformationParser ,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}


