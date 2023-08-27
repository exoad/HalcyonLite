import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This is the main entrypoint into the Halcyon program.
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(children: [
          ChangeNotifierProvider(create: (_) {}, child: const Text("yes")),
        ])),
      ),
    );
  }
}
