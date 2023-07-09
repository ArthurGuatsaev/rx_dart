import 'dart:async';

class StreamService {
  StreamService() {
    load();
  }
  final StreamController _controllerStream = StreamController<String>();
  Stream get stream => _controllerStream.stream;
  final List<String> cars = [
    'ford',
    'mersedes',
    'bmw',
    'audy',
    'ferrary',
  ];
  final List<String> city = [
    'london',
    'paris',
    'moscow',
    'vladikavkaz',
    'mahachkala'
  ];

  void load() async {
    for (var i in [...cars, ...city]) {
      await Future.delayed(const Duration(seconds: 1));
      _controllerStream.add(i);
    }
  }
}
