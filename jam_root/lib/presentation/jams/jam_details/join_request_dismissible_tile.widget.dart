import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class JamJoinRequestDismissibleTile extends ConsumerWidget {
  const JamJoinRequestDismissibleTile({
    super.key,
    required this.request,
    required this.jamId,
    required this.child,
  });

  final JamJoinRequestModel request;
  final String jamId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tileGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      transform: const GradientRotation(2.35619),
      colors: [
        Colors.blue.shade900,
        Colors.green.shade700,
      ],
    );
    return Dismissible(
      confirmDismiss: (_) async => request.seenAt != null,
      key: ValueKey(request.id),
      background: DecoratedBox(
          decoration: BoxDecoration(
            gradient: tileGradient,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          )),
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          ref
              .read(jamDetailsStateProvider(int.parse(jamId)).notifier)
              .declineJoinRequest(
                request.id,
                request.userId,
              );
        }

        if (direction == DismissDirection.startToEnd) {
          ref
              .read(jamDetailsStateProvider(int.parse(jamId)).notifier)
              .acceptJoinRequest(
                request.id,
                request.userId,
              );
        }
      },
      child: child,
    );
  }
}
