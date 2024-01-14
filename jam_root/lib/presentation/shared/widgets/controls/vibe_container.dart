import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

class VibeContainer extends HookWidget {
  const VibeContainer({
    super.key,
    required this.vibe,
    required this.onTap,
    this.isSelected = false,
    this.withSelectedIndication = true,
  });

  final VibeModel vibe;
  final void Function() onTap;
  final bool withSelectedIndication;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final vibeColor = CHIP_COLORS[vibe.id % CHIP_COLORS.length];
    final s = useState(isSelected);

    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 200,
          decoration: BoxDecoration(
            color: withSelectedIndication
                ? s.value
                    ? Colors.green
                    : vibeColor
                : vibeColor,
            image: vibe.iconUrl != null
                ? DecorationImage(
                    image: CachedNetworkImageProvider(vibe.iconUrl!, scale: 10),
                    repeat: ImageRepeat.repeat,
                  )
                : null,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: Colors.white,
              child: Text(
                vibe.name.capitalize(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (withSelectedIndication) {
                s.value = !s.value;
              }
              onTap();
            },
            child: Ink(
              width: 200,
            ),
          ),
        ),
      ],
    );
  }
}
