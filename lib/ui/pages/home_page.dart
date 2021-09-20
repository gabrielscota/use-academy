import 'package:flutter/material.dart';

import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: const [
              FirstContainer(),
              SecondContainer(),
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

class NavigationArguments {
  final String routeName;
  final Object? arguments;

  NavigationArguments({required this.routeName, this.arguments});
}

class ProfileNavigationArguments {
  final String name;
  final int age;
  final double height;

  ProfileNavigationArguments({required this.name, required this.age, required this.height});
}

class _SecondContainerState extends State<SecondContainer> {
  late String text;
  late String name;
  late int age;
  late double height;

  @override
  void initState() {
    text = 'Profile Page';
    name = 'Gabriel';
    age = 21;
    height = 1.75;

    super.initState();
  }

  void goToProfilePage() {
    final ProfileNavigationArguments profileArguments = ProfileNavigationArguments(
      name: name,
      age: age,
      height: height,
    );

    final NavigationArguments arguments = NavigationArguments(
      routeName: '/profile',
      arguments: profileArguments,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
        settings: RouteSettings(
          name: '/profile',
          arguments: arguments,
        ),
      ),
    );
  }

  Color borderColor = Colors.blue;
  Color backgroundColor = Colors.white;
  Widget checkboxContent = const SizedBox();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.green[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: $name'),
            Text('Idade: $age'),
            const SizedBox(height: 16.0),
            Container(
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: borderColor,
                  width: 2.0,
                ),
              ),
              child: checkboxContent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: goToProfilePage,
                  child: const Text('Ir para a tela'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FirstContainer extends StatelessWidget {
  const FirstContainer({
    Key? key,
  }) : super(key: key);

  final String text = 'Profile Page';
  final String name = 'Gabriel';
  final int age = 21;

  void goToProfilePage(BuildContext context) {
    final Map<String, dynamic> arguments = {
      "name": name,
      "age": age,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
        settings: RouteSettings(
          name: '/profile',
          arguments: arguments,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: $name'),
            Text('Idade: $age'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () => goToProfilePage(context),
                  child: const Text('Ir para a tela'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
