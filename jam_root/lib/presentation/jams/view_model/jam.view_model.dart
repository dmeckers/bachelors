import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

part 'jam.view_model.freezed.dart';

@freezed
class JamViewModel with _$JamViewModel {
  const factory JamViewModel({
    @Default('') String creatorId,
    @Default('') String description,
    @Default('') String extraInformation,
    @Default('') String locationName,
    @Default('') String name,
    @Default(false) bool dropBackground,
    int? id,
    UserProfileModel? creator,
    CommunityModel? relatedCommunity,
    BaseJamFormModel? formModel,
    @Default([]) List<JamJoinRequestModel> joinRequests,
    @Default([]) List<UserProfileModel> admins,
    @Default([]) List<UserProfileModel> participants,
    @Default([]) List<VibeModel> relatedVibes,
    double? lat,
    double? lon,
    int? chatId,
    @Default(-1) int maxParticipants,
    @Default(-1) int invitesPerMember,
    @Default('') String iconUrl,
    String? backgroundUrl,
    @Default('') String location,
    DateTime? date,
    @Default(JamJoinTypeEnum.freeToJoin) JamJoinTypeEnum joinType,
    @Default(JamQrModeEnum.none) JamQrModeEnum qrMode,
    File? image,
  }) = _JamViewModel;

  const JamViewModel._();

  JamModel? castToModelIfValid() => isValid()
      ? JamModel(
          creatorId: creatorId,
          description: description,
          extraInformation: extraInformation,
          locationName: locationName,
          name: name,
          dropBackground: dropBackground,
          id: id,
          creator: creator,
          relatedCommunity: relatedCommunity,
          formModel: formModel,
          joinRequests: joinRequests,
          admins: admins,
          participants: participants,
          relatedVibes: relatedVibes,
          lat: lat,
          lon: lon,
          chatId: chatId,
          maxParticipants: maxParticipants,
          invitesPerMember: invitesPerMember,
          iconUrl: iconUrl,
          backgroundUrl: backgroundUrl,
          location: location,
          date: date!,
          joinType: joinType,
          qrMode: qrMode,
          image: image,
        )
      : null;

  factory JamViewModel.fromModel(JamModel model) => JamViewModel(
        creatorId: model.creatorId ?? '',
        description: model.description ?? '',
        extraInformation: model.extraInformation ?? '',
        locationName: model.locationName ?? '',
        name: model.name,
        dropBackground: model.dropBackground,
        id: model.id,
        creator: model.creator,
        relatedCommunity: model.relatedCommunity,
        formModel: model.formModel,
        joinRequests: model.joinRequests,
        admins: model.admins,
        participants: model.participants,
        relatedVibes: model.relatedVibes,
        lat: model.lat,
        lon: model.lon,
        chatId: model.chatId,
        maxParticipants: model.maxParticipants,
        invitesPerMember: model.invitesPerMember,
        iconUrl: model.iconUrl,
        backgroundUrl: model.backgroundUrl,
        location: model.location,
        date: model.date,
        joinType: model.joinType,
        qrMode: model.qrMode,
        image: model.image,
      );

  bool isValid() {
    final areMandatoryFilled = Validators.nameValidator(name).isNull &&
        location.isNotEmpty &&
        date.isNotNull &&
        relatedVibes.isNotEmpty;

    return joinType == JamJoinTypeEnum.freeToJoinAfterForm ||
            joinType == JamJoinTypeEnum.freetoJoinAfterFormAndApprove
        ? areMandatoryFilled && formModel.isNotNull
        : areMandatoryFilled;
  }

  String? validationErros() {
    final areMandatoryFilled = Validators.nameValidator(name).isNull &&
        location.isNotEmpty &&
        date.isNotNull;

    final formValidation = joinType.isWithForm
        ? formModel.isNotNull && formModel!.elements.isNotEmpty
        : true;

    if (!areMandatoryFilled) {
      return 'Mandatory fields are unfilled';
    }

    if (!formValidation) {
      return 'No registration form created';
    }

    if (relatedVibes.isEmpty) {
      return 'No related vibes selected';
    }

    return null;
  }
}

final class JamViewModelStateNotifier extends StateNotifier<JamViewModel> {
  JamViewModelStateNotifier(super.state);

  void updateId(int? id) => state = state.copyWith(id: id);
  void updateLocation(String loc) => state = state.copyWith(location: loc);
  void updateDate(DateTime date) => state = state.copyWith(date: date);
  void updateLat(double? lat) => state = state.copyWith(lat: lat);
  void updateLon(double? lon) => state = state.copyWith(lon: lon);
  void updateChatId(int? chatId) => state = state.copyWith(chatId: chatId);
  void updateIconUrl(String icon) => state = state.copyWith(iconUrl: icon);
  void updateImage(File? value) => state = state.copyWith(image: value);
  void updateName(String value) => state = state.copyWith(name: value);
  void updateCreatorId(String? value) {
    state = state.copyWith(creatorId: value ?? '');
  }

  void updateDescription(String? value) => state = state.copyWith(
        description: value ?? '',
      );

  void updateExtraInformation(String? value) => state = state.copyWith(
        extraInformation: value ?? '',
      );

  void updateLocationName(String? value) => state = state.copyWith(
        locationName: value ?? '',
      );

  void updateCreator(UserProfileModel? creator) => state = state.copyWith(
        creator: creator,
      );

  void updateRelatedCommunity(CommunityModel? value) => state = state.copyWith(
        relatedCommunity: value,
      );

  void updateFormModel(BaseJamFormModel? value) => state = state.copyWith(
        formModel: value,
      );
  void updateMaxParticipants(int value) => state = state.copyWith(
        maxParticipants: value,
      );

  void updateInvitesPerMember(int value) => state = state.copyWith(
        invitesPerMember: value,
      );

  void updateBackgroundUrl(String? value) => state = state.copyWith(
        backgroundUrl: value,
      );

  void updateJoinType(JamJoinTypeEnum value) => state = state.copyWith(
        joinType: value,
      );

  void updateQrMode(JamQrModeEnum value) => state = state.copyWith(
        qrMode: value,
      );

  void addJoinRequests(JamJoinRequestModel joinRequests) =>
      state = state.copyWith(
        joinRequests: [...state.joinRequests, joinRequests],
      );

  void removeJoinRequests(JamJoinRequestModel joinRequests) =>
      state = state.copyWith(
        joinRequests: [
          ...state.joinRequests.where((req) => req != joinRequests)
        ],
      );

  void addAdmins(UserProfileModel admins) => state = state.copyWith(
        admins: [...state.admins, admins],
      );

  void removeAdmins(UserProfileModel admins) => state = state.copyWith(
        admins: [
          ...state.admins.where((admin) => admin != admins),
        ],
      );

  void addParticipants(UserProfileModel participants) => state = state.copyWith(
        participants: [...state.participants, participants],
      );

  void removeParticipants(UserProfileModel participants) =>
      state = state.copyWith(
        participants: [
          ...state.participants
              .where((participant) => participant != participants)
        ],
      );

  void addRelatedVibes(VibeModel relatedVibes) => state = state.copyWith(
        relatedVibes: [...state.relatedVibes, relatedVibes],
      );

  void removeRelatedVibes(VibeModel relatedVibes) => state = state.copyWith(
        relatedVibes: [
          ...state.relatedVibes.where((element) => element != relatedVibes)
        ],
      );

  void updateDropBackground(bool value) => state = state.copyWith(
        dropBackground: value,
      );
}

final jamViewModelStateProvider = StateNotifierProvider.family
    .autoDispose<JamViewModelStateNotifier, JamViewModel, JamModel>(
  (ref, model) => JamViewModelStateNotifier(
    JamViewModel.fromModel(model),
  ),
);

final freshJamViewModelStateProvider =
    StateNotifierProvider.autoDispose<JamViewModelStateNotifier, JamViewModel>(
  (ref) => JamViewModelStateNotifier(
    const JamViewModel(),
  ),
);
