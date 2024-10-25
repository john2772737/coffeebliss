import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Coffee Bliss",
          theme: state.themeData.copyWith(
            iconTheme: IconThemeData(color: state.iconColor), // Set icon color for the theme
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedItemColor: state.iconColor,
              selectedItemColor: state.iconColor,
            ),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Bliss"),
        centerTitle: true,
        leading: const Icon(Icons.coffee), // No need to set color here
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(Themebutton());
            },
            icon: Icon(
              BlocProvider.of<ThemeBloc>(context).state is ThemeLight
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Coffee Bliss',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'We provide amazing beans that suit your taste. Discover our products now!',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {}, // Button action
                      child: const Text('Get Started'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

