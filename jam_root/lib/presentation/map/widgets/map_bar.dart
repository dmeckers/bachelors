import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class MapPlaceTopSearchBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const MapPlaceTopSearchBar({
    super.key,
    required this.searchResultsNotifier,
    required this.positionNotifier,
    this.showResultsNotifier,
  });

  final ValueNotifier<List<Prediction>> searchResultsNotifier;
  final ValueNotifier<bool>? showResultsNotifier;
  final ValueNotifier<LatLng?> positionNotifier;

  Future<void> searchPlaces({
    required BuildContext context,
    required GoogleMapsPlaces places,
    required String searchTerm,
    required LatLng? position,
    required int radius,
    required ValueNotifier<List<Prediction>> searchResults,
  }) async {
    if (position == null) {
      return;
    }

    final response = await places.autocomplete(
      searchTerm,
      location: Location(lng: position.longitude, lat: position.latitude),
      radius: 10000,
      strictbounds: true,
      language: S.delegate.supportedLocales.first.languageCode,
    );

    searchResults.value = response.status == 'OK' ? response.predictions : [];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 100));

    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        width: double.infinity,
        height: 80,
        color: context.jColor.secondary,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 100,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: JInputSimple(
              onChanged: (value) => debouncer(() async {
                showResultsNotifier?.value = value.isNotEmpty;
                if (value.isEmpty && showResultsNotifier != null) {
                  showResultsNotifier!.value = false;
                  return;
                }

                await searchPlaces(
                  context: context,
                  places: ref.watch(placesProvider),
                  searchTerm: value,
                  position: positionNotifier.value,
                  // todo
                  radius: 10000,
                  searchResults: searchResultsNotifier,
                );
              }),
              labelLeadingIcon: Icons.search,
              labelText: 'Search your location',
              withTrailingCleaner: true,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(DEFAULT_APP_BAR_HEIGHT + TOOLBAR_HEIGHT - 25);
}
