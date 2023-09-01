import 'package:flutter/material.dart';
import 'package:halcyon/tailwind/tailwind.dart';
import 'package:halcyon/util/io.dart';
import 'package:halcyon/util/user.dart';
import 'package:provider/provider.dart';

/// This is the main entrypoint into the Halcyon program.
void main() {
  hInitDir();
  hEnsureMasterProperties();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        body: Center(child: HApp()),
      ),
    );
  }
}

class HApp extends StatelessWidget {
  const HApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: tailwind, child: const Column(children: [Text("Hi")]));
  }
}
