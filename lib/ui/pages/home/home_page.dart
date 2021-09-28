import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../pages.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.presenter.loadPersons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: StreamBuilder<List<PersonEntity>>(
                    stream: widget.presenter.peopleStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(snapshot.data![index].name),
                            subtitle: Text(snapshot.data![index].age.toString()),
                          ),
                        );
                      } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                        return const Center(child: Text('Nenhum resultado encontrado!'));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: widget.presenter.loadPersons,
                  child: const Text('Carregar pessoas'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
