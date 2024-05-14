import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/constants/constants.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/jams/form/form.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

final refreshProvider = StateProvider<bool>((ref) => false);

class JamParticipantsPage extends HookConsumerWidget {
  const JamParticipantsPage({super.key, required this.jamId});

  final String jamId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refresh = ref.watch(refreshProvider);
    final jam = ref.watch(jamDetailsStateProvider(int.parse(jamId)));

    final requests = jam.requireValue.joinRequests.sortCopy(
      (a, b) => (a.seenAt ?? DateTime(0)).compareTo(b.seenAt ?? DateTime(0)),
    );

    final p = ref.read(profileRepositoryProvidersProvider);
    final userRepo = ref.watch(p.userProfileRepository);

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Jam participants page',
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            ref.read(refreshProvider.notifier).state = !refresh;
          },
          child: FutureBuilder(
            future: userRepo.getUsers(
              userIds: requests.map((e) => e.userId).toList(),
            ),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const Center(child: CircularProgressIndicator())
                    : snapshot.hasError
                        ? const Center(
                            child: JamErrorBox(
                              errorMessage: 'Whoops! Something went wrong!',
                            ),
                          )
                        : _buildListView(
                            requests,
                            snapshot.data as List<UserProfileModel>,
                            context,
                          ),
          )),
    );
  }

  ListView _buildListView(
    List<JamJoinRequestModel> requests,
    List<UserProfileModel> users,
    BuildContext context,
  ) {
    final pending =
        requests.where((e) => e.status == ProcessStepTypeEnum.pending);

    return ListView(
      children: [
        ...pending.map(
          (e) {
            final user = users.firstWhere(
              (u) => u.id == e.userId,
              orElse: () => throw 'User not found',
            );

            return JamJoinRequestDismissibleTile(
              request: e,
              jamId: jamId,
              child: ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => OtherUserProfilePage(
                      userId: user.id,
                    ),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    user.avatar ??
                        ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
                  ),
                ),
                title: Text(
                  user.username?.crop(20) ??
                      user.fullName?.crop(20) ??
                      'Unknown user',
                ),
                trailing: TextButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => FilledFormPage(
                        joinRequest: e,
                      ),
                    ),
                  ),
                  icon: Icon(
                    color: e.seenAt != null
                        ? context.jColor.primary
                        : context.jColor.secondary,
                    e.seenAt.isNull ? Icons.quiz : Icons.quiz_outlined,
                    size: 12,
                  ),
                  label: Text(
                    'See form',
                    style: TextStyle(
                      fontSize: 12,
                      color: e.seenAt != null
                          ? context.jColor.primary
                          : context.jColor.secondary,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        if (requests.isEmpty)
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.285,
            ),
            child: const NotFoundPlaceholder(
              message: 'No join requests found',
            ),
          ),
      ],
    );
  }
}

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
