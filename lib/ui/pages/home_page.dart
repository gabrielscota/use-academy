import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              FirstContainer(),
              const SecondContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondContainer extends StatefulWidget {
  const SecondContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondContainer> createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  late String name;

  @override
  void initState() {
    name = 'Gabriel';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.green[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            const SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = 'João';
                });
                debugPrint(name);
              },
              child: const Text('Trocar nome'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstContainer extends StatelessWidget {
  FirstContainer({
    Key? key,
  }) : super(key: key);

  String name = 'Gabriel';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.blue[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            const SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: () {
                name = 'João';
                debugPrint(name);
              },
              child: const Text('Trocar nome'),
            ),
          ],
        ),
      ),
    );
  }
}
