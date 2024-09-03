import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrajetPage extends StatelessWidget {
  const TrajetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vos Trajets')),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Trajet Page'),
          ElevatedButton(
            onPressed: () => context.goNamed('details_name'),
            child: const Text('Go to Details'),
          ),
        ],
      )),
    );
  }
}
