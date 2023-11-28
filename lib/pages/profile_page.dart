import 'package:flutter/material.dart';
import 'package:flutter_router/MyModel.dart';
import 'package:flutter_router/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  final String city;
  final MyModel myModel;
  final List<MyModel> myList;

  final int age;
  final bool married;


  const ProfilePage({super.key,
    required this.userName,
    required this.city,
    required this.myModel,
    required this.myList,
    required this.age,
    required this.married
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Center(
          child: Column(
            children: [
              const Text("Profile", style: TextStyle(fontSize: 30)),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(MyAppRouteConstants.aboutRouteName);
                  },
                  child: const Text("Goto AboutPage")),
              Text("this is ${widget.userName} ${widget.city}"),

              const SizedBox(height: 10,),

              Text("text from object ${widget.myModel.name} ${widget.myModel.family}"),
              Text("first list item ${widget.myList[1].name} ${widget.myList[1].family}"),
              Text("age is ${widget.age} ${widget.married ? "married":"single"}")

            ],
          ),
        ),
      ),
    );
  }
}
