// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam.model.dart';

// **************************************************************************
// ViewModelGenerator
// **************************************************************************

// ***************************************************************************
// Author: Dmitry Mecker https://github.com/dmeckers
// ***************************************************************************

final class JamViewModel {
  final JamBaseFormModel creatorIdFormModel;
  final JamBaseFormModel descriptionFormModel;
  final JamBaseFormModel extraInformationFormModel;
  final JamBaseFormModel locationNameFormModel;
  final JamBaseFormModel nameFormModel;

  final bool dropBackground;
  final int? id;
  final UserProfileModel? creator;
  final CommunityModel? relatedCommunity;
  final BaseJamFormModel? formModel;
  final List<JamJoinRequestModel> joinRequests;
  final List<UserProfileModel> admins;
  final List<UserProfileModel> participants;
  final List<VibeModel> relatedVibes;
  final double? lat;
  final double? lon;
  final int? chatId;
  final int maxParticipants;
  final int invitesPerMember;
  final String iconUrl;
  final String? backgroundUrl;
  final String location;
  final DateTime? date;
  final JamJoinTypeEnum joinType;
  final JamQrModeEnum qrMode;
  final File? image;

  const JamViewModel({
    this.id,
    this.creator,
    this.relatedCommunity,
    this.formModel,
    required this.creatorIdFormModel,
    required this.descriptionFormModel,
    required this.extraInformationFormModel,
    required this.locationNameFormModel,
    required this.nameFormModel,
    this.dropBackground = false,
    this.lat = -1,
    this.lon = -1,
    this.chatId = -1,
    this.maxParticipants = -1,
    this.invitesPerMember = -1,
    this.joinRequests = const [],
    this.admins = const [],
    this.participants = const [],
    this.relatedVibes = const [],
    this.iconUrl = '',
    this.backgroundUrl = '',
    this.location = '',
    this.date,
    this.joinType = JamJoinTypeEnum.freeToJoin,
    this.qrMode = JamQrModeEnum.none,
    this.image,
  });

  factory JamViewModel.generate() {
    return JamViewModel(
        creatorIdFormModel: JamBaseFormModel.generate(
            labelText: 'Creator Id',
            validator: (value) {
              return null;
            }),
        descriptionFormModel: JamBaseFormModel.generate(
            labelText: 'Description',
            validator: (value) {
              return null;
            }),
        extraInformationFormModel: JamBaseFormModel.generate(
            labelText: 'Extra Information',
            validator: (value) {
              return null;
            }),
        locationNameFormModel: JamBaseFormModel.generate(
            labelText: 'Location Name',
            validator: (value) {
              return null;
            }),
        nameFormModel: JamBaseFormModel.generate(
            labelText: 'Name',
            validator: (value) {
              if ((value as String).isEmpty) {
                return 'Name cannot be empty';
              }

              return null;
            }));
  }

  factory JamViewModel.fromModel(JamModel model) {
    return JamViewModel(
      creatorIdFormModel: JamBaseFormModel.generate(
          labelText: 'Creator Id',
          initValue: model.creatorId,
          validator: (value) {
            return null;
          }),
      descriptionFormModel: JamBaseFormModel.generate(
          labelText: 'Description',
          initValue: model.description,
          validator: (value) {
            return null;
          }),
      extraInformationFormModel: JamBaseFormModel.generate(
          labelText: 'Extra Information',
          initValue: model.extraInformation,
          validator: (value) {
            return null;
          }),
      locationNameFormModel: JamBaseFormModel.generate(
          labelText: 'Location Name',
          initValue: model.locationName,
          validator: (value) {
            return null;
          }),
      nameFormModel: JamBaseFormModel.generate(
          labelText: 'Name',
          initValue: model.name,
          validator: (value) {
            if ((value as String).isEmpty) {
              return 'Name cannot be empty';
            }

            return null;
          }),
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
      image: model.image,
      joinType: model.joinType,
      qrMode: model.qrMode,
    );
  }

  JamViewModel copyWith({
    JamBaseFormModel? creatorIdFormModel,
    JamBaseFormModel? descriptionFormModel,
    JamBaseFormModel? extraInformationFormModel,
    JamBaseFormModel? locationNameFormModel,
    JamBaseFormModel? nameFormModel,
    bool? dropBackground,
    int? id,
    UserProfileModel? creator,
    CommunityModel? relatedCommunity,
    BaseJamFormModel? formModel,
    List<JamJoinRequestModel>? joinRequests,
    List<UserProfileModel>? admins,
    List<UserProfileModel>? participants,
    List<VibeModel>? relatedVibes,
    double? lat,
    double? lon,
    int? chatId,
    int? maxParticipants,
    int? invitesPerMember,
    String? iconUrl,
    String? backgroundUrl,
    String? location,
    DateTime? date,
    File? image,
    JamJoinTypeEnum? joinType,
    JamQrModeEnum? qrMode,
  }) {
    return JamViewModel(
      creatorIdFormModel: creatorIdFormModel ?? this.creatorIdFormModel,
      descriptionFormModel: descriptionFormModel ?? this.descriptionFormModel,
      extraInformationFormModel:
          extraInformationFormModel ?? this.extraInformationFormModel,
      locationNameFormModel:
          locationNameFormModel ?? this.locationNameFormModel,
      nameFormModel: nameFormModel ?? this.nameFormModel,
      dropBackground: dropBackground ?? this.dropBackground,
      id: id ?? this.id,
      creator: creator ?? this.creator,
      relatedCommunity: relatedCommunity ?? this.relatedCommunity,
      formModel: formModel ?? this.formModel,
      joinRequests: joinRequests ?? this.joinRequests,
      admins: admins ?? this.admins,
      participants: participants ?? this.participants,
      relatedVibes: relatedVibes ?? this.relatedVibes,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      chatId: chatId ?? this.chatId,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      invitesPerMember: invitesPerMember ?? this.invitesPerMember,
      iconUrl: iconUrl ?? this.iconUrl,
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
      location: location ?? this.location,
      date: date ?? this.date,
      joinType: joinType ?? this.joinType,
      qrMode: qrMode ?? this.qrMode,
      image: image ?? this.image,
    );
  }

  void dispose() {
    creatorIdFormModel.dispose();
    descriptionFormModel.dispose();
    extraInformationFormModel.dispose();
    locationNameFormModel.dispose();
    nameFormModel.dispose();
  }

  JamModel castToModel() {
    return JamModel(
      id: id,
      creator: creator,
      relatedCommunity: relatedCommunity,
      formModel: formModel,
      dropBackground: dropBackground,
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
      joinType: joinType,
      qrMode: qrMode,
      date: date ?? DateTime.now(),
      image: image,
      creatorId: creatorIdFormModel.controller!.text,
      description: descriptionFormModel.controller!.text,
      extraInformation: extraInformationFormModel.controller!.text,
      locationName: locationNameFormModel.controller!.text,
      name: nameFormModel.controller!.text,
    );
  }
}

final class JamViewModelStateNotifier extends StateNotifier<JamViewModel> {
  JamViewModelStateNotifier(super.state);
  void addJoinRequests(JamJoinRequestModel joinRequests) {
    state = state.copyWith(joinRequests: [...state.joinRequests, joinRequests]);
  }

  void removeJoinRequests(JamJoinRequestModel joinRequests) {
    state = state.copyWith(
        joinRequests: state.joinRequests
            .where((element) => element != joinRequests)
            .toList());
  }

  void addAdmins(UserProfileModel admins) {
    state = state.copyWith(admins: [...state.admins, admins]);
  }

  void removeAdmins(UserProfileModel admins) {
    state = state.copyWith(
        admins: state.admins.where((element) => element != admins).toList());
  }

  void addParticipants(UserProfileModel participants) {
    state = state.copyWith(participants: [...state.participants, participants]);
  }

  void removeParticipants(UserProfileModel participants) {
    state = state.copyWith(
        participants: state.participants
            .where((element) => element != participants)
            .toList());
  }

  void addRelatedVibes(VibeModel relatedVibes) {
    state = state.copyWith(relatedVibes: [...state.relatedVibes, relatedVibes]);
  }

  void removeRelatedVibes(VibeModel relatedVibes) {
    state = state.copyWith(
        relatedVibes: state.relatedVibes
            .where((element) => element != relatedVibes)
            .toList());
  }

  void updateDropBackground(bool value) {
    state = state.copyWith(dropBackground: value);
  }

  void updateId(int? value) {
    state = state.copyWith(id: value);
  }

  void updateCreator(UserProfileModel? value) {
    state = state.copyWith(creator: value);
  }

  void updateRelatedCommunity(CommunityModel? value) {
    state = state.copyWith(relatedCommunity: value);
  }

  void updateFormModel(BaseJamFormModel? value) {
    state = state.copyWith(formModel: value);
  }

  void updateLat(double? value) {
    state = state.copyWith(lat: value);
  }

  void updateLon(double? value) {
    state = state.copyWith(lon: value);
  }

  void updateChatId(int? value) {
    state = state.copyWith(chatId: value);
  }

  void updateMaxParticipants(int value) {
    state = state.copyWith(maxParticipants: value);
  }

  void updateInvitesPerMember(int value) {
    state = state.copyWith(invitesPerMember: value);
  }

  void updateIconUrl(String value) {
    state = state.copyWith(iconUrl: value);
  }

  void updateBackgroundUrl(String? value) {
    state = state.copyWith(backgroundUrl: value);
  }

  void updateLocation(String value) {
    state = state.copyWith(location: value);
  }

  void updateDate(DateTime value) {
    state = state.copyWith(date: value);
  }

  void updateJoinType(JamJoinTypeEnum value) {
    state = state.copyWith(joinType: value);
  }

  void updateQrMode(JamQrModeEnum value) {
    state = state.copyWith(qrMode: value);
  }

  void updateImage(File? value) {
    state = state.copyWith(image: value ?? File(' '));
  }

  void updateCreatorId(String? value) {
    final controller =
        state.creatorIdFormModel.controller ?? TextEditingController();

    controller.text = value;

    state = state;
  }

  void updateDescription(String? value) {
    final controller =
        state.descriptionFormModel.controller ?? TextEditingController();

    controller.text = value;

    state = state;
  }

  void updateExtraInformation(String? value) {
    final controller =
        state.extraInformationFormModel.controller ?? TextEditingController();

    controller.text = value;

    state = state;
  }

  void updateLocationName(String? value) {
    final controller =
        state.locationNameFormModel.controller ?? TextEditingController();

    controller.text = value;

    state = state;
  }

  void updateName(String value) {
    final controller =
        state.nameFormModel.controller ?? TextEditingController();

    controller.text = value;

    state = state;
  }
}

final jamViewModelStateProvider = StateNotifierProvider.family
    .autoDispose<JamViewModelStateNotifier, JamViewModel, JamModel>(
        (ref, model) {
  return JamViewModelStateNotifier(JamViewModel.fromModel(model));
});

final class FreshJamViewModelStateNotifier extends StateNotifier<JamViewModel> {
  FreshJamViewModelStateNotifier(super.state);
  void addJoinRequests(JamJoinRequestModel joinRequests) {
    state = state.copyWith(joinRequests: [...state.joinRequests, joinRequests]);
  }

  void removeJoinRequests(JamJoinRequestModel joinRequests) {
    state = state.copyWith(
        joinRequests: state.joinRequests
            .where((element) => element != joinRequests)
            .toList());
  }

  void addAdmins(UserProfileModel admins) {
    state = state.copyWith(admins: [...state.admins, admins]);
  }

  void removeAdmins(UserProfileModel admins) {
    state = state.copyWith(
        admins: state.admins.where((element) => element != admins).toList());
  }

  void addParticipants(UserProfileModel participants) {
    state = state.copyWith(participants: [...state.participants, participants]);
  }

  void removeParticipants(UserProfileModel participants) {
    state = state.copyWith(
        participants: state.participants
            .where((element) => element != participants)
            .toList());
  }

  void addRelatedVibes(VibeModel relatedVibes) {
    state = state.copyWith(relatedVibes: [...state.relatedVibes, relatedVibes]);
  }

  void removeRelatedVibes(VibeModel relatedVibes) {
    state = state.copyWith(
        relatedVibes: state.relatedVibes
            .where((element) => element != relatedVibes)
            .toList());
  }

  void updateDropBackground(bool value) {
    state = state.copyWith(dropBackground: value);
  }

  void updateId(int? value) {
    state = state.copyWith(id: value);
  }

  void updateCreator(UserProfileModel? value) {
    state = state.copyWith(creator: value);
  }

  void updateRelatedCommunity(CommunityModel? value) {
    state = state.copyWith(relatedCommunity: value);
  }

  void updateFormModel(BaseJamFormModel? value) {
    state = state.copyWith(formModel: value);
  }

  void updateLat(double? value) {
    state = state.copyWith(lat: value);
  }

  void updateLon(double? value) {
    state = state.copyWith(lon: value);
  }

  void updateChatId(int? value) {
    state = state.copyWith(chatId: value);
  }

  void updateMaxParticipants(int value) {
    state = state.copyWith(maxParticipants: value);
  }

  void updateInvitesPerMember(int value) {
    state = state.copyWith(invitesPerMember: value);
  }

  void updateJoinType(JamJoinTypeEnum value) {
    state = state.copyWith(joinType: value);
  }

  void updateQrMode(JamQrModeEnum value) {
    state = state.copyWith(qrMode: value);
  }

  void updateIconUrl(String value) {
    state = state.copyWith(iconUrl: value);
  }

  void updateBackgroundUrl(String? value) {
    state = state.copyWith(backgroundUrl: value);
  }

  void updateLocation(String value) {
    state = state.copyWith(location: value);
  }

  void updateDate(DateTime value) {
    state = state.copyWith(date: value);
  }

  void updateImage(File? value) {
    state = state.copyWith(image: value ?? File(' '));
  }

  void updateCreatorId(String? value) {
    final controller =
        state.creatorIdFormModel.controller ?? TextEditingController();

    controller.text = value ?? '';

    state = state;
  }

  void updateDescription(String? value) {
    final controller =
        state.descriptionFormModel.controller ?? TextEditingController();

    controller.text = value ?? '';

    state = state;
  }

  void updateExtraInformation(String? value) {
    final controller =
        state.extraInformationFormModel.controller ?? TextEditingController();

    controller.text = value ?? '';

    state = state;
  }

  void updateLocationName(String? value) {
    final controller =
        state.locationNameFormModel.controller ?? TextEditingController();

    controller.text = value ?? '';

    state = state;
  }

  void updateName(String value) {
    final controller =
        state.nameFormModel.controller ?? TextEditingController();

    controller.text = value ?? '';

    state = state;
  }
}

final freshJamViewModelStateProvider = StateNotifierProvider.autoDispose<
    FreshJamViewModelStateNotifier, JamViewModel>((ref) {
  return FreshJamViewModelStateNotifier(JamViewModel.generate());
});
