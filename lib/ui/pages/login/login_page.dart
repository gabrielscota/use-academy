import 'package:flutter/material.dart';

import '../pages.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  const LoginPage({Key? key, required this.presenter}) : super(key: key);

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
                stream: presenter.emailErrorStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: snapshot.hasData && snapshot.data!.isEmpty ? null : snapshot.data,
                    ),
                    onChanged: presenter.validateEmail,
                  );
                },
              ),
              const SizedBox(height: 12.0),
              StreamBuilder<String>(
                stream: presenter.passwordErrorStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      errorText: snapshot.hasData && snapshot.data!.isEmpty ? null : snapshot.data,
                    ),
                    onChanged: presenter.validatePassword,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              StreamBuilder<bool>(
                stream: presenter.isFormValidStream,
                builder: (context, snapshot) {
                  return ElevatedButton(
                    onPressed: snapshot.hasData && snapshot.data == true ? presenter.auth : null,
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
