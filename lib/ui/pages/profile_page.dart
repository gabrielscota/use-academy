import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool isCorrect;

  @override
  void initState() {
    isCorrect = true;
    debugPrint(isCorrect.toString());
    loadAvatar();

    super.initState();
  }

  @override
  void dispose() {
    isCorrect = false;
    debugPrint(isCorrect.toString());

    super.dispose();
  }

  bool isLoadedAvatar = false;
  Future<void> loadAvatar() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoadedAvatar = true;
    });
  }

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
              isLoadedAvatar
                  ? Container(
                      height: 96.0,
                      width: 96.0,
                      margin: const EdgeInsets.only(bottom: 16.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        'G',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 96.0,
                        width: 96.0,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Text(
                          'G',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                    ),
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
