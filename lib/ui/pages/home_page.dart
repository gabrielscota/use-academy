import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: Colors.red[400],
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => debugPrint('ElevatedButton onPressed'),
                  onLongPress: () => debugPrint('ElevatedButton onLongPressed'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('ElevatedButton'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('OutlinedButton'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
