// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `test`
  String get test {
    return Intl.message(
      'test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Dont have account?`
  String get dontHaveAccount {
    return Intl.message(
      'Dont have account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a link to reset your password.`
  String get enterYourEmailAddressAndWeWillSendYouA {
    return Intl.message(
      'Enter your email address and we will send you a link to reset your password.',
      name: 'enterYourEmailAddressAndWeWillSendYouA',
      desc: '',
      args: [],
    );
  }

  /// `Password Recovery`
  String get passwordRecovery {
    return Intl.message(
      'Password Recovery',
      name: 'passwordRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Send email`
  String get sendEmail {
    return Intl.message(
      'Send email',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Link for password reset sent to your email`
  String get LinkPassResetSentYourEmail {
    return Intl.message(
      'Link for password reset sent to your email',
      name: 'LinkPassResetSentYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get license {
    return Intl.message(
      'License',
      name: 'license',
      desc: '',
      args: [],
    );
  }

  /// `Read and Agreeeee with all the licenses!`
  String get readAndAgreWithAllLicenses {
    return Intl.message(
      'Read and Agreeeee with all the licenses!',
      name: 'readAndAgreWithAllLicenses',
      desc: '',
      args: [],
    );
  }

  /// `Select at least one thing you like`
  String get selectAtLeastOneThingYouLike {
    return Intl.message(
      'Select at least one thing you like',
      name: 'selectAtLeastOneThingYouLike',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Basic info`
  String get basicInfo {
    return Intl.message(
      'Basic info',
      name: 'basicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Vibes info`
  String get vibesInfo {
    return Intl.message(
      'Vibes info',
      name: 'vibesInfo',
      desc: '',
      args: [],
    );
  }

  /// `License agreements`
  String get licenseAgreements {
    return Intl.message(
      'License agreements',
      name: 'licenseAgreements',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get friends {
    return Intl.message(
      'Friends',
      name: 'friends',
      desc: '',
      args: [],
    );
  }

  /// `No chats found!`
  String get noChatsFound {
    return Intl.message(
      'No chats found!',
      name: 'noChatsFound',
      desc: '',
      args: [],
    );
  }

  /// `Friend Invites`
  String get friendInvites {
    return Intl.message(
      'Friend Invites',
      name: 'friendInvites',
      desc: '',
      args: [],
    );
  }

  /// `No friend invites`
  String get noFriendInvites {
    return Intl.message(
      'No friend invites',
      name: 'noFriendInvites',
      desc: '',
      args: [],
    );
  }

  /// `Friend list`
  String get friendList {
    return Intl.message(
      'Friend list',
      name: 'friendList',
      desc: '',
      args: [],
    );
  }

  /// `No friends found`
  String get noFriendsFound {
    return Intl.message(
      'No friends found',
      name: 'noFriendsFound',
      desc: '',
      args: [],
    );
  }

  /// `No Name`
  String get noName {
    return Intl.message(
      'No Name',
      name: 'noName',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `No Status`
  String get noStatus {
    return Intl.message(
      'No Status',
      name: 'noStatus',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Vibes`
  String get vibes {
    return Intl.message(
      'Vibes',
      name: 'vibes',
      desc: '',
      args: [],
    );
  }

  /// `Archived Chats`
  String get archivedChats {
    return Intl.message(
      'Archived Chats',
      name: 'archivedChats',
      desc: '',
      args: [],
    );
  }

  /// `Unarchive`
  String get unarchive {
    return Intl.message(
      'Unarchive',
      name: 'unarchive',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Clear chat`
  String get clearChat {
    return Intl.message(
      'Clear chat',
      name: 'clearChat',
      desc: '',
      args: [],
    );
  }

  /// `Delete chat`
  String get deleteChat {
    return Intl.message(
      'Delete chat',
      name: 'deleteChat',
      desc: '',
      args: [],
    );
  }

  /// `Delete message`
  String get deleteMessage {
    return Intl.message(
      'Delete message',
      name: 'deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Attach file`
  String get attachFile {
    return Intl.message(
      'Attach file',
      name: 'attachFile',
      desc: '',
      args: [],
    );
  }

  /// `Record video`
  String get recordVideo {
    return Intl.message(
      'Record video',
      name: 'recordVideo',
      desc: '',
      args: [],
    );
  }

  /// `Editing`
  String get editing {
    return Intl.message(
      'Editing',
      name: 'editing',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get media {
    return Intl.message(
      'Media',
      name: 'media',
      desc: '',
      args: [],
    );
  }

  /// `Display stickers`
  String get displayStickers {
    return Intl.message(
      'Display stickers',
      name: 'displayStickers',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get event {
    return Intl.message(
      'Event',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `Pinned Messages`
  String get pinnedMessages {
    return Intl.message(
      'Pinned Messages',
      name: 'pinnedMessages',
      desc: '',
      args: [],
    );
  }

  /// `Whoops! Could not load pinned messages. Please try again.`
  String get CouldntLoadMessagesTryAgain {
    return Intl.message(
      'Whoops! Could not load pinned messages. Please try again.',
      name: 'CouldntLoadMessagesTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Unpin all messages`
  String get unpinAllMessages {
    return Intl.message(
      'Unpin all messages',
      name: 'unpinAllMessages',
      desc: '',
      args: [],
    );
  }

  /// `DA VIBEZ`
  String get daVibez {
    return Intl.message(
      'DA VIBEZ',
      name: 'daVibez',
      desc: '',
      args: [],
    );
  }

  /// `Pick at least one`
  String get pickAtLeastOne {
    return Intl.message(
      'Pick at least one',
      name: 'pickAtLeastOne',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `WHATS DA PLAN`
  String get whatsDaPlan {
    return Intl.message(
      'WHATS DA PLAN',
      name: 'whatsDaPlan',
      desc: '',
      args: [],
    );
  }

  /// `When?`
  String get when {
    return Intl.message(
      'When?',
      name: 'when',
      desc: '',
      args: [],
    );
  }

  /// `Where?`
  String get where {
    return Intl.message(
      'Where?',
      name: 'where',
      desc: '',
      args: [],
    );
  }

  /// `Right were I am`
  String get rightWereIAm {
    return Intl.message(
      'Right were I am',
      name: 'rightWereIAm',
      desc: '',
      args: [],
    );
  }

  /// `Add some extra info?`
  String get addSomeExtraInfo {
    return Intl.message(
      'Add some extra info?',
      name: 'addSomeExtraInfo',
      desc: '',
      args: [],
    );
  }

  /// `Nah`
  String get nah {
    return Intl.message(
      'Nah',
      name: 'nah',
      desc: '',
      args: [],
    );
  }

  /// `Yes please!`
  String get yesPlease {
    return Intl.message(
      'Yes please!',
      name: 'yesPlease',
      desc: '',
      args: [],
    );
  }

  /// `You can give it a name`
  String get youCanGiveItAName {
    return Intl.message(
      'You can give it a name',
      name: 'youCanGiveItAName',
      desc: '',
      args: [],
    );
  }

  /// `Or name the the spot`
  String get orNameTheTheSpot {
    return Intl.message(
      'Or name the the spot',
      name: 'orNameTheTheSpot',
      desc: '',
      args: [],
    );
  }

  /// `Perhaps some comments?`
  String get perhapsSomeComments {
    return Intl.message(
      'Perhaps some comments?',
      name: 'perhapsSomeComments',
      desc: '',
      args: [],
    );
  }

  /// `Background image`
  String get backgroundImage {
    return Intl.message(
      'Background image',
      name: 'backgroundImage',
      desc: '',
      args: [],
    );
  }

  /// `JAM TYPE`
  String get jamType {
    return Intl.message(
      'JAM TYPE',
      name: 'jamType',
      desc: '',
      args: [],
    );
  }

  /// `Instant jam`
  String get instantJam {
    return Intl.message(
      'Instant jam',
      name: 'instantJam',
      desc: '',
      args: [],
    );
  }

  /// `Start jamming right now (at least 2 people)`
  String get startJammingNow2People {
    return Intl.message(
      'Start jamming right now (at least 2 people)',
      name: 'startJammingNow2People',
      desc: '',
      args: [],
    );
  }

  /// `(Unavailable in this version)`
  String get unavailableInThisVersion {
    return Intl.message(
      '(Unavailable in this version)',
      name: 'unavailableInThisVersion',
      desc: '',
      args: [],
    );
  }

  /// `Callout for jam`
  String get calloutForJam {
    return Intl.message(
      'Callout for jam',
      name: 'calloutForJam',
      desc: '',
      args: [],
    );
  }

  /// `Let people know you are looking for a jam`
  String get letPeopleKnowYouAreLookingForJam {
    return Intl.message(
      'Let people know you are looking for a jam',
      name: 'letPeopleKnowYouAreLookingForJam',
      desc: '',
      args: [],
    );
  }

  /// `Plan a jam`
  String get planAJam {
    return Intl.message(
      'Plan a jam',
      name: 'planAJam',
      desc: '',
      args: [],
    );
  }

  /// `Schedule a jam for a future date and time`
  String get scheduleJamForFutureDateTime {
    return Intl.message(
      'Schedule a jam for a future date and time',
      name: 'scheduleJamForFutureDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Jam details`
  String get jamDetails {
    return Intl.message(
      'Jam details',
      name: 'jamDetails',
      desc: '',
      args: [],
    );
  }

  /// `New jam`
  String get newJam {
    return Intl.message(
      'New jam',
      name: 'newJam',
      desc: '',
      args: [],
    );
  }

  /// `Change vibes`
  String get changeVibes {
    return Intl.message(
      'Change vibes',
      name: 'changeVibes',
      desc: '',
      args: [],
    );
  }

  /// `Control participants`
  String get controlParticipants {
    return Intl.message(
      'Control participants',
      name: 'controlParticipants',
      desc: '',
      args: [],
    );
  }

  /// `Restrictions, poilicies and more`
  String get restrictionsPoiliciesAndMore {
    return Intl.message(
      'Restrictions, poilicies and more',
      name: 'restrictionsPoiliciesAndMore',
      desc: '',
      args: [],
    );
  }

  /// `Change some details`
  String get changeSomeDetails {
    return Intl.message(
      'Change some details',
      name: 'changeSomeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Change the name, date and more`
  String get changeTheNameDateAndMore {
    return Intl.message(
      'Change the name, date and more',
      name: 'changeTheNameDateAndMore',
      desc: '',
      args: [],
    );
  }

  /// `jamId`
  String get jamid {
    return Intl.message(
      'jamId',
      name: 'jamid',
      desc: '',
      args: [],
    );
  }

  /// `Jam Invites`
  String get jamInvites {
    return Intl.message(
      'Jam Invites',
      name: 'jamInvites',
      desc: '',
      args: [],
    );
  }

  /// `Jam invite accepted`
  String get jamInviteAccepted {
    return Intl.message(
      'Jam invite accepted',
      name: 'jamInviteAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Invite declined`
  String get inviteDeclined {
    return Intl.message(
      'Invite declined',
      name: 'inviteDeclined',
      desc: '',
      args: [],
    );
  }

  /// `No invites found`
  String get noInvitesFound {
    return Intl.message(
      'No invites found',
      name: 'noInvitesFound',
      desc: '',
      args: [],
    );
  }

  /// `Anonymous`
  String get anonymous {
    return Intl.message(
      'Anonymous',
      name: 'anonymous',
      desc: '',
      args: [],
    );
  }

  /// `Driven by: `
  String get drivenBy {
    return Intl.message(
      'Driven by: ',
      name: 'drivenBy',
      desc: '',
      args: [],
    );
  }

  /// `Edit Jam`
  String get editJam {
    return Intl.message(
      'Edit Jam',
      name: 'editJam',
      desc: '',
      args: [],
    );
  }

  /// `Select date here`
  String get selectDateHere {
    return Intl.message(
      'Select date here',
      name: 'selectDateHere',
      desc: '',
      args: [],
    );
  }

  /// `dd.MM.yyyy   HH:MM`
  String get ddmmyyyyHhmm {
    return Intl.message(
      'dd.MM.yyyy   HH:MM',
      name: 'ddmmyyyyHhmm',
      desc: '',
      args: [],
    );
  }

  /// `Changed your mind?`
  String get changedYourMind {
    return Intl.message(
      'Changed your mind?',
      name: 'changedYourMind',
      desc: '',
      args: [],
    );
  }

  /// `Because you can`
  String get becauseYouCan {
    return Intl.message(
      'Because you can',
      name: 'becauseYouCan',
      desc: '',
      args: [],
    );
  }

  /// `Select location here`
  String get selectLocationHere {
    return Intl.message(
      'Select location here',
      name: 'selectLocationHere',
      desc: '',
      args: [],
    );
  }

  /// `Select jam vibes`
  String get selectJamVibes {
    return Intl.message(
      'Select jam vibes',
      name: 'selectJamVibes',
      desc: '',
      args: [],
    );
  }

  /// `Whoops! Something went wrong while loading friends`
  String get whoopsWrongWhileLoadingFriends {
    return Intl.message(
      'Whoops! Something went wrong while loading friends',
      name: 'whoopsWrongWhileLoadingFriends',
      desc: '',
      args: [],
    );
  }

  /// `Who to invite to the jam?`
  String get whoToInviteToTheJam {
    return Intl.message(
      'Who to invite to the jam?',
      name: 'whoToInviteToTheJam',
      desc: '',
      args: [],
    );
  }

  /// `Create jam`
  String get createJam {
    return Intl.message(
      'Create jam',
      name: 'createJam',
      desc: '',
      args: [],
    );
  }

  /// `My jams`
  String get myJams {
    return Intl.message(
      'My jams',
      name: 'myJams',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming jams`
  String get upcomingJams {
    return Intl.message(
      'Upcoming jams',
      name: 'upcomingJams',
      desc: '',
      args: [],
    );
  }

  /// `Old jams`
  String get oldJams {
    return Intl.message(
      'Old jams',
      name: 'oldJams',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get orSignInWith {
    return Intl.message(
      'Or sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get passwordCannotBeEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'passwordCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Default search`
  String get defaultSearch {
    return Intl.message(
      'Default search',
      name: 'defaultSearch',
      desc: '',
      args: [],
    );
  }

  /// `Search with AI prompt (experimental)`
  String get searchWithAiPromptExperimental {
    return Intl.message(
      'Search with AI prompt (experimental)',
      name: 'searchWithAiPromptExperimental',
      desc: '',
      args: [],
    );
  }

  /// `You can select up to {MAX_VIBES_AMOUNT} vibes`
  String youCanSelectUpToNMaxVibes(Object MAX_VIBES_AMOUNT) {
    return Intl.message(
      'You can select up to $MAX_VIBES_AMOUNT vibes',
      name: 'youCanSelectUpToNMaxVibes',
      desc: '',
      args: [MAX_VIBES_AMOUNT],
    );
  }

  /// `Whoops! Failed to load vibes`
  String get whoopsFailedToLoadVibes {
    return Intl.message(
      'Whoops! Failed to load vibes',
      name: 'whoopsFailedToLoadVibes',
      desc: '',
      args: [],
    );
  }

  /// `Find your vibe`
  String get findYourVibe {
    return Intl.message(
      'Find your vibe',
      name: 'findYourVibe',
      desc: '',
      args: [],
    );
  }

  /// `Friend requests`
  String get friendRequests {
    return Intl.message(
      'Friend requests',
      name: 'friendRequests',
      desc: '',
      args: [],
    );
  }

  /// `Friend invite rejected.`
  String get friendInviteRejected {
    return Intl.message(
      'Friend invite rejected.',
      name: 'friendInviteRejected',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Last seen {last_acctive}`
  String lastSeenActive(Object last_acctive) {
    return Intl.message(
      'Last seen $last_acctive',
      name: 'lastSeenActive',
      desc: '',
      args: [last_acctive],
    );
  }

  /// `{invites} is now your friend`
  String invites(Object invites) {
    return Intl.message(
      '$invites is now your friend',
      name: 'invites',
      desc: '',
      args: [invites],
    );
  }

  /// `No Archived Chats`
  String get noArchivedChats {
    return Intl.message(
      'No Archived Chats',
      name: 'noArchivedChats',
      desc: '',
      args: [],
    );
  }

  /// `Recently`
  String get recently {
    return Intl.message(
      'Recently',
      name: 'recently',
      desc: '',
      args: [],
    );
  }

  /// `Typing...`
  String get typing {
    return Intl.message(
      'Typing...',
      name: 'typing',
      desc: '',
      args: [],
    );
  }

  /// `Draft: `
  String get draft {
    return Intl.message(
      'Draft: ',
      name: 'draft',
      desc: '',
      args: [],
    );
  }

  /// `Clear history`
  String get clearHistory {
    return Intl.message(
      'Clear history',
      name: 'clearHistory',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear history?`
  String get youSureWantClearHistory {
    return Intl.message(
      'Are you sure you want to clear history?',
      name: 'youSureWantClearHistory',
      desc: '',
      args: [],
    );
  }

  /// `Also clear for {chat_related_contact}`
  String alsoClearFor(Object chat_related_contact) {
    return Intl.message(
      'Also clear for $chat_related_contact',
      name: 'alsoClearFor',
      desc: '',
      args: [chat_related_contact],
    );
  }

  /// `Are you sure you want to delete chat?`
  String get youSureWantDeleteChat {
    return Intl.message(
      'Are you sure you want to delete chat?',
      name: 'youSureWantDeleteChat',
      desc: '',
      args: [],
    );
  }

  /// `Also delete for this user`
  String get alsoDeleteForThisUser {
    return Intl.message(
      'Also delete for this user',
      name: 'alsoDeleteForThisUser',
      desc: '',
      args: [],
    );
  }

  /// `Last seen {related_contact_last_active}`
  String lastSeenChatContact(Object related_contact_last_active) {
    return Intl.message(
      'Last seen $related_contact_last_active',
      name: 'lastSeenChatContact',
      desc: '',
      args: [related_contact_last_active],
    );
  }

  /// `Clear {selected_chats} chats`
  String clearSelectedChats(Object selected_chats) {
    return Intl.message(
      'Clear $selected_chats chats',
      name: 'clearSelectedChats',
      desc: '',
      args: [selected_chats],
    );
  }

  /// `Clear chat history for this user?`
  String get clearChatHistoryThisUser {
    return Intl.message(
      'Clear chat history for this user?',
      name: 'clearChatHistoryThisUser',
      desc: '',
      args: [],
    );
  }

  /// `Also for this user`
  String get alsoForThisUser {
    return Intl.message(
      'Also for this user',
      name: 'alsoForThisUser',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear these chats?`
  String get sureYouWantClearTheseChats {
    return Intl.message(
      'Are you sure you want to clear these chats?',
      name: 'sureYouWantClearTheseChats',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Delete {delete_chats} chats`
  String deleteSelectedChats(Object delete_chats) {
    return Intl.message(
      'Delete $delete_chats chats',
      name: 'deleteSelectedChats',
      desc: '',
      args: [delete_chats],
    );
  }

  /// `Are you sure you want to delete this chat`
  String get sureYouWantDeleteThisChat {
    return Intl.message(
      'Are you sure you want to delete this chat',
      name: 'sureYouWantDeleteThisChat',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete selected chats`
  String get youSureWantDeleteSelectedChats {
    return Intl.message(
      'Are you sure you want to delete selected chats',
      name: 'youSureWantDeleteSelectedChats',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'lv', countryCode: 'LV'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
