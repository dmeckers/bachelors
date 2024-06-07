import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class JamListWidget extends HookConsumerWidget {
  const JamListWidget({
    super.key,
    required this.jams,
    this.canCreate = true,
    this.placeholderTitle,
  });

  final List<JamModel> jams;
  final bool canCreate;
  final String? placeholderTitle;

  static const fadeInOffset = Offset(
    DEFAULT_JAM_LIST_ANIMATION_OFFSET_X,
    DEFAULT_JAM_LIST_ANIMATION_OFFSET_Y,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (jams.isEmpty) return _buildJamListPlaceholder(context);

    final viewState = ref.watch(jamCardViewStateProvider);

    return AnimatedSwitcher(
      duration: DURATION_200_MS,
      child: RefreshIndicator(
        onRefresh: () async {
          await ref.read(jamsStateProvider).invalidate();
        },
        child: ListView.builder(
          itemBuilder: (ctx, i) => switch (viewState) {
            JamCardView.big => BigJamCard(jam: jams[i]),
            JamCardView.small => SmallJamCard(jam: jams[i]),
          },
          itemCount: jams.length,
        ),
      ),
    );
  }

  Widget _buildJamListPlaceholder(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NotFoundPlaceholder(),
          FadeIn(
            offset: fadeInOffset,
            child: Text(
              placeholderTitle ?? 'No jams yet, create one by yourself!',
              style: context.jText.bodyMedium,
            ),
          ),
          const SizedBox(height: 20),
          if (canCreate)
            FadeIn(
              offset: fadeInOffset,
              delay: DURATION_200_MS,
              child: ElevatedButton(
                onPressed: () => context.pushNamed(JamRoutes.createNew.name),
                child: const Text('Create'),
              ),
            )
        ],
      ),
    );
  }
}
