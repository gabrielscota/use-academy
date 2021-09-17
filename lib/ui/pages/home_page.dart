import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              title: const Text('Titulo'),
              subtitle: const Text('Sub titulo'),
              leading: CircleAvatar(
                child: const Text('G'),
                backgroundImage: Image.asset('lib/assets/images/image01.jpg').image,
                foregroundColor: Colors.red,
              ),
              // trailing: InkWell(
              //   onTap: () => debugPrint('onTap no trailing: $index'),
              //   child: const Icon(Icons.edit),
              // ),
              tileColor: Colors.blue[200],
              onTap: () => debugPrint('onTap no trailing: $index'),
              horizontalTitleGap: 32.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          ),
        ),
      ),
    );
  }
}
