import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class JShimmer extends StatelessWidget {
  const JShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 3), //Default value
      interval: const Duration(seconds: 5), //Default value: Duration(seconds: 0)
      color: Colors.white, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: const ShimmerDirection.fromLTRB(), //Default Value
      child: Container(
        color: Colors.deepPurple,
      ),
    );
  }
}
