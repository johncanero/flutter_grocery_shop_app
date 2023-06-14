import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // logo
        Padding(
          padding: const EdgeInsets.only(
              left: 80.0, top: 120.0, right: 80.0, bottom: 80.0),
          child: Image.asset('lib/images/avocado.png'),
        ),

        // we deliver groceries at your doorstep
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            "We deliver groceries at your doorstep",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // fresh items everyday
        const Text("Fresh items everyday"),

        const Spacer(),
        // get started button
        Container(
            decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(12.0)),
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            )),

        const Spacer(),
      ],
    ));
  }
}
