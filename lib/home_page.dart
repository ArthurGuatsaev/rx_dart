import 'package:flutter/material.dart';
import 'package:rx_dart/stream_view.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StreamViewTest(
                    streamFirst: Stream.fromIterable(itemsFirst)
                        .interval(const Duration(seconds: 1)),
                    streamSecond: Stream.fromIterable(itemsSecond)
                        .interval(const Duration(seconds: 2)),
                  ))),
        ),
        body: StreamViewTest(
          streamFirst: Stream.fromIterable(itemsFirst)
              .interval(const Duration(seconds: 1)),
          streamSecond: Stream.fromIterable(itemsSecond)
              .interval(const Duration(seconds: 2)),
        ));
  }
}

class StreamWidget extends StatelessWidget {
  final Stream streamFirst;
  final Stream streamSecond;
  const StreamWidget(
      {super.key, required this.streamFirst, required this.streamSecond});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('new screen')),
      body: StreamBuilder(
        stream: ConcatStream([streamFirst, streamSecond]),
        builder: (context, snapshot) {
          return ListTile(
            title: Text('${snapshot.data}'),
          );
        },
      ),
    );
  }
}

List<String> x = [];
List<String> itemsFirst = ['ford', 'ferrary', 'mersedes', 'bmw'];
List<String> itemsSecond = ['Vaz', 'Volga', 'Lada', 'Niva'];


