import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({super.key});

  List<dynamic> getGokuCharacters() async {
    try {
      final Uri url = Uri.parse('https://dragonball-api.com/api/characters');
      final response = await http.get(url);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Builder'),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
