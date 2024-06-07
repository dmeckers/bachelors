import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class MapPageAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const MapPageAppBar({super.key});

  Future<void> searchPlaces({
    required WidgetRef ref,
    required String searchTerm,
  }) async {
    final position = ref.watch(
      mapStateViewModelProvider.select((vm) => vm.userCurrentLocation),
    );

    if (position.isNull) {
      return;
    }

    final response = await ref.watch(placesProvider).autocomplete(
          searchTerm,
          location: Location(lng: position!.longitude, lat: position.latitude),
          radius: 10000,
          strictbounds: true,
          language: S.delegate.supportedLocales.first.languageCode,
        );

    ref.read(mapStateViewModelProvider.notifier).setPlacesSearchResults(
          response.status == 'OK' ? response.predictions : [],
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 100));
    final isSearchMode = useState(false);
    final focusNode = useFocusNode();

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: Row(
            key: ValueKey<bool>(isSearchMode.value),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: isSearchMode.value
                ? [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: JInputSimple(
                          onChanged: (value) => debouncer(
                            () async =>
                                await searchPlaces(searchTerm: value, ref: ref),
                          ),
                          inputTrailingWidget: IconButton(
                            onPressed: () {
                              isSearchMode.value = false;
                              ref
                                  .read(mapStateViewModelProvider.notifier)
                                  .setPlacesSearchResults(const []);
                            },
                            icon: const Icon(Icons.close),
                          ),
                          labelText: 'Search your location',
                          inputLeadingWidget: const Icon(Icons.search),
                          inputFocusNode: focusNode,
                          withAnimation: false,
                        ),
                      ),
                    )
                  ]
                : [
                    IconButton(
                      onPressed: () => context.canPop() ? context.pop() : null,
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 10),
                    Text('Local area map', style: context.jText.headlineMedium),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        isSearchMode.value = true;
                        focusNode.requestFocus();
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(DEFAULT_APP_BAR_HEIGHT);
}
