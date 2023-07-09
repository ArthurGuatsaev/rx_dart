import 'package:flutter/material.dart';
import 'package:rx_dart/stream_service.dart';

class StreamFromModel extends StatefulWidget {
  const StreamFromModel({super.key});

  @override
  State<StreamFromModel> createState() => _StreamFromModelState();
}

class _StreamFromModelState extends State<StreamFromModel> {
  List<String> x = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: StreamService().stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            return ListView(
              children: [
                ...(x..add(snapshot.data)).map((e) => ListTile(
                      title: Text(e),
                    ))
              ],
            );
          }),
    );
  }
}
