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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message('Hello', name: 'hello', desc: '', args: []);
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message('Welcome!', name: 'welcome', desc: '', args: []);
  }

  /// `Forward`
  String get frwd {
    return Intl.message('Forward', name: 'frwd', desc: '', args: []);
  }

  /// `Collect`
  String get presentation1Title {
    return Intl.message(
      'Collect',
      name: 'presentation1Title',
      desc: '',
      args: [],
    );
  }

  /// `Collect the bikes you like\nwith a click`
  String get presentation1Subtitle1 {
    return Intl.message(
      'Collect the bikes you like\nwith a click',
      name: 'presentation1Subtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Tournaments`
  String get presentation2Title {
    return Intl.message(
      'Tournaments',
      name: 'presentation2Title',
      desc: '',
      args: [],
    );
  }

  /// `Compete with your favorite bikes\nand win medals`
  String get presentation2Subtitle1 {
    return Intl.message(
      'Compete with your favorite bikes\nand win medals',
      name: 'presentation2Subtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get presentation3Title {
    return Intl.message(
      'Community',
      name: 'presentation3Title',
      desc: '',
      args: [],
    );
  }

  /// `Share your adventures\nwith your bike with friends`
  String get presentation3Subtitle1 {
    return Intl.message(
      'Share your adventures\nwith your bike with friends',
      name: 'presentation3Subtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get orderBy {
    return Intl.message('Sort by', name: 'orderBy', desc: '', args: []);
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Brand`
  String get brand {
    return Intl.message('Brand', name: 'brand', desc: '', args: []);
  }

  /// `The community is empty`
  String get emptyCommunity {
    return Intl.message(
      'The community is empty',
      name: 'emptyCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get community {
    return Intl.message('Community', name: 'community', desc: '', args: []);
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Model`
  String get model {
    return Intl.message('Model', name: 'model', desc: '', args: []);
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Add bike`
  String get addMoto {
    return Intl.message('Add bike', name: 'addMoto', desc: '', args: []);
  }

  /// `Bike already added`
  String get motoAlreadyInserted {
    return Intl.message(
      'Bike already added',
      name: 'motoAlreadyInserted',
      desc: '',
      args: [],
    );
  }

  /// `The bike you are trying to save is already in your collection. Are you sure you want to replace it with this new capture?`
  String get motoAlreadyInsertedSubtitle {
    return Intl.message(
      'The bike you are trying to save is already in your collection. Are you sure you want to replace it with this new capture?',
      name: 'motoAlreadyInsertedSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Replace`
  String get substitute {
    return Intl.message('Replace', name: 'substitute', desc: '', args: []);
  }

  /// `Cancel`
  String get nullify {
    return Intl.message('Cancel', name: 'nullify', desc: '', args: []);
  }

  /// `Bike saved successfully`
  String get motoSaved {
    return Intl.message(
      'Bike saved successfully',
      name: 'motoSaved',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get noInternet {
    return Intl.message(
      'Check your internet connection',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `My garage`
  String get myGarage {
    return Intl.message('My garage', name: 'myGarage', desc: '', args: []);
  }

  /// `Garage`
  String get garage {
    return Intl.message('Garage', name: 'garage', desc: '', args: []);
  }

  /// `Collection`
  String get collection {
    return Intl.message('Collection', name: 'collection', desc: '', args: []);
  }

  /// `Story`
  String get story {
    return Intl.message('Story', name: 'story', desc: '', args: []);
  }

  /// `You haven’t added any bikes yet`
  String get noMotoAdded {
    return Intl.message(
      'You haven’t added any bikes yet',
      name: 'noMotoAdded',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `No bikes found with these filters`
  String get noMotoFoundFilter {
    return Intl.message(
      'No bikes found with these filters',
      name: 'noMotoFoundFilter',
      desc: '',
      args: [],
    );
  }

  /// `Hello Biker!`
  String get helloBiker {
    return Intl.message('Hello Biker!', name: 'helloBiker', desc: '', args: []);
  }

  /// `Tournaments`
  String get tournaments {
    return Intl.message('Tournaments', name: 'tournaments', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Leaderboard`
  String get leaderboard {
    return Intl.message('Leaderboard', name: 'leaderboard', desc: '', args: []);
  }

  /// `General leaderboard`
  String get generalLeaderboard {
    return Intl.message(
      'General leaderboard',
      name: 'generalLeaderboard',
      desc: '',
      args: [],
    );
  }

  /// `Winner`
  String get winner {
    return Intl.message('Winner', name: 'winner', desc: '', args: []);
  }

  /// `The winner has not been chosen yet`
  String get noWinner {
    return Intl.message(
      'The winner has not been chosen yet',
      name: 'noWinner',
      desc: '',
      args: [],
    );
  }

  /// `The winner is:`
  String get winnerIs {
    return Intl.message('The winner is:', name: 'winnerIs', desc: '', args: []);
  }

  /// `The code cannot be empty`
  String get codeEmpty {
    return Intl.message(
      'The code cannot be empty',
      name: 'codeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get emailNoEmpty {
    return Intl.message(
      'Email cannot be empty',
      name: 'emailNoEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get emailNotValid {
    return Intl.message(
      'Enter a valid email',
      name: 'emailNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get passwordConfirm {
    return Intl.message(
      'Confirm password',
      name: 'passwordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get pwdForgot {
    return Intl.message(
      'Forgot password?',
      name: 'pwdForgot',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get pwdNoEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'pwdNoEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get pwd8chars {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'pwd8chars',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get pwdNoCoincide {
    return Intl.message(
      'Passwords do not match',
      name: 'pwdNoCoincide',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Name cannot be empty`
  String get nameNoEmpty {
    return Intl.message(
      'Name cannot be empty',
      name: 'nameNoEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get surname {
    return Intl.message('Surname', name: 'surname', desc: '', args: []);
  }

  /// `Surname cannot be empty`
  String get surnameNoEmpty {
    return Intl.message(
      'Surname cannot be empty',
      name: 'surnameNoEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Username cannot be empty`
  String get usernameNoEmpty {
    return Intl.message(
      'Username cannot be empty',
      name: 'usernameNoEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message('Birthday', name: 'birthday', desc: '', args: []);
  }

  /// `Birthday cannot be empty`
  String get birthdayNoEmpty {
    return Intl.message(
      'Birthday cannot be empty',
      name: 'birthdayNoEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Select avatar`
  String get selectAvatar {
    return Intl.message(
      'Select avatar',
      name: 'selectAvatar',
      desc: '',
      args: [],
    );
  }

  /// `You must select an avatar`
  String get mustSelectAvatar {
    return Intl.message(
      'You must select an avatar',
      name: 'mustSelectAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Sign up`
  String get registerYou {
    return Intl.message('Sign up', name: 'registerYou', desc: '', args: []);
  }

  /// `Enter the code received via email`
  String get codeViaEmail {
    return Intl.message(
      'Enter the code received via email',
      name: 'codeViaEmail',
      desc: '',
      args: [],
    );
  }

  /// `Insert the code`
  String get insertCode {
    return Intl.message(
      'Insert the code',
      name: 'insertCode',
      desc: '',
      args: [],
    );
  }

  /// `Request another code`
  String get anotherCode {
    return Intl.message(
      'Request another code',
      name: 'anotherCode',
      desc: '',
      args: [],
    );
  }

  /// `Code sent`
  String get codeSent {
    return Intl.message('Code sent', name: 'codeSent', desc: '', args: []);
  }

  /// `Sign up with Google`
  String get registerGoogle {
    return Intl.message(
      'Sign up with Google',
      name: 'registerGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get access {
    return Intl.message('Login', name: 'access', desc: '', args: []);
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? Sign up`
  String get noAccount {
    return Intl.message(
      'Don’t have an account? Sign up',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Reset email {statussent}`
  String resetEmailSent(Object statussent) {
    return Intl.message(
      'Reset email $statussent',
      name: 'resetEmailSent',
      desc: '',
      args: [statussent],
    );
  }

  /// `already`
  String get already {
    return Intl.message('already', name: 'already', desc: '', args: []);
  }

  /// `Where do you want to select the image from?`
  String get whereSelectImg {
    return Intl.message(
      'Where do you want to select the image from?',
      name: 'whereSelectImg',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Already have an account? Login`
  String get alreadyAccount {
    return Intl.message(
      'Already have an account? Login',
      name: 'alreadyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message('Privacy', name: 'privacy', desc: '', args: []);
  }

  /// `You must accept the privacy policy`
  String get acceptPrivacy {
    return Intl.message(
      'You must accept the privacy policy',
      name: 'acceptPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Capture date`
  String get captureDate {
    return Intl.message(
      'Capture date',
      name: 'captureDate',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Data saved successfully`
  String get dataSaved {
    return Intl.message(
      'Data saved successfully',
      name: 'dataSaved',
      desc: '',
      args: [],
    );
  }

  /// `Nation`
  String get nation {
    return Intl.message('Nation', name: 'nation', desc: '', args: []);
  }

  /// `Bike saved as favorite`
  String get favouriteMotoSaved {
    return Intl.message(
      'Bike saved as favorite',
      name: 'favouriteMotoSaved',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get info {
    return Intl.message('Information', name: 'info', desc: '', args: []);
  }

  /// `State`
  String get state {
    return Intl.message('State', name: 'state', desc: '', args: []);
  }

  /// `Received {when}`
  String received(Object when) {
    return Intl.message(
      'Received $when',
      name: 'received',
      desc: '',
      args: [when],
    );
  }

  /// `Read {when}`
  String read(Object when) {
    return Intl.message('Read $when', name: 'read', desc: '', args: [when]);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Delete notifications`
  String get deleteNotifications {
    return Intl.message(
      'Delete notifications',
      name: 'deleteNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all notifications?`
  String get deleteNotificationsSure {
    return Intl.message(
      'Are you sure you want to delete all notifications?',
      name: 'deleteNotificationsSure',
      desc: '',
      args: [],
    );
  }

  /// `No new notifications`
  String get noNewNotifications {
    return Intl.message(
      'No new notifications',
      name: 'noNewNotifications',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t collected any bikes yet`
  String get noCollecting {
    return Intl.message(
      'You haven’t collected any bikes yet',
      name: 'noCollecting',
      desc: '',
      args: [],
    );
  }

  /// `Start collecting`
  String get startCollecting {
    return Intl.message(
      'Start collecting',
      name: 'startCollecting',
      desc: '',
      args: [],
    );
  }

  /// `Choose your bike`
  String get chooseMoto {
    return Intl.message(
      'Choose your bike',
      name: 'chooseMoto',
      desc: '',
      args: [],
    );
  }

  /// `I choose you!`
  String get chooseYou {
    return Intl.message('I choose you!', name: 'chooseYou', desc: '', args: []);
  }

  /// `Is this the bike you want to use for the race?`
  String get motoForRaceTitle {
    return Intl.message(
      'Is this the bike you want to use for the race?',
      name: 'motoForRaceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Once chosen, you cannot change it until the next tournament.`
  String get motoForRaceMessage {
    return Intl.message(
      'Once chosen, you cannot change it until the next tournament.',
      name: 'motoForRaceMessage',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message('Choose', name: 'choose', desc: '', args: []);
  }

  /// `Selected bike`
  String get selectedMoto {
    return Intl.message(
      'Selected bike',
      name: 'selectedMoto',
      desc: '',
      args: [],
    );
  }

  /// `Error selecting the bike`
  String get selectedMotoError {
    return Intl.message(
      'Error selecting the bike',
      name: 'selectedMotoError',
      desc: '',
      args: [],
    );
  }

  /// `View info`
  String get seeInfo {
    return Intl.message('View info', name: 'seeInfo', desc: '', args: []);
  }

  /// `Bike successfully registered for the tournament`
  String get motoRegistered {
    return Intl.message(
      'Bike successfully registered for the tournament',
      name: 'motoRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Back to home`
  String get backHome {
    return Intl.message('Back to home', name: 'backHome', desc: '', args: []);
  }

  /// `Skip`
  String get jump {
    return Intl.message('Skip', name: 'jump', desc: '', args: []);
  }

  /// `Medals`
  String get medals {
    return Intl.message('Medals', name: 'medals', desc: '', args: []);
  }

  /// `You haven’t won any medals yet`
  String get noMedals {
    return Intl.message(
      'You haven’t won any medals yet',
      name: 'noMedals',
      desc: '',
      args: [],
    );
  }

  /// `Rosettes`
  String get cockades {
    return Intl.message('Rosettes', name: 'cockades', desc: '', args: []);
  }

  /// `You haven’t won any rosettes yet`
  String get noCockades {
    return Intl.message(
      'You haven’t won any rosettes yet',
      name: 'noCockades',
      desc: '',
      args: [],
    );
  }

  /// `{howMany} bikes captured`
  String numMotosCaptured(Object howMany) {
    return Intl.message(
      '$howMany bikes captured',
      name: 'numMotosCaptured',
      desc: '',
      args: [howMany],
    );
  }

  /// `Error loading participation`
  String get errorLoadingPartecipation {
    return Intl.message(
      'Error loading participation',
      name: 'errorLoadingPartecipation',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t participated in any tournaments yet`
  String get youNoTournamentsPartecipations {
    return Intl.message(
      'You haven’t participated in any tournaments yet',
      name: 'youNoTournamentsPartecipations',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t participated in any tournaments yet`
  String get heNoTournamentsPartecipations {
    return Intl.message(
      'You haven’t participated in any tournaments yet',
      name: 'heNoTournamentsPartecipations',
      desc: '',
      args: [],
    );
  }

  /// `Participate in the tournament`
  String get partecipateTournaments {
    return Intl.message(
      'Participate in the tournament',
      name: 'partecipateTournaments',
      desc: '',
      args: [],
    );
  }

  /// `Wins`
  String get wins {
    return Intl.message('Wins', name: 'wins', desc: '', args: []);
  }

  /// `Top bike`
  String get topMoto {
    return Intl.message('Top bike', name: 'topMoto', desc: '', args: []);
  }

  /// `Bikes captured: {realNum}{limit}`
  String percMotosCaptured(Object realNum, Object limit) {
    return Intl.message(
      'Bikes captured: $realNum$limit',
      name: 'percMotosCaptured',
      desc: '',
      args: [realNum, limit],
    );
  }

  /// `Captured bikes`
  String get capturedMotos {
    return Intl.message(
      'Captured bikes',
      name: 'capturedMotos',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get deleteAccountTitle {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'deleteAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Once confirmed, you will no longer be able to access your profile`
  String get deleteAccountMessage {
    return Intl.message(
      'Once confirmed, you will no longer be able to access your profile',
      name: 'deleteAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `Saving completed`
  String get savingCompleted {
    return Intl.message(
      'Saving completed',
      name: 'savingCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get privacyPolicy {
    return Intl.message(
      'Terms and conditions',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Tournament`
  String get tournament {
    return Intl.message('Tournament', name: 'tournament', desc: '', args: []);
  }

  /// `You cannot vote again on this round`
  String get alreadyVoted {
    return Intl.message(
      'You cannot vote again on this round',
      name: 'alreadyVoted',
      desc: '',
      args: [],
    );
  }

  /// `You earned a point!`
  String get pointGained {
    return Intl.message(
      'You earned a point!',
      name: 'pointGained',
      desc: '',
      args: [],
    );
  }

  /// `Vote`
  String get vote {
    return Intl.message('Vote', name: 'vote', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Points {howMany}`
  String points(Object howMany) {
    return Intl.message(
      'Points $howMany',
      name: 'points',
      desc: '',
      args: [howMany],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Camera`
  String get photocamera {
    return Intl.message('Camera', name: 'photocamera', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to logout?`
  String get logoutTitle {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Once logged out, you will need to log in again to use the app`
  String get logoutMessage {
    return Intl.message(
      'Once logged out, you will need to log in again to use the app',
      name: 'logoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Updated language`
  String get updatedLanguage {
    return Intl.message(
      'Updated language',
      name: 'updatedLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language Update Failed`
  String get nonUpdatedLanguage {
    return Intl.message(
      'Language Update Failed',
      name: 'nonUpdatedLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Choose the language`
  String get chooseLanguage {
    return Intl.message(
      'Choose the language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Insert brand`
  String get insertBrand {
    return Intl.message(
      'Insert brand',
      name: 'insertBrand',
      desc: '',
      args: [],
    );
  }

  /// `Insert model`
  String get insertModel {
    return Intl.message(
      'Insert model',
      name: 'insertModel',
      desc: '',
      args: [],
    );
  }

  /// `Insert year`
  String get insertYear {
    return Intl.message('Insert year', name: 'insertYear', desc: '', args: []);
  }

  /// `Insert location`
  String get insertLocation {
    return Intl.message(
      'Insert location',
      name: 'insertLocation',
      desc: '',
      args: [],
    );
  }

  /// `Insert old password`
  String get insertOldPassword {
    return Intl.message(
      'Insert old password',
      name: 'insertOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Insert new password`
  String get insertNewPassword {
    return Intl.message(
      'Insert new password',
      name: 'insertNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Insert confirm password`
  String get insertConfirmPassword {
    return Intl.message(
      'Insert confirm password',
      name: 'insertConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `{name} medal`
  String medal(Object name) {
    return Intl.message('$name medal', name: 'medal', desc: '', args: [name]);
  }

  /// `Bronze`
  String get bronze {
    return Intl.message('Bronze', name: 'bronze', desc: '', args: []);
  }

  /// `Silver`
  String get silver {
    return Intl.message('Silver', name: 'silver', desc: '', args: []);
  }

  /// `Gold`
  String get gold {
    return Intl.message('Gold', name: 'gold', desc: '', args: []);
  }

  /// `Platinum`
  String get platinum {
    return Intl.message('Platinum', name: 'platinum', desc: '', args: []);
  }

  /// `Diamond`
  String get diamond {
    return Intl.message('Diamond', name: 'diamond', desc: '', args: []);
  }

  /// `The username is already in use`
  String get usernameNotUnique {
    return Intl.message(
      'The username is already in use',
      name: 'usernameNotUnique',
      desc: '',
      args: [],
    );
  }

  /// `The email is already in use`
  String get emailNotUnique {
    return Intl.message(
      'The email is already in use',
      name: 'emailNotUnique',
      desc: '',
      args: [],
    );
  }

  /// `The avatar is too heavy`
  String get avatarTooBig {
    return Intl.message(
      'The avatar is too heavy',
      name: 'avatarTooBig',
      desc: '',
      args: [],
    );
  }

  /// `Don't show again`
  String get dontShowAgain {
    return Intl.message(
      'Don\'t show again',
      name: 'dontShowAgain',
      desc: '',
      args: [],
    );
  }

  /// `Here you can insert photos of your personal motorcycle; insert up to 5 photos, also selectable from the gallery. You can insert new photos via the capture button by selecting the GARAGE option.`
  String get garageInfoMessage {
    return Intl.message(
      'Here you can insert photos of your personal motorcycle; insert up to 5 photos, also selectable from the gallery. You can insert new photos via the capture button by selecting the GARAGE option.',
      name: 'garageInfoMessage',
      desc: '',
      args: [],
    );
  }

  /// `Here you will have the complete list of collectible motorcycles; expand your collection to earn medals. Capture the motorcycles using the capture button while remaining in the COLLECTION section.`
  String get collectionInfoMessage {
    return Intl.message(
      'Here you will have the complete list of collectible motorcycles; expand your collection to earn medals. Capture the motorcycles using the capture button while remaining in the COLLECTION section.',
      name: 'collectionInfoMessage',
      desc: '',
      args: [],
    );
  }

  /// `Continue capturing different motorcycles of any kind to build your medals and rosettes board, challenge the rest of the world by showcasing your achievements. The more captures you achieve, the more points you will earn to obtain increasingly prestigious medals. The more types of motorcycles you capture, the more that type's rosette will grow.`
  String get medaglieInfoMessage {
    return Intl.message(
      'Continue capturing different motorcycles of any kind to build your medals and rosettes board, challenge the rest of the world by showcasing your achievements. The more captures you achieve, the more points you will earn to obtain increasingly prestigious medals. The more types of motorcycles you capture, the more that type\'s rosette will grow.',
      name: 'medaglieInfoMessage',
      desc: '',
      args: [],
    );
  }

  /// `1. Participate in the tournament: register a capture in this tournament of 32 players, divided by similar motorcycle categories. Face off 1 vs 1 in daily direct elimination matches. Registration is only possible every Monday from 00:00 to 23:59. The winner of each match will be declared at 00:00 the next day. The final face-off takes place every Friday and the tournament champion will be declared at 00:00 on Saturday morning. The more victories you achieve, the more Cup points you will earn. Remember to complete the daily votings to earn Cup points and not lose the right to register for the next tournament.\n\n2. Vote: perform daily votings to earn the right to continue participating in the tournament and easily gain Cup points. You need 3 daily votings to not lose eligibility.\n\n3. Leaderboard: check the matches you have participated in and view your position in the general or friends leaderboard.`
  String get tournamentInfoMessage {
    return Intl.message(
      '1. Participate in the tournament: register a capture in this tournament of 32 players, divided by similar motorcycle categories. Face off 1 vs 1 in daily direct elimination matches. Registration is only possible every Monday from 00:00 to 23:59. The winner of each match will be declared at 00:00 the next day. The final face-off takes place every Friday and the tournament champion will be declared at 00:00 on Saturday morning. The more victories you achieve, the more Cup points you will earn. Remember to complete the daily votings to earn Cup points and not lose the right to register for the next tournament.\n\n2. Vote: perform daily votings to earn the right to continue participating in the tournament and easily gain Cup points. You need 3 daily votings to not lose eligibility.\n\n3. Leaderboard: check the matches you have participated in and view your position in the general or friends leaderboard.',
      name: 'tournamentInfoMessage',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for reporting, the capture will be put under investigation`
  String get reportFeedback {
    return Intl.message(
      'Thanks for reporting, the capture will be put under investigation',
      name: 'reportFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Error reporting`
  String get reportError {
    return Intl.message(
      'Error reporting',
      name: 'reportError',
      desc: '',
      args: [],
    );
  }

  /// `Gallery option is locked. Unlock it with the Premium Pass.`
  String get galleryLockedMessage {
    return Intl.message(
      'Gallery option is locked. Unlock it with the Premium Pass.',
      name: 'galleryLockedMessage',
      desc: '',
      args: [],
    );
  }

  /// `You have reached the 5-photo limit; delete a photo to add a new one.`
  String get galleryLimitExceededMessage {
    return Intl.message(
      'You have reached the 5-photo limit; delete a photo to add a new one.',
      name: 'galleryLimitExceededMessage',
      desc: '',
      args: [],
    );
  }

  /// `Report reason`
  String get reportReason {
    return Intl.message(
      'Report reason',
      name: 'reportReason',
      desc: '',
      args: [],
    );
  }

  /// `Enter an optional reason`
  String get enterReasonOptional {
    return Intl.message(
      'Enter an optional reason',
      name: 'enterReasonOptional',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to report this photo?`
  String get reportConfirmation {
    return Intl.message(
      'Do you really want to report this photo?',
      name: 'reportConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Possessed`
  String get possessed {
    return Intl.message('Possessed', name: 'possessed', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
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
