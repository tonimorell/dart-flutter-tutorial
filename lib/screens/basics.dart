import 'package:flutter/material.dart';

class BasicsPage extends StatelessWidget {
  const BasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Image.network(
              'https://images.unsplash.com/photo-1533514114760-4389f572ae26?q=80&w=3467&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              width: 150,
              height: 150,
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null
                    ? child
                    : const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print('Button clicked!');
              },
              child: const Text('Click me'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
