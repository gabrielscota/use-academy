import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> loadUserInfo() async {
    debugPrint('Carregando token...');
    const String token = '3126513216513';
    await Future.delayed(const Duration(seconds: 2));
    if (token == '3126513216513' && mounted == true) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void initState() {
    loadUserInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: FlutterLogo(
            size: 128.0,
            style: FlutterLogoStyle.markOnly,
          ),
        ),
      ),
    );
  }
}
