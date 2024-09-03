import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          const Center(
            child: Text(' Home Screen'),
          ),
          TextButton(
            onPressed: () => context.pushNamed('first'),
            child: const Text('go to first screen'),
          )
        ],
      ),
    );
  }
}
