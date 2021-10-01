import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    widget.presenter.navigateToStream.listen((event) {
      if (event.isNotEmpty) {
        Get.offAllNamed(event);
      }
    });

    widget.presenter.userCredentialErrorStream.listen((event) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 32.0,
              ),
              const SizedBox(width: 12.0),
              Text(event),
            ],
          ),
          backgroundColor: Colors.red.shade400,
          duration: const Duration(seconds: 5),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                stream: widget.presenter.emailErrorStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: snapshot.hasData && snapshot.data!.isEmpty ? null : snapshot.data,
                    ),
                    onChanged: widget.presenter.validateEmail,
                  );
                },
              ),
              const SizedBox(height: 12.0),
              StreamBuilder<String>(
                stream: widget.presenter.passwordErrorStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      errorText: snapshot.hasData && snapshot.data!.isEmpty ? null : snapshot.data,
                    ),
                    onChanged: widget.presenter.validatePassword,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              StreamBuilder<bool>(
                stream: widget.presenter.isFormValidStream,
                builder: (context, snapshot) {
                  return ElevatedButton(
                    onPressed: snapshot.hasData && snapshot.data == true ? widget.presenter.auth : null,
                    child: const Text('Entrar'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
