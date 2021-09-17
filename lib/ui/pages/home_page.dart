import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: 400,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(height: 16.0, width: 16.0),
            itemBuilder: (context, index) {
              final String text = 'Item ${index + 1}';
              final String date = DateTime.now().day.toString();

              return Container(
                color: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 200,
                alignment: Alignment.center,
                child: Text(
                  '$text - Dia: $date',
                  style: const TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
