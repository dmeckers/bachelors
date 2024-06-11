import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_ui/jam_ui.dart';

mixin SelectVibeWidgetsMixin {
  static const MAX_VIBES_AMOUNT = 20;

  int get maxVibesAmount => MAX_VIBES_AMOUNT;

  Widget ValidationErrors(BuildContext context, List selectedVibes) {
    return selectedVibes.length >= MAX_VIBES_AMOUNT
        ? Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 4.0,
                bottom: 100,
              ),
              child: Text(
                'You can select up to $MAX_VIBES_AMOUNT vibes',
                style: context.jText.headlineSmall?.copyWith(color: Colors.red),
              ),
            ),
          )
        : const SizedBox();
  }

  Widget SelectedVibeList(
    BuildContext context,
    List<VibeModel> selectedVibes,
  ) {
    return selectedVibes.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Selected Vibes: ${selectedVibes.map((el) => el.name).join(',')}',
              style: context.jText.headlineSmall,
            ),
          )
        : const SizedBox();
  }

  Widget asyncWrapped({
    required Widget Function(Vibes) presenter,
    required WidgetRef ref,
    required AsyncValue<List<VibeModel>> asyncVibes,
  }) =>
      asyncVibes.maybeWhen(
        orElse: () => const Center(child: CircularProgressIndicator()),
        data: presenter,
      );

  Padding Headline(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Select at least one thing you like',
        style: context.jText.headlineLarge,
      ),
    );
  }

  Padding VibeSearchBar({
    required void Function(String onChange) onChange,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        constraints: const BoxConstraints(
          maxHeight: 60,
          minHeight: 60,
        ),
        leading: const Icon(Icons.search),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        hintText: 'Find topics you like',
        onChanged: onChange,
      ),
    );
  }

  ListTile VibeListTile({
    required void Function() onTap,
    required VibeModel vibe,
    required bool hasSelected,
  }) {
    return ListTile(
      onTap: onTap,
      // () => hasSelected
      //     ? notifier.removeVibe(vibe: vibe)
      //     : notifier.addVibe(vibe: vibe),
      leading: Icon(
        hasSelected ? FontAwesomeIcons.check : FontAwesomeIcons.plus,
        color: Colors.green,
      ),
      title: Text(vibe.name),
    );
  }
}
