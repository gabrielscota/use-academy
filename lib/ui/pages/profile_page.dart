import 'package:flutter/material.dart';

import 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    Map<String, dynamic> argumentsMap = {};
    ProfileNavigationArguments profileArguments = ProfileNavigationArguments(name: '', age: 0, height: 0);

    if (arguments is Map) {
      argumentsMap = arguments as Map<String, dynamic>;
    } else {
      NavigationArguments argumentsClass = arguments as NavigationArguments;
      profileArguments = argumentsClass.arguments as ProfileNavigationArguments;
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Profile Page'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Text('Nome: ${argumentsMap.isNotEmpty ? argumentsMap['name'] : profileArguments.name}'),
                    Text('Idade: ${argumentsMap.isNotEmpty ? argumentsMap['age'] : profileArguments.age}'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Voltar para a home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
