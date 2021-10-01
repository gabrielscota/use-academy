import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../pages.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);

    widget.presenter.loadPersons();

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      widget.presenter.loadPersons();
    }
    debugPrint('AppLifecycleState: $state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Use Academy'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            final logoutStatus = await widget.presenter.logout();
            if (logoutStatus == true) {
              Get.offAllNamed('/login');
            }
          },
          icon: Icon(
            Icons.logout_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
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
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
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
