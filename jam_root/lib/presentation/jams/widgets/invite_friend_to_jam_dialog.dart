import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class InviteFriendToJamDialog extends ConsumerWidget {
  const InviteFriendToJamDialog({super.key, required this.jamId});

  final int jamId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(getFriendsProvider);
    final invitesAndParticipants = ref.watch(
      getJamInvitesAndParticipantsProvider(jamId: jamId),
    );

    return Stack(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.of(context).pop(),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            child: [invitesAndParticipants, friends].when(
              data: (data) {
                final (invites, participants) = data.first as InvitesAndMembers;
                final friendList = data.last as Users;

                return friendList.isNotEmpty
                    ? _SendInviteFriendListPicker(
                        friendList: friendList,
                        invites: invites,
                        participants: participants,
                        jamId: jamId,
                      )
                    : _buildNoFriendsPlaceholder(context);
              },
              loading: () => _buildLoader(),
              error: (error, _) => const Center(
                child: JamErrorBox(
                  errorMessage:
                      'Whoops! Something went wrong while loading friends',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoader() {
    return const Material(
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildNoFriendsPlaceholder(BuildContext context) {
    final fontColor = ColorHelper.colorContrast(context.jColor.primary);

    return Center(
      child: Text(
        'No friends found',
        style: context.jText.bodyLarge?.copyWith(color: fontColor),
      ),
    );
  }
}

class _SendInviteFriendListPicker extends HookConsumerWidget {
  const _SendInviteFriendListPicker({
    required this.friendList,
    required this.jamId,
    required this.invites,
    required this.participants,
  });

  final int jamId;
  final Users friendList;
  final JamInvites invites;
  final Users participants;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFriends = useState(Users.empty());
    final fontColor = ColorHelper.colorContrast(context.jColor.primary);

    return Material(
      color: context.jColor.primaryContainer,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Who to invite to the jam?',
              style: context.jText.bodyMedium?.copyWith(color: fontColor),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65,
              ),
              child: ListView.separated(
                  separatorBuilder: (ctx, i) => const JamDivider(
                        color: Colors.white60,
                      ),
                  itemBuilder: (ctx, i) => _buildListItem(
                        selectedFriends,
                        friendList[i],
                        invites,
                        participants,
                        context,
                      ),
                  itemCount: friendList.length),
            ),
            _buildModalButtons(context, selectedFriends, ref)
          ],
        ),
      ),
    );
  }

  Material _buildListItem(
    ValueNotifier<Users> selectedFriends,
    UserProfileModel friend,
    JamInvites invites,
    Users participants,
    BuildContext context,
  ) {
    final fontColor = ColorHelper.colorContrast(context.jColor.primary);
    final isParticipating = participants.any((e) => e.id == friend.id);
    final isInvited = invites.any((e) => e.invitedUserId == friend.id);

    return Material(
      child: ListTile(
        tileColor: context.jColor.primaryContainer,
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            friend.avatar ?? ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
          ),
        ),
        title: Text(
          friend.username ?? 'User',
          style: context.jText.bodyMedium?.copyWith(color: fontColor),
        ),
        trailing: isParticipating
            ? _trailing('Participating', faIcon: FontAwesomeIcons.fire)
            : isInvited
                ? _trailing('Invited', faIcon: FontAwesomeIcons.paperPlane)
                : selectedFriends.value.contains(friend)
                    ? const Icon(Icons.mail)
                    : const SizedBox(),
        onTap: () {
          if (isParticipating || isInvited) return;

          selectedFriends.value.contains(friend)
              ? selectedFriends.value =
                  selectedFriends.value.where((e) => e != friend).toList()
              : selectedFriends.value = [...selectedFriends.value, friend];
        },
      ),
    );
  }

  Column _trailing(String text, {IconData? icon, IconData? faIcon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        faIcon != null
            ? FaIcon(
                faIcon,
                size: 17,
              )
            : icon != null
                ? Icon(
                    icon,
                    size: 17,
                  )
                : const SizedBox(),
        const SizedBox(height: 5),
        Text(text),
      ],
    );
  }

  Padding _buildModalButtons(
    BuildContext context,
    ValueNotifier<Users> selectedFriends,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
          if (selectedFriends.value.isNotEmpty)
            TextButton(
              onPressed: () {
                ref.read(
                  sendJamInvitesProvider(
                    jamId: jamId,
                    userIds: selectedFriends.value.map((e) => e.id).toList(),
                  ),
                );

                Navigator.of(context).pop();
                Navigator.of(context).pop();

                JSnackBar.show(
                  context,
                  description: 'Invites to jam sent',
                  type: SnackbarInfoType.info,
                );
              },
              child: const Text(
                'Send',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
