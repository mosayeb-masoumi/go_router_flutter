import 'package:flutter/material.dart';
import 'package:flutter_router/MyModel.dart';


class ContactPage extends StatefulWidget {

  final String name;
  final int age;
  final bool married;

  const ContactPage({super.key, required this.name, required this.age, required this.married,});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SizedBox(
        child: Center(
          child: Column(
            children: [
               const Text("Contact Page", style: TextStyle(fontSize: 30)),
               const SizedBox(height: 20,),
               Text(widget.name, style: const TextStyle(fontSize: 30)),
               Text("age: ${widget.age}", style: const TextStyle(fontSize: 30)),
               Text(widget.married? "Married": "Single", style: const TextStyle(fontSize: 30)),

            ],
          ),
        ),
      ),
    );
  }
}
