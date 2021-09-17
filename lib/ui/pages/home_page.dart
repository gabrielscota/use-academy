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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                color: Colors.lightGreen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
