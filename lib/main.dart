import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My iOS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _colors = [
    Colors.indigo,
    Colors.teal,
    Colors.deepOrange,
    Colors.pink,
    Colors.green,
  ];

  int _taps = 0;
  int _colorIndex = 0;

  Color get _color => _colors[_colorIndex];

  void _increment() => setState(() => _taps++);

  void _reset() => setState(() => _taps = 0);

  void _nextColor() =>
      setState(() => _colorIndex = (_colorIndex + 1) % _colors.length);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: _color.withValues(alpha: 0.08),
      appBar: AppBar(
        title: const Text('My iOS App'),
        backgroundColor: _color,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            tooltip: 'Change color',
            onPressed: _nextColor,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_iphone, size: 72, color: _color),
              const SizedBox(height: 16),
              Text(
                'Built on Windows,\nrunning on ${defaultTargetPlatform.name}!',
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              Text('Taps', style: textTheme.titleMedium),
              Text(
                '$_taps',
                style: textTheme.displayLarge?.copyWith(color: _color),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        backgroundColor: _color,
        foregroundColor: Colors.white,
        tooltip: 'Tap',
        child: const Icon(Icons.add),
      ),
    );
  }
}
