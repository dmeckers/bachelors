import 'package:jam/domain/domain.dart';

typedef JamInvites = List<JamInviteModel>;
typedef Jams = List<JamModel>;
typedef Users = List<UserProfileModel>;
typedef FriendInvites = List<FriendInviteModel>;
typedef Messages = List<MessageModel>;
typedef InvitesAndMembers = (JamInvites, Users);
typedef Chats = List<ChatModel>;
typedef Vibes = List<VibeModel>;
typedef ChatEventsMap = Map<int, ChatEventType>;
typedef ChatStatesMap = Map<int, ChatState>;
typedef Locations = List<LocationAbstactModel>;
typedef ChatEvents = List<ChatEvent>;
typedef UserLocations = List<UserLocation>;
typedef JamLocations = List<JamLocation>;
typedef PrivacySettings = UserProfilePrivacySettingsModel;
