import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

typedef UsersWithColors = List<(UserProfileModel, Color)>;

class ContactSelectorPage extends HookConsumerWidget {
  const ContactSelectorPage({
    super.key,
    required this.title,
    required this.onSelected,
  });

  final String title;
  final Function(List<UserProfileModel> selected) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = (localDatabase.get(HiveConstants.LOCAL_DB_USER_PROFILE_KEY)
            as UserProfileModel)
        .friends;

    final selectedUsers = useState<UsersWithColors>([]);
    final textController = useTextEditingController();
    final focusContorller = useFocusNode();
    final filter = useState('');
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 300));

    return Scaffold(
      appBar: SimpleAppBar(title: title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          _buildSearchBox(debouncer, filter, textController, focusContorller),
          _buildSelectedUserChips(selectedUsers),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: friends
                    .where((element) => filter.value.isNotEmpty
                        ? element.username?.contains(filter.value) ?? false
                        : true)
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ListTile(
                            leading: _buildLeading(e, selectedUsers),
                            onTap: () => toggleSelection(selectedUsers, e),
                            title: Text(e.username ?? 'User'),
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: _buildFAB(selectedUsers, context),
    );
  }

  void toggleSelection(
      ValueNotifier<UsersWithColors> selectedUsers, UserProfileModel e) {
    selectedUsers.value = selectedUsers.value.any((el) => el.$1 == e)
        ? selectedUsers.value.where((element) => element.$1 != e).toList()
        : [
            ...selectedUsers.value,
            (
              e,
              CHIP_COLORS[selectedUsers.value.length % CHIP_COLORS.length],
            )
          ].toList();
  }

  Stack _buildLeading(
    UserProfileModel e,
    ValueNotifier<UsersWithColors> selectedUsers,
  ) =>
      Stack(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              e.avatar?.isNotEmpty ?? false
                  ? e.avatar!
                  : ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
            ),
          ),
          if (selectedUsers.value.any((element) => element.$1 == e))
            const Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 6,
                child: Icon(Icons.check, color: Colors.green, size: 12),
              ),
            )
        ],
      );

  _buildSelectedUserChips(ValueNotifier<UsersWithColors> selectedUsers) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            children: selectedUsers.value
                .map((e) => Chip(
                    label: Text(e.$1.username ?? 'User',
                        style: const TextStyle(fontSize: 12)),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(2),
                    backgroundColor: e.$2,
                    onDeleted: () => toggleSelection(selectedUsers, e.$1)))
                .toList(),
          ),
        ),
      );

  FloatingActionButton _buildFAB(
    ValueNotifier<UsersWithColors> selectedUsers,
    BuildContext context,
  ) =>
      FloatingActionButton(
        shape: const CircleBorder(),
        child: const Icon(Icons.check_circle),
        onPressed: () {
          onSelected(selectedUsers.value.map((e) => e.$1).toList());
          Navigator.of(context).pop();
        },
      );

  Padding _buildSearchBox(
    Debouncer debouncer,
    ValueNotifier<String> filter,
    TextEditingController textController,
    FocusNode focusContorller,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: TextField(
          onChanged: (value) => debouncer(() => filter.value = value),
          controller: textController,
          focusNode: focusContorller,
          style: const TextStyle(fontSize: 12),
          decoration: const InputDecoration(
            hintText: 'Search users...',
            border: InputBorder.none,
          ),
        ),
      );
}
