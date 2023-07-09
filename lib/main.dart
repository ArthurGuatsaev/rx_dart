import 'package:flutter/material.dart';
import 'package:rx_dart/stream_frommodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override   
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StreamFromModel(),
    );
  }
}
