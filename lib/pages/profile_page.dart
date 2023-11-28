import 'package:flutter/material.dart';
import 'package:flutter_router/MyModel.dart';
import 'package:flutter_router/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  final String city;

  const ProfilePage({super.key,
    required this.userName,
    required this.city,
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
              Text("this is ${widget.userName} ${widget.city}"),

            ],
          ),
        ),
      ),
    );
  }
}
