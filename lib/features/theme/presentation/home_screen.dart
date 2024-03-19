import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                ref.read(themeProvider.notifier).toggle();
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              ListTile(
                title: const Text('Photos'),
                onTap: () {
                  // Navigator.of(context).pushNamed('/photos');
                },
              ),
              ListTile(
                title: const Text('Themes'),
                onTap: () {
                  // Navigator.of(context).pushNamed('/themes');
                },
              ),
            ],
          ),
        ));
  }
}
