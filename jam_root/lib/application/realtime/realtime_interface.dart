abstract class SingleParameterRealtimeInterface<T, V> {
  Stream<T> get$({
    String? channelIdentifier,
    V? data,
  });

  void dispose() {}
}

abstract class RealtimeInterface<T> {
  Stream<T> get$({
    String? channelIdentifier,
  });

  void dispose() {}
}
