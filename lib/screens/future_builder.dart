import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Character {
  final int id;
  final String name;
  final String race;
  final String image;
  final String ki;

  Character({
    required this.id,
    required this.name,
    required this.race,
    required this.image,
    required this.ki,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      race: json['race'] ?? '',
      image: json['image'] ?? '',
      ki: json['ki'] ?? '',
    );
  }
}

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({super.key});

  Future<List<Character>> getGokuCharacters() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final Uri url = Uri.parse('https://dragonball-api.com/api/characters');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['items'];
        return jsonData.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load characters. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dragon Ball Characters'),
      ),
      body: FutureBuilder<List<Character>>(
        key: const Key('future_builder_key'),
        future: getGokuCharacters(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${snapshot.error ?? 'Unknown error'}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Very interesting way to force a rebuild of the widget but unusefull for stateless widgets, this is not retry again the future builder
                      // We might use a StatefulWidget to control the retry and lifecycle
                      (context as Element).markNeedsBuild();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No characters found'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final character = snapshot.data![index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(character.image),
                  title: Text(
                    character.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Race: ${character.race}'),
                  trailing: Chip(
                    label: Text(
                      'Ki: ${character.ki}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
