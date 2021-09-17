import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            color: Colors.white,
            child: IndexedStack(
              alignment: Alignment.center,
              index: 1,
              children: [
                Container(
                  height: 400,
                  width: 300,
                  color: Colors.red,
                ),
                Container(
                  height: 400,
                  width: 300,
                  color: Colors.green,
                ),
                Container(
                  height: 400,
                  width: 300,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
