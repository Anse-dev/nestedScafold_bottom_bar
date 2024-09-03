import 'package:flutter/material.dart';

class AdvancedCounterScreen extends StatefulWidget {
  const AdvancedCounterScreen({super.key});

  @override
  _AdvancedCounterScreenState createState() => _AdvancedCounterScreenState();
}

class _AdvancedCounterScreenState extends State<AdvancedCounterScreen> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compteur Avancé'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Le compteur est à:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _decrement,
              tooltip: 'Décrémenter',
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: _increment,
              tooltip: 'Incrémenter',
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
