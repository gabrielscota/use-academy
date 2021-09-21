import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/components/components.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Use Academy',
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Use Academy'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.book),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        onTap: (value) => debugPrint(value.toString()),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Sacola',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            MyContainer(),
            MyContainer(),
            MyContainer(),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(24.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.4),
            offset: const Offset(4.0, 4.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.home),
          Expanded(
            child: Text(
              'Meu Container testando o texto overflow',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          const FlutterLogo(
            size: 32.0,
          ),
        ],
      ),
    );
  }
}
