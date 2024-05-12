import 'dart:math' as math;

import 'package:flutter/material.dart';

final expandibleFabKey = GlobalKey<_ExpandableFabState>();

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
    this.buttonIcon,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;
  final IconData? buttonIcon;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool open = false;

  @override
  void initState() {
    super.initState();
    open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  close() {
    setState(() {
      open = false;
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      open = !open;
      if (open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingMapLegendItems(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingMapLegendItems() {
    final children = <Widget>[];
    final count = widget.children.length;
    for (var i = 0; i < count; i++) {
      children.add(
        _ExpandingMapLegendItem(
          order: i,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          open ? 0.7 : 1.0,
          open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: _toggle,
            child: Icon(widget.buttonIcon ?? Icons.map_outlined),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingMapLegendItem extends StatelessWidget {
  const _ExpandingMapLegendItem({
    required this.order,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final int order;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          0.5 * math.pi,
          progress.value * (order + 1) * 60,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.translate(
            offset: offset * (1.0 - progress.value),
            // angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

class MapLegendItem extends StatelessWidget {
  const MapLegendItem({
    super.key,
    this.onPressed,
    required this.text,
    required this.assetPath,
  });

  final VoidCallback? onPressed;
  final String text;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 130,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            // borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 8),
        Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: theme.colorScheme.secondary,
          elevation: 4,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(assetPath),
          ),
        ),
      ],
    );
  }
}
