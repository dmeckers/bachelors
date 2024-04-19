// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru_RU locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru_RU';

  static String m0(chat_related_contact) =>
      "Also clear for ${chat_related_contact}";

  static String m1(selected_chats) => "Clear ${selected_chats} chats";

  static String m2(delete_chats) => "Delete ${delete_chats} chats";

  static String m3(invites) => "${invites} is now your friend";

  static String m4(last_acctive) => "Last seen ${last_acctive}";

  static String m5(related_contact_last_active) =>
      "Last seen ${related_contact_last_active}";

  static String m6(MAX_VIBES_AMOUNT) =>
      "You can select up to ${MAX_VIBES_AMOUNT} vibes";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "CouldntLoadMessagesTryAgain": MessageLookupByLibrary.simpleMessage(
            "Whoops! Couldn\\\'t load pinned messages. Please try again."),
        "LinkPassResetSentYourEmail": MessageLookupByLibrary.simpleMessage(
            "Link for password reset sent to your email"),
        "addSomeExtraInfo":
            MessageLookupByLibrary.simpleMessage("Add some extra info?"),
        "alsoClearFor": m0,
        "alsoDeleteForThisUser":
            MessageLookupByLibrary.simpleMessage("Also delete for this user"),
        "alsoForThisUser":
            MessageLookupByLibrary.simpleMessage("Also for this user"),
        "anonymous": MessageLookupByLibrary.simpleMessage("Anonymous"),
        "archive": MessageLookupByLibrary.simpleMessage("Archive"),
        "archivedChats": MessageLookupByLibrary.simpleMessage("Archived Chats"),
        "attachFile": MessageLookupByLibrary.simpleMessage("Attach file"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "backgroundImage":
            MessageLookupByLibrary.simpleMessage("Background image"),
        "basicInfo": MessageLookupByLibrary.simpleMessage("Basic info"),
        "becauseYouCan":
            MessageLookupByLibrary.simpleMessage("Because you can"),
        "calloutForJam":
            MessageLookupByLibrary.simpleMessage("Callout for jam"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changeSomeDetails":
            MessageLookupByLibrary.simpleMessage("Change some details"),
        "changeTheNameDateAndMore": MessageLookupByLibrary.simpleMessage(
            "Change the name, date and more"),
        "changeVibes": MessageLookupByLibrary.simpleMessage("Change vibes"),
        "changedYourMind":
            MessageLookupByLibrary.simpleMessage("Changed your mind?"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "clearChat": MessageLookupByLibrary.simpleMessage("Clear chat"),
        "clearChatHistoryThisUser": MessageLookupByLibrary.simpleMessage(
            "Clear chat history for this user?"),
        "clearHistory": MessageLookupByLibrary.simpleMessage("Clear history"),
        "clearSelectedChats": m1,
        "controlParticipants":
            MessageLookupByLibrary.simpleMessage("Control participants"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create account"),
        "createJam": MessageLookupByLibrary.simpleMessage("Create jam"),
        "daVibez": MessageLookupByLibrary.simpleMessage("DA VIBEZ"),
        "ddmmyyyyHhmm":
            MessageLookupByLibrary.simpleMessage("dd.MM.yyyy   HH:MM"),
        "defaultSearch": MessageLookupByLibrary.simpleMessage("Default search"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteChat": MessageLookupByLibrary.simpleMessage("Delete chat"),
        "deleteMessage": MessageLookupByLibrary.simpleMessage("Delete message"),
        "deleteSelectedChats": m2,
        "displayStickers":
            MessageLookupByLibrary.simpleMessage("Display stickers"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Dont have account?"),
        "draft": MessageLookupByLibrary.simpleMessage("Draft: "),
        "drivenBy": MessageLookupByLibrary.simpleMessage("Driven by: "),
        "editJam": MessageLookupByLibrary.simpleMessage("Edit Jam"),
        "editing": MessageLookupByLibrary.simpleMessage("Editing"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enterYourEmailAddressAndWeWillSendYouA":
            MessageLookupByLibrary.simpleMessage(
                "Enter your email address and we will send you a link to reset your password."),
        "event": MessageLookupByLibrary.simpleMessage("Event"),
        "findYourVibe": MessageLookupByLibrary.simpleMessage("Find your vibe"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "friendInviteRejected":
            MessageLookupByLibrary.simpleMessage("Friend invite rejected."),
        "friendInvites": MessageLookupByLibrary.simpleMessage("Friend Invites"),
        "friendList": MessageLookupByLibrary.simpleMessage("Friend list"),
        "friendRequests":
            MessageLookupByLibrary.simpleMessage("Friend requests"),
        "friends": MessageLookupByLibrary.simpleMessage("Friends"),
        "instantJam": MessageLookupByLibrary.simpleMessage("Instant jam"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "inviteDeclined":
            MessageLookupByLibrary.simpleMessage("Invite declined"),
        "invites": m3,
        "jamDetails": MessageLookupByLibrary.simpleMessage("Jam details"),
        "jamInviteAccepted":
            MessageLookupByLibrary.simpleMessage("Jam invite accepted"),
        "jamInvites": MessageLookupByLibrary.simpleMessage("Jam Invites"),
        "jamType": MessageLookupByLibrary.simpleMessage("JAM TYPE"),
        "jamid": MessageLookupByLibrary.simpleMessage("jamId"),
        "lastSeenActive": m4,
        "lastSeenChatContact": m5,
        "letPeopleKnowYouAreLookingForJam":
            MessageLookupByLibrary.simpleMessage(
                "Let people know you are looking for a jam"),
        "license": MessageLookupByLibrary.simpleMessage("License"),
        "licenseAgreements":
            MessageLookupByLibrary.simpleMessage("License agreements"),
        "loading": MessageLookupByLibrary.simpleMessage("loading"),
        "login": MessageLookupByLibrary.simpleMessage("Логин"),
        "media": MessageLookupByLibrary.simpleMessage("Media"),
        "myJams": MessageLookupByLibrary.simpleMessage("My jams"),
        "nah": MessageLookupByLibrary.simpleMessage("Nah"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newJam": MessageLookupByLibrary.simpleMessage("New jam"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "noArchivedChats":
            MessageLookupByLibrary.simpleMessage("No Archived Chats"),
        "noChatsFound": MessageLookupByLibrary.simpleMessage("No chats found!"),
        "noFriendInvites":
            MessageLookupByLibrary.simpleMessage("No friend invites"),
        "noFriendsFound":
            MessageLookupByLibrary.simpleMessage("No friends found"),
        "noInvitesFound":
            MessageLookupByLibrary.simpleMessage("No invites found"),
        "noName": MessageLookupByLibrary.simpleMessage("No Name"),
        "noStatus": MessageLookupByLibrary.simpleMessage("No Status"),
        "oldJams": MessageLookupByLibrary.simpleMessage("Old jams"),
        "online": MessageLookupByLibrary.simpleMessage("Online"),
        "orNameTheTheSpot":
            MessageLookupByLibrary.simpleMessage("Or name the the spot"),
        "orSignInWith": MessageLookupByLibrary.simpleMessage("Or sign in with"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordCannotBeEmpty":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "passwordRecovery":
            MessageLookupByLibrary.simpleMessage("Password Recovery"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "perhapsSomeComments":
            MessageLookupByLibrary.simpleMessage("Perhaps some comments?"),
        "pickAtLeastOne":
            MessageLookupByLibrary.simpleMessage("Pick at least one"),
        "pinnedMessages":
            MessageLookupByLibrary.simpleMessage("Pinned Messages"),
        "planAJam": MessageLookupByLibrary.simpleMessage("Plan a jam"),
        "readAndAgreWithAllLicenses": MessageLookupByLibrary.simpleMessage(
            "Read and Agreeeee with all the licenses!"),
        "recently": MessageLookupByLibrary.simpleMessage("Recently"),
        "recordVideo": MessageLookupByLibrary.simpleMessage("Record video"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registration": MessageLookupByLibrary.simpleMessage("Registration"),
        "restrictionsPoiliciesAndMore": MessageLookupByLibrary.simpleMessage(
            "Restrictions, poilicies and more"),
        "rightWereIAm": MessageLookupByLibrary.simpleMessage("Right were I am"),
        "scheduleJamForFutureDateTime": MessageLookupByLibrary.simpleMessage(
            "Schedule a jam for a future date and time"),
        "searchWithAiPromptExperimental": MessageLookupByLibrary.simpleMessage(
            "Search with AI prompt (experimental)"),
        "selectAtLeastOneThingYouLike": MessageLookupByLibrary.simpleMessage(
            "Select at least one thing you like"),
        "selectDateHere":
            MessageLookupByLibrary.simpleMessage("Select date here"),
        "selectJamVibes":
            MessageLookupByLibrary.simpleMessage("Select jam vibes"),
        "selectLocationHere":
            MessageLookupByLibrary.simpleMessage("Select location here"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Send email"),
        "startJammingNow2People": MessageLookupByLibrary.simpleMessage(
            "Start jamming right now (at least 2 people)"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "sureYouWantClearTheseChats": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to clear these chats?"),
        "sureYouWantDeleteThisChat": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this chat"),
        "test": MessageLookupByLibrary.simpleMessage("тест"),
        "typing": MessageLookupByLibrary.simpleMessage("Typing..."),
        "unarchive": MessageLookupByLibrary.simpleMessage("Unarchive"),
        "unavailableInThisVersion": MessageLookupByLibrary.simpleMessage(
            "(Unavailable in this version)"),
        "unpinAllMessages":
            MessageLookupByLibrary.simpleMessage("Unpin all messages"),
        "upcomingJams": MessageLookupByLibrary.simpleMessage("Upcoming jams"),
        "user": MessageLookupByLibrary.simpleMessage("User"),
        "vibes": MessageLookupByLibrary.simpleMessage("Vibes"),
        "vibesInfo": MessageLookupByLibrary.simpleMessage("Vibes info"),
        "whatsDaPlan": MessageLookupByLibrary.simpleMessage("WHATS DA PLAN"),
        "when": MessageLookupByLibrary.simpleMessage("When?"),
        "where": MessageLookupByLibrary.simpleMessage("Where?"),
        "whoToInviteToTheJam":
            MessageLookupByLibrary.simpleMessage("Who to invite to the jam?"),
        "whoopsFailedToLoadVibes": MessageLookupByLibrary.simpleMessage(
            "Whoops! Failed to load vibes"),
        "whoopsWrongWhileLoadingFriends": MessageLookupByLibrary.simpleMessage(
            "Whoops! Something went wrong while loading friends"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "yesPlease": MessageLookupByLibrary.simpleMessage("Yes please!"),
        "youCanGiveItAName":
            MessageLookupByLibrary.simpleMessage("You can give it a name"),
        "youCanSelectUpToNMaxVibes": m6,
        "youSureWantClearHistory": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to clear history?"),
        "youSureWantDeleteChat": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete chat?"),
        "youSureWantDeleteSelectedChats": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete selected chats")
      };
}
