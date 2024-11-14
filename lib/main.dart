import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/basics.dart';
import 'package:flutter_tutorial/screens/layout.dart';
import 'package:flutter_tutorial/screens/widget_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/basics': (context) => BasicsPage(),
        '/layout': (context) => LayoutPage(),
        '/widget-state': (context) => WidgetStatePage()
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/basics');
                },
                child: Text("Basics"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layout');
                },
                child: Text("Layout"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/widget-state');
                },
                child: Text("Widget State"),
              )
            ],
          );
        }),
      ),
    );
  }
}
