import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, constraints) => Row(
              children: [
                Container(
                  color: Colors.red,
                  width: constraints.maxWidth * 0.7,
                ),
                Container(
                  color: Colors.green,
                  width: constraints.maxWidth * 0.3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
