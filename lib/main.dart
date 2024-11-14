import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/basics.dart';
import 'package:flutter_tutorial/screens/future_builder.dart';
import 'package:flutter_tutorial/screens/layout.dart';
import 'package:flutter_tutorial/screens/widget_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/basics': (context) => BasicsPage(),
        '/layout': (context) => const LayoutPage(),
        '/widget-state': (context) => const WidgetStatePage(),
        '/future-builder': (context) => const FutureBuilderPage()
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/basics');
                },
                child: const Text("Basics"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layout');
                },
                child: const Text("Layout"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/widget-state');
                },
                child: const Text("Widget State"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/future-builder');
                },
                child: const Text("Future Builder"),
              )
            ],
          );
        }),
      ),
    );
  }
}
