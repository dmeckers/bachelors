import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_ui/jam_ui.dart';

mixin SelectVibeWidgetsMixin {
  static const MAX_VIBES_AMOUNT = 20;

  int get maxVibesAmount => MAX_VIBES_AMOUNT;

  Widget ValidationErrors(BuildContext context, List selectedVibes) =>
      selectedVibes.length >= MAX_VIBES_AMOUNT
          ? Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 4.0,
              ),
              child: Text(
                'You can select up to $MAX_VIBES_AMOUNT vibes',
                style: context.jText.headlineSmall?.copyWith(color: Colors.red),
              ),
            )
          : const SizedBox();

  Widget SelectedVibeList(
    BuildContext context,
    Vibes selectedVibes,
  ) =>
      selectedVibes.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Selected Vibes: ${selectedVibes.map((el) => el.name).join(',')}',
                style: context.jText.headlineSmall,
              ),
            )
          : const SizedBox();

  Widget Legend() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 10),
            Icon(Icons.circle, color: Colors.orange, size: 14),
            Text('- Focused', style: TextStyle(fontSize: 12)),
            SizedBox(width: 20),
            Icon(Icons.circle, color: Colors.green, size: 14),
            Text(' Selected', style: TextStyle(fontSize: 12)),
            SizedBox(width: 20),
            Icon(Icons.circle, color: Colors.red, size: 14),
            Text('- To remove', style: TextStyle(fontSize: 12)),
            SizedBox(width: 20),
            Icon(Icons.circle_outlined, color: Colors.black, size: 14),
            Text('- Not selected', style: TextStyle(fontSize: 12)),
            SizedBox(width: 10),
          ],
        ),
      );

  Widget asyncWrapped({
    required Widget Function(Vibes) presenter,
    required WidgetRef ref,
    required AsyncValue<Vibes> asyncVibes,
  }) =>
      asyncVibes.maybeWhen(
        orElse: () => const Center(child: CircularProgressIndicator()),
        data: presenter,
      );

  Padding Headline(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Select at least one thing you like',
          style: context.jText.headlineLarge,
        ),
      );

  Padding VibeSearchBar({
    required void Function(String onChange) onChange,
  }) =>
      Padding(
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

  ListTile VibeListTile({
    required void Function() onTap,
    required VibeModel vibe,
    required bool hasSelected,
  }) =>
      ListTile(
        onTap: onTap,
        leading: Icon(
          hasSelected ? FontAwesomeIcons.check : FontAwesomeIcons.plus,
          color: Colors.green,
        ),
        title: Text(vibe.name),
      );
}
