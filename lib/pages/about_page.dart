
import 'package:flutter/material.dart';

import '../MyModel.dart';

class AboutPage extends StatefulWidget {

  final MyModel myModel;
  final List<MyModel> myList;
  final int age;
  final bool married;

  const AboutPage({super.key,
    required this.myModel,
    required this.myList,
    required this.age,
    required this.married});



  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body:  SizedBox(
        child: Center(
          child: Column(
            children: [
              const Text("About Page", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 20,),
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
