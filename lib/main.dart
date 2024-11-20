import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/basics.dart';
import 'package:flutter_tutorial/screens/cubit.dart';
import 'package:flutter_tutorial/screens/future_builder.dart';
import 'package:flutter_tutorial/screens/future_builder_hero.dart';
import 'package:flutter_tutorial/screens/layout.dart';
import 'package:flutter_tutorial/screens/widget_state.dart';
import 'package:flutter_tutorial/widgets/sliver_layout.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/basics': (context) => const BasicsPage(),
        '/layout': (context) => const LayoutPage(),
        '/widget-state': (context) => const WidgetStatePage(),
        '/future-builder': (context) => const FutureBuilderPage(),
        '/hero': (context) => const HeroPage(),
        '/cubit': (context) => const NotificationsPage()
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _text = '';
  final String _fullText = 'A quien no le va a gustar';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _controller.forward();
    _startTypingAnimation();
  }

  void _startTypingAnimation() async {
    for (int i = 0; i <= _fullText.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        setState(() {
          _text = _fullText.substring(0, i);
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      floatingWidget: Container(),
      heightFactor: 0.35,
      background: Container(
        color: const Color(0xFFFEF3E2),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              flex: 6,
              child: Center(
                child: CircleAvatar(
                  radius: lerpDouble(20, 100, _controller.value),
                  backgroundImage:
                      const NetworkImage('https://i.imgflip.com/5ciw9f.jpg'),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Text(
                  _text,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
      child: Container(
        color: const Color(0xFFFEF3E2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: BentoCard(
                          height: constraints.maxWidth * 0.5,
                          title: 'Basics',
                          imagePath:
                              'https://framerusercontent.com/images/mKNmrfufxBHTS9l22Piymafow.png',
                          subtitle: 'Flutter basics',
                          color: Colors.white,
                          onTap: () => Navigator.pushNamed(context, '/basics'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: BentoCard(
                          height: constraints.maxWidth * 0.5,
                          title: 'Layout',
                          subtitle: 'Flutter basic layout',
                          imagePath:
                              'https://framerusercontent.com/images/OhbBbEkZB1vcoYo6fnT5pSpVU.png',
                          color: const Color(0xFFE5E1FF),
                          onTap: () => Navigator.pushNamed(context, '/layout'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Second row
                  Row(
                    children: [
                      Expanded(
                        child: BentoCard(
                          height: constraints.maxWidth * 0.4,
                          title: 'Widget State',
                          subtitle: 'Stateless vs Stateful',
                          imagePath:
                              'https://framerusercontent.com/images/afj6YqsH9k1Pcvj3ELgBL7w1k.png',
                          color: const Color(0xFFFFB17A),
                          onTap: () =>
                              Navigator.pushNamed(context, '/widget-state'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: BentoCard(
                          height: constraints.maxWidth * 0.4,
                          title: 'Future Builder',
                          subtitle: 'Async await, builders',
                          color: const Color(0xFF2D2D2D),
                          isTextWhite: true,
                          onTap: () =>
                              Navigator.pushNamed(context, '/future-builder'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: BentoCard(
                      height: constraints.maxWidth * 0.6,
                      title: 'Hero',
                      imagePath:
                          'https://framerusercontent.com/images/4qY2X7GEwa0dPdW1UTKKbm5sho.png',
                      subtitle: 'The cool widget',
                      color: const Color.fromARGB(255, 7, 104, 78),
                      isTextWhite: true,
                      onTap: () => Navigator.pushNamed(context, '/hero'),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BentoCard(
                          height: constraints.maxWidth * 0.5,
                          title: 'Cubit',
                          imagePath:
                              'https://i.postimg.cc/px4yLYWN/13-Jan-Update-Items-thumbnail-4.png',
                          subtitle: 'Simple state management',
                          color: const Color.fromARGB(255, 135, 17, 106),
                          isTextWhite: true,
                          onTap: () => Navigator.pushNamed(context, '/cubit'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 3,
                        child: BentoCard(
                          height: constraints.maxWidth * 0.5,
                          title: 'Shit',
                          imagePath:
                              'https://framerusercontent.com/images/90HtVBTbbGU3fzY2KKmUnlo4Ds.png',
                          subtitle: 'Create your shit here',
                          color: const Color.fromARGB(255, 3, 46, 45),
                          isTextWhite: true,
                          onTap: () => Navigator.pushNamed(context, '/cubit'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BentoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final bool isTextWhite;
  final VoidCallback onTap;
  final String? imagePath;
  final double height;

  const BentoCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.color,
      this.isTextWhite = false,
      required this.onTap,
      required this.height,
      this.imagePath =
          'https://i.postimg.cc/9cW2mr75/13-Jan-Update-Items-thumbnail-25.png'});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: kIsWeb ? height / 3 : height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -200,
              right: -50,
              child: ClipRRect(
                child: Container(
                    child: imagePath != ''
                        ? Image.network(
                            imagePath ??
                                'https://i.postimg.cc/9cW2mr75/13-Jan-Update-Items-thumbnail-25.png',
                            fit: BoxFit.cover,
                          )
                        : null),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: kIsWeb ? 18 : 12,
                      fontWeight: FontWeight.bold,
                      color: isTextWhite ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: kIsWeb ? 24 : 14,
                              fontWeight: FontWeight.bold,
                              color: isTextWhite ? Colors.white : Colors.black,
                              overflow: TextOverflow.fade),
                        ),
                      ),
                      Icon(
                        Icons.arrow_outward,
                        color: isTextWhite ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
