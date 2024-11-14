import 'package:flutter/material.dart';

// StatelessWidget Example
class CounterDisplay extends StatelessWidget {
  final int count;

  const CounterDisplay({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    print('CounterDisplay: build called'); // Lifecycle demonstration
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Count: $count',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

// StatefulWidget Example
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    print('CounterWidget: initState called'); // Lifecycle demonstration
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(
        'CounterWidget: didChangeDependencies called'); // Lifecycle demonstration
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('CounterWidget: didUpdateWidget called'); // Lifecycle demonstration
  }

  @override
  void dispose() {
    print('CounterWidget: dispose called'); // Lifecycle demonstration
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _count++;
      print('CounterWidget: setState called'); // Lifecycle demonstration
    });
  }

  @override
  Widget build(BuildContext context) {
    print('CounterWidget: build called');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CounterDisplay(count: _count),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

class WidgetStatePage extends StatelessWidget {
  const WidgetStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Lifecycle Demo'),
      ),
      body: const Center(
        child: CounterWidget(),
      ),
    );
  }
}
