import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Debouncer useDebouncer({required Duration duration}) {
  return use(_DebouncerHook(duration: duration));
}

class _DebouncerHook extends Hook<Debouncer> {
  final Duration duration;
  const _DebouncerHook({required this.duration});

  @override
  _DebouncerHookState createState() => _DebouncerHookState();
}

class _DebouncerHookState extends HookState<Debouncer, _DebouncerHook> {
  late Debouncer debouncer;

  @override
  void initHook() {
    super.initHook();
    debouncer = Debouncer(delay: hook.duration);
  }

  @override
  Debouncer build(BuildContext context) {
    return debouncer;
  }

  @override
  void dispose() {
    super.dispose();
    debouncer.dispose();
  }
}

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer?.cancel();
  }
}
