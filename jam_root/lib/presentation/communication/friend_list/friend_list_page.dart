import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class FriendListPage extends HookConsumerWidget with ColorHelper {
  const FriendListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Friend list'),
      backgroundColor: context.jColor.primary,
      body: Center(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8),
              child: ref.watch(chatStream).maybeWhen(
                    data: (data) => data.isEmpty
                        ? const NotFoundPlaceholder(message: 'No friends found')
                        : ListView.separated(
                            separatorBuilder: (ctx, i) => JamDivider(
                              color: context.jColor.onSecondaryContainer,
                            ),
                            itemCount: data.length,
                            itemBuilder: (context, index) => _buildFriendTile(
                              context,
                              data[index],
                            ),
                          ),
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            )
          ],
        ),
      ),
    );
  }

  ShakesOnNoLongPress _buildFriendTile(
    BuildContext context,
    ChatModel chat,
  ) {
    final user = chat.relatedContact;
    return ShakesOnNoLongPress(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        onTap: () => _navigateToChat(context, chat),
        tileColor: context.jColor.secondaryContainer,
        title: _buildTitle(user, context),
        subtitle: _buildSubtitle(user, context),
        leading: _buildTileLeading(user),
        trailing: _buildTileTrailing(user, context),
      ),
    );
  }

  Text _buildTitle(UserProfileModel user, BuildContext context) => Text(
        user.username ?? 'User',
        style: context.jText.bodyMedium?.copyWith(
          color: ColorHelper.colorContrast(context.jColor.secondaryContainer),
        ),
      );

  Text? _buildSubtitle(UserProfileModel user, BuildContext context) =>
      user.profileStatus != null
          ? Text(
              user.profileStatus ?? '',
              style: context.jText.headlineSmall,
            )
          : null;

  HeroAvatar _buildTileLeading(UserProfileModel user) => HeroAvatar(
        isPersonal: false,
        profile: user,
        radius: 23,
      );

  SizedBox _buildTileTrailing(UserProfileModel user, BuildContext context) =>
      SizedBox(
        width: 130,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            user.isOnline
                ? 'Online'
                : 'Last seen ${user.lastSignInAt?.toNTimeAgo()}',
            style: context.jText.bodySmall?.copyWith(
              fontSize: 11,
              color: ColorHelper.colorContrast(
                context.jColor.secondaryContainer,
              ),
            ),
          ),
        ),
      );

  _navigateToChat(BuildContext context, ChatModel chat) => context.pushNamed(
        ChatRoutes.chat.name,
        pathParameters: {ChatRoutes.chat.pathParameter!: chat.id.toString()},
        extra: chat,
      );
}
