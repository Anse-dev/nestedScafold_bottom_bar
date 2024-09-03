import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompteurScreen extends StatefulWidget {
  const CompteurScreen({super.key});

  @override
  _CompteurScreenState createState() => _CompteurScreenState();
}

class _CompteurScreenState extends State<CompteurScreen> {
  int _compteur = 0;

  void _incrementer() {
    setState(() {
      _compteur++;
    });
  }

  void _decrementer() {
    setState(() {
      _compteur--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compteur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Valeur actuelle:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_compteur',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementer,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementer,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
