import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/jams/form/form.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

final refreshProvider = StateProvider<bool>((ref) => false);

typedef UserRequestMap = Map<
    String,
    ({
      UserProfileModel user,
      JamJoinRequestModel request,
    })>;

class JamParticipantsPage extends HookConsumerWidget {
  const JamParticipantsPage({super.key, required this.jamId});

  final String jamId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final refresh = ref.watch(refreshProvider);
    final jam = ref.watch(jamDetailsStateProvider(int.parse(jamId)));

    final requests = jam.requireValue.joinRequests.sortCopy(
      (a, b) => (a.seenAt ?? DateTime(0)).compareTo(b.seenAt ?? DateTime(0)),
    );

    final p = ref.read(profileRepositoryProvidersProvider);
    final userRepo = ref.watch(p.userProfileRepository);
    final users = useState<Users>([]);
    final loaded = useState(false);
    final tabController = useTabController(initialLength: 2);
    final participants = [
      ...jam.requireValue.participants
          .where((p) => p.id != supabase.auth.currentUser!.id)
    ];

    final usersMap = useMemoized<UserRequestMap>(
      () => users.value.fold(
        {},
        (val, el) => val
          ..[el.id] = (
            user: el,
            request: requests.where((req) => req.userId == el.id).first
          ),
      ),
      [
        requests,
        users.value,
      ],
    );

    useEffect(() {
      if (requests.isEmpty) {
        loaded.value = true;
        return null;
      }

      userRepo
          .getUsers(userIds: requests.map((e) => e.userId).toList())
          .then((value) {
        loaded.value = true;
        users.value = value;
      });

      return null;
    }, []);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(DEFAULT_APP_BAR_HEIGHT + TOOLBAR_HEIGHT),
        child: Column(
          children: [
            const SimpleAppBar(
              title: 'Participants page',
            ),
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  child: Text(
                    'Pending',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    'Participanting',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          RefreshIndicator(
            onRefresh: () async {
              // ref.read(refreshProvider.notifier).state = !refresh;
              ref.invalidate(jamDetailsStateProvider(int.parse(jamId)));
              users.value = await userRepo.getUsers(
                userIds: requests.map((e) => e.userId).toList(),
              );
            },
            child: Center(
              child: loaded.value
                  ? _buildListView(
                      usersMap,
                      context,
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(jamDetailsStateProvider(int.parse(jamId)));
              users.value = await userRepo.getUsers(
                userIds: requests.map((e) => e.userId).toList(),
              );
            },
            child: Center(
              child: participants.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (ctx, i) =>
                          _buildTile(context, participants[i]),
                      itemCount: participants.length,
                    )
                  : _buildNotFound(context, 'No participants found'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListView(
    UserRequestMap map,
    BuildContext context,
  ) {
    final pending = map.values
        .map((e) => e.request)
        .where((e) => e.status == ProcessStepTypeEnum.pending);

    if (pending.isEmpty) {
      return _buildNotFound(context);
    }

    return ListView(
      children: [
        ...pending.map(
          (e) => JamJoinRequestDismissibleTile(
            request: e,
            jamId: jamId,
            child: _buildTile(context, map[e.userId]!.user, e),
          ),
        ),
      ],
    );
  }

  Widget _buildNotFound(
    BuildContext context, [
    String message = 'No requests found',
  ]) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.285,
      ),
      child: ListView(
        children: [
          NotFoundPlaceholder(message: message),
        ],
      ),
    );
  }

  ListTile _buildTile(
    BuildContext context,
    UserProfileModel user, [
    JamJoinRequestModel? joinRequest,
  ]) {
    final color = joinRequest?.seenAt != null
        ? context.jColor.primary
        : context.jColor.secondary;

    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => OtherUserProfilePage(
            viewedUserId: user.id,
          ),
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          user.avatarUrlWithPlaceholder,
        ),
      ),
      title: Text(
        user.username?.crop(20) ?? user.fullName?.crop(20) ?? 'Unknown user',
      ),
      subtitle: Text(
        'Last seen at ${user.lastActiveAt.nameWithoutYear}',
        style: const TextStyle(fontSize: 12),
      ),
      trailing: joinRequest.isNull
          ? null
          : TextButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilledFormPage(
                    joinRequest: joinRequest,
                  ),
                ),
              ),
              icon: Icon(
                color: color,
                joinRequest!.seenAt.isNull ? Icons.quiz : Icons.quiz_outlined,
                size: 12,
              ),
              label: Text(
                'See form',
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                ),
              ),
            ),
    );
  }
}
