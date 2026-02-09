import 'package:flutter/material.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("For test class")),
      body: Column(
        children: [
          Text("tThis is Text"),
          Row(
            children: [
              Text(
                "This is Row 1",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              Text(
                "This is Row 2",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
