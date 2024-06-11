import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_ui/jam_ui.dart';

class InviteFriendToJamDialog extends ConsumerWidget {
  const InviteFriendToJamDialog({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invitesAndParticipants = ref.watch(
      getJamInvitesAndParticipantsProvider(jamId: jam.id!),
    );

    return Stack(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.pop(),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            child: invitesAndParticipants.when(
              data: (invitesAndParticipants) {
                final (invites, participants) = invitesAndParticipants;
                // final friendList = data.last as Users;
                final user = ref.watch(userStateProvider).getLastValue();
                final friendList = user.friends;

                return friendList.isNotEmpty
                    ? _SendInviteFriendListPicker(
                        friendList: friendList,
                        invites: invites,
                        participants: participants,
                        jam: jam,
                      )
                    : Material(
                        child: InkWell(
                          onTap: () => context.pop(),
                          child: Ink(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.8,
                            color: context.jColor.primaryContainer,
                            child: const NotFoundPlaceholder(
                              message: 'No one to invite to found',
                            ),
                          ),
                        ),
                      );
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
}

class _SendInviteFriendListPicker extends HookConsumerWidget {
  const _SendInviteFriendListPicker({
    required this.friendList,
    required this.jam,
    required this.invites,
    required this.participants,
  });

  final JamModel jam;
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
              'Who you wanna invite?',
              style: context.jText.bodyMedium?.copyWith(color: fontColor),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
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
                itemCount: friendList.length,
              ),
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
    final isParticipating = [
      ...participants,
      UserProfileModel(
        id: jam.creatorId!,
        lastActiveAt: DateTime.now(),
        fullName: 'Me',
      )
    ].any((e) => e.id == friend.id);
    final isInvited = invites.any((e) => e.invitedUserId == friend.id);

    return Material(
      child: ListTile(
        tileColor: context.jColor.primaryContainer,
        leading: CircleAvatar(backgroundImage: friend.avatarImageProvider),
        title: Text(
          friend.username ?? 'User',
          style: context.jText.bodyMedium?.copyWith(color: fontColor),
        ),
        trailing: isParticipating
            ? _trailing('Participating', faIcon: FontAwesomeIcons.fire)
            : isInvited
                ? _trailing('Invited', faIcon: FontAwesomeIcons.paperPlane)
                : selectedFriends.value.contains(friend)
                    ? _trailing('To send', icon: Icons.mail)
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
                    jamId: jam.id!,
                    users: selectedFriends.value,
                  ),
                );

                Navigator.of(context).pop();
                Navigator.of(context).pop();

                JSnackBar.show(
                  context,
                  const JSnackbarData(
                    description: 'Invites to jam sent',
                    type: SnackbarInfoType.info,
                  ),
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
