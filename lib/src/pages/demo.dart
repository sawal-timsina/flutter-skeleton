import 'package:flutter/material.dart';

import '../app.dart';
import '../config/themes/colors.dart';
import '../widgets/atoms/text_input.dart';

class DemoScreenArguments {
  final String phone;

  DemoScreenArguments(this.phone);
}

class Demo extends StatefulWidget {
  const Demo({Key? key, required this.title, this.args}) : super(key: key);

  final String title;
  final DemoScreenArguments? args;

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => App.dismissKeyboard(),
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("asdasd"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(widget.title),
              ElevatedButton(onPressed: () {}, child: Text("asd")),
              TextButton(onPressed: () {}, child: Text("asd")),
              OutlinedButton(
                onPressed: () {},
                child: Text("asdadadasd"),
                style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                      side: const MaterialStatePropertyAll(
                        BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
              ),
              TextInput(
                required: true,
                name: "name",
                label: "Password",
                hintText: "Enter your password",
              )
            ],
          ),
        ),
      ),
    );
  }
}
