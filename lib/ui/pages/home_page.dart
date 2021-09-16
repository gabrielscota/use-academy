import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 100,
              maxHeight: 200,
              minWidth: 150,
              maxWidth: 300,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text("Teste ConstrainedBox"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
