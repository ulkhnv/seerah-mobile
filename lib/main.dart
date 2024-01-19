import 'package:flutter/material.dart';

void main() {
  runApp(const SeerahApp());
}

class SeerahApp extends StatelessWidget {
  const SeerahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Seerah"),
        ),
      ),
    );
  }
}
