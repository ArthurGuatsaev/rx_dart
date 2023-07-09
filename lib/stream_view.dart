import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'home_page.dart';

class StreamViewTest extends StatefulWidget {
  final Stream streamFirst;
  final Stream streamSecond;
  const StreamViewTest({super.key, required this.streamFirst, required this.streamSecond});

  @override
  State<StreamViewTest> createState() => _StreamViewTestState();
}

class _StreamViewTestState extends State<StreamViewTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: ConcatStream([widget.streamFirst, widget.streamSecond]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView(
                children: [...(x..add(snapshot.data.toString())).map((e) => Text(e))],
              ),
            );
          } else {
            return const Center(
              child: Text('no data'),
            );
          }
        },
      ),
    );
  }
}
