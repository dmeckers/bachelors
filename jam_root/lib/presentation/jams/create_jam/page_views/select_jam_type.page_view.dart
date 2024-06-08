import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';

class JamTypeSelectPage extends HookConsumerWidget {
  const JamTypeSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvoked: (_) {
        ref.read(pageListControllerProvider.notifier).reset();
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'JAM TYPE',
              textAlign: TextAlign.center,
              style: context.jText.displayMedium
                  ?.copyWith(fontFamily: rubickFamily, color: Colors.black),
            ),
          ),
          Column(
            children: [
              _buildSection(
                context: context,
                image: ImagePathConstants.JAM_NOW_IMAGE_PATH,
                title: 'Instant jam',
                description: 'Start jamming right now (at least 2 people)',
                color: Colors.amber,
                unavailable: true,
              ),
              _buildSection(
                context: context,
                image: ImagePathConstants.CALL_JAM_IMAGE_PATH,
                title: 'Callout for jam',
                description: 'Let people know you are looking for a jam',
                color: Colors.blue,
                unavailable: true,
              ),
              _buildSection(
                context: context,
                image: ImagePathConstants.PLAN_JAM_IMAGE_PATH,
                title: 'Plan a jam',
                description: 'Schedule a jam for a future date and time',
                color: Colors.green,
                onTap: () {
                  ref
                      .read(pageListControllerProvider.notifier)
                      .addPage(const PickVibePage());

                  ref.read(pageControllerProvider).animateToPage(
                        1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _buildSection({
    required BuildContext context,
    Function? onTap,
    required String image,
    required String description,
    required String title,
    required Color color,
    bool unavailable = false,
  }) {
    final thirdOfHeight = MediaQuery.of(context).size.height / 3;

    return Expanded(
      child: InkWell(
        onTap: onTap != null ? () => onTap() : () {},
        child: Ink(
          height: thirdOfHeight,
          color: color,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: .5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: rubickFamily),
                    ),
                  ),
                  Text(
                    description,
                    style:
                        context.jText.bodySmall?.copyWith(color: Colors.black),
                  ),
                  if (unavailable)
                    Text(
                      '(Unavailable in this version)',
                      style: context.jText.headlineSmall
                          ?.copyWith(color: Colors.black),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
