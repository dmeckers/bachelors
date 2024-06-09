// import 'package:fluster/fluster.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:jam/presentation/map/extensions/cluster_map_marker_helper.dart';

// Fluster<T> useFluster<T extends Clusterable>() {
//   return use(_FlusterHook<T>());
// }

// class _FlusterHook<T extends Clusterable> extends Hook<Fluster<T>> {
//   @override
//   _FlusterHookState<T> createState() => _FlusterHookState<T>();
// }

// class _FlusterHookState<T extends Clusterable> extends HookState<Fluster<T>, _FlusterHook<T>> {
//   Fluster<T>? _fluster;

//   @override
//   void initHook() {
//     super.initHook();
//     // Initialize your Fluster instance here
//     MapHelper.initClusterManager(markers, 10, 20);
//   }

//   @override
//   Fluster<T> build(BuildContext context) {
//     return _fluster!;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // Dispose your Fluster instance here if needed
//   }
// }