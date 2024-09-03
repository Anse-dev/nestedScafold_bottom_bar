import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessagesPage extends StatelessWidget {
  final String label;

  const MessagesPage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            TextButton(
                onPressed: () {
                  context.pushNamed('advance');
                },
                child: const Text('advance screen'))
          ],
        ),
      ),
    );
  }
}
