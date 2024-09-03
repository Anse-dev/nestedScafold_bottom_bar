import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_d/scaffold_nested_navigation.dart';

class PublierPage extends StatelessWidget {
  const PublierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publier')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Publier Page')),
          TextButton(
              onPressed: () {
                context.pushNamed('second');
              },
              child: const Text('Deuxieme ecran'))
        ],
      ),
    );
  }
}
