abstract class RealtimeInterface<T, V> {
  Stream<T> get$({
    String? channelIdentifier,
    V? data,
  });

  void dispose() {}
}
