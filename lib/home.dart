import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text('Home'),
          ),
          ElevatedButton(
            onPressed: () {
              //
              GoRouter.of(context).pushNamed('details');
            },
            child: const Text('To Details Page'),
          ),
        ],
      ),
    );
  }
}
