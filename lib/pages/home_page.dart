import 'package:flutter/material.dart';
import 'package:flutter_router/MyModel.dart';
import 'package:flutter_router/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyModel myModel = MyModel(name: "Nabi", family: "Rezai");

  List<MyModel> myList = [
    MyModel(name: "Nabi", family: "Rezai"),
    MyModel(name: "mina", family: "minai"),
    MyModel(name: "Ali", family: "Hassani")
  ];

  final int age = 1365;
  final bool married = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Center(
          child: Column(
            children: [
              const Text("Home", style: TextStyle(fontSize: 30)),
              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(
                        MyAppRouteConstants.contactRouteName,
                        queryParameters: {
                          "name": "Mosayeb",
                          "age": 1365.toString(),
                          "married": false.toString()
                        });
                  },
                  child: const Text("Goto Contact  pass query parameters")),

              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(MyAppRouteConstants.profileRouteName,
                            pathParameters: {
                          "userName": "Mosayeb Masoumi",
                          "city": "Nahavand",
                        });
                  },
                  child: const Text("Goto Profile  pass pathParameters")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(

                      MyAppRouteConstants.aboutRouteName,
                      //     extra: myModel, // to pass object
                      extra: [myModel, myList, age, married],
                    );
                  },
                  child: const Text("Goto About  pass Extra")),
              const SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
