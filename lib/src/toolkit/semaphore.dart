import 'dart:async';
import 'dart:collection';

class Semaphore {
  final int maxCount = 1;

  int _counter = 0;
  final _waitQueue = Queue<Completer>();

  Future acquire() {
    var completer = Completer();
    if (_counter + 1 <= maxCount) {
      _counter++;
      completer.complete();
    } else {
      _waitQueue.add(completer);
    }
    return completer.future;
  }

  void release() {
    if (_counter == 0) {
      throw StateError("Unable to release semaphore.");
    }
    _counter--;
    if (_waitQueue.isNotEmpty) {
      _counter++;
      var completer = _waitQueue.removeFirst();
      completer.complete();
    }
  }

  Future<T> execute<T>(Future<T> Function() fn) async {
    await acquire();
    try {
      return await fn();
    } finally {
      release();
    }
  }
}
