// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(name) => "${name} medal";

  static String m1(howMany) => "${howMany} bikes captured";

  static String m2(realNum, limit) => "Bikes captured: ${realNum}${limit}";

  static String m3(howMany) => "Points ${howMany}";

  static String m4(when) => "Read ${when}";

  static String m5(when) => "Received ${when}";

  static String m6(statussent) => "Reset email ${statussent}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "acceptPrivacy": MessageLookupByLibrary.simpleMessage(
      "You must accept the privacy policy",
    ),
    "access": MessageLookupByLibrary.simpleMessage("Login"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addMoto": MessageLookupByLibrary.simpleMessage("Add bike"),
    "already": MessageLookupByLibrary.simpleMessage("already"),
    "alreadyAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account? Login",
    ),
    "alreadyVoted": MessageLookupByLibrary.simpleMessage(
      "You cannot vote again on this round",
    ),
    "anotherCode": MessageLookupByLibrary.simpleMessage("Request another code"),
    "apply": MessageLookupByLibrary.simpleMessage("Apply"),
    "avatarTooBig": MessageLookupByLibrary.simpleMessage(
      "The avatar is too heavy",
    ),
    "backHome": MessageLookupByLibrary.simpleMessage("Back to home"),
    "birthday": MessageLookupByLibrary.simpleMessage("Birthday"),
    "birthdayNoEmpty": MessageLookupByLibrary.simpleMessage(
      "Birthday cannot be empty",
    ),
    "brand": MessageLookupByLibrary.simpleMessage("Brand"),
    "bronze": MessageLookupByLibrary.simpleMessage("Bronze"),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "captureDate": MessageLookupByLibrary.simpleMessage("Capture date"),
    "capturedMotos": MessageLookupByLibrary.simpleMessage("Captured bikes"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change password"),
    "choose": MessageLookupByLibrary.simpleMessage("Choose"),
    "chooseLanguage": MessageLookupByLibrary.simpleMessage(
      "Choose the language",
    ),
    "chooseMoto": MessageLookupByLibrary.simpleMessage("Choose your bike"),
    "chooseYou": MessageLookupByLibrary.simpleMessage("I choose you!"),
    "cockades": MessageLookupByLibrary.simpleMessage("Rosettes"),
    "codeEmpty": MessageLookupByLibrary.simpleMessage(
      "The code cannot be empty",
    ),
    "codeSent": MessageLookupByLibrary.simpleMessage("Code sent"),
    "codeViaEmail": MessageLookupByLibrary.simpleMessage(
      "Enter the code received via email",
    ),
    "collection": MessageLookupByLibrary.simpleMessage("Collection"),
    "collectionInfoMessage": MessageLookupByLibrary.simpleMessage(
      "Here you will have the complete list of collectible motorcycles; expand your collection to earn medals. Capture the motorcycles using the capture button while remaining in the COLLECTION section.",
    ),
    "community": MessageLookupByLibrary.simpleMessage("Community"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "dataSaved": MessageLookupByLibrary.simpleMessage(
      "Data saved successfully",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
    "deleteAccountMessage": MessageLookupByLibrary.simpleMessage(
      "Once confirmed, you will no longer be able to access your profile",
    ),
    "deleteAccountTitle": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account?",
    ),
    "deleteNotifications": MessageLookupByLibrary.simpleMessage(
      "Delete notifications",
    ),
    "deleteNotificationsSure": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete all notifications?",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "diamond": MessageLookupByLibrary.simpleMessage("Diamond"),
    "dontShowAgain": MessageLookupByLibrary.simpleMessage("Don\'t show again"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailNoEmpty": MessageLookupByLibrary.simpleMessage(
      "Email cannot be empty",
    ),
    "emailNotUnique": MessageLookupByLibrary.simpleMessage(
      "The email is already in use",
    ),
    "emailNotValid": MessageLookupByLibrary.simpleMessage(
      "Enter a valid email",
    ),
    "emptyCommunity": MessageLookupByLibrary.simpleMessage(
      "The community is empty",
    ),
    "enterReasonOptional": MessageLookupByLibrary.simpleMessage(
      "Enter an optional reason",
    ),
    "errorLoadingPartecipation": MessageLookupByLibrary.simpleMessage(
      "Error loading participation",
    ),
    "exit": MessageLookupByLibrary.simpleMessage("Exit"),
    "favouriteMotoSaved": MessageLookupByLibrary.simpleMessage(
      "Bike saved as favorite",
    ),
    "frwd": MessageLookupByLibrary.simpleMessage("Forward"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "galleryLimitExceededMessage": MessageLookupByLibrary.simpleMessage(
      "You have reached the 5-photo limit; delete a photo to add a new one.",
    ),
    "galleryLockedMessage": MessageLookupByLibrary.simpleMessage(
      "Gallery option is locked. Unlock it with the Premium Pass.",
    ),
    "garage": MessageLookupByLibrary.simpleMessage("Garage"),
    "garageInfoMessage": MessageLookupByLibrary.simpleMessage(
      "Here you can insert photos of your personal motorcycle; insert up to 5 photos, also selectable from the gallery. You can insert new photos via the capture button by selecting the GARAGE option.",
    ),
    "generalLeaderboard": MessageLookupByLibrary.simpleMessage(
      "General leaderboard",
    ),
    "gold": MessageLookupByLibrary.simpleMessage("Gold"),
    "heNoTournamentsPartecipations": MessageLookupByLibrary.simpleMessage(
      "You haven’t participated in any tournaments yet",
    ),
    "hello": MessageLookupByLibrary.simpleMessage("Hello"),
    "helloBiker": MessageLookupByLibrary.simpleMessage("Hello Biker!"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "info": MessageLookupByLibrary.simpleMessage("Information"),
    "insertBrand": MessageLookupByLibrary.simpleMessage("Insert brand"),
    "insertCode": MessageLookupByLibrary.simpleMessage("Insert the code"),
    "insertConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Insert confirm password",
    ),
    "insertLocation": MessageLookupByLibrary.simpleMessage("Insert location"),
    "insertModel": MessageLookupByLibrary.simpleMessage("Insert model"),
    "insertNewPassword": MessageLookupByLibrary.simpleMessage(
      "Insert new password",
    ),
    "insertOldPassword": MessageLookupByLibrary.simpleMessage(
      "Insert old password",
    ),
    "insertYear": MessageLookupByLibrary.simpleMessage("Insert year"),
    "jump": MessageLookupByLibrary.simpleMessage("Skip"),
    "leaderboard": MessageLookupByLibrary.simpleMessage("Leaderboard"),
    "location": MessageLookupByLibrary.simpleMessage("Location"),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutMessage": MessageLookupByLibrary.simpleMessage(
      "Once logged out, you will need to log in again to use the app",
    ),
    "logoutTitle": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to logout?",
    ),
    "medaglieInfoMessage": MessageLookupByLibrary.simpleMessage(
      "Continue capturing different motorcycles of any kind to build your medals and rosettes board, challenge the rest of the world by showcasing your achievements. The more captures you achieve, the more points you will earn to obtain increasingly prestigious medals. The more types of motorcycles you capture, the more that type\'s rosette will grow.",
    ),
    "medal": m0,
    "medals": MessageLookupByLibrary.simpleMessage("Medals"),
    "model": MessageLookupByLibrary.simpleMessage("Model"),
    "motoAlreadyInserted": MessageLookupByLibrary.simpleMessage(
      "Bike already added",
    ),
    "motoAlreadyInsertedSubtitle": MessageLookupByLibrary.simpleMessage(
      "The bike you are trying to save is already in your collection. Are you sure you want to replace it with this new capture?",
    ),
    "motoForRaceMessage": MessageLookupByLibrary.simpleMessage(
      "Once chosen, you cannot change it until the next tournament.",
    ),
    "motoForRaceTitle": MessageLookupByLibrary.simpleMessage(
      "Is this the bike you want to use for the race?",
    ),
    "motoRegistered": MessageLookupByLibrary.simpleMessage(
      "Bike successfully registered for the tournament",
    ),
    "motoSaved": MessageLookupByLibrary.simpleMessage(
      "Bike saved successfully",
    ),
    "mustSelectAvatar": MessageLookupByLibrary.simpleMessage(
      "You must select an avatar",
    ),
    "myGarage": MessageLookupByLibrary.simpleMessage("My garage"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "nameNoEmpty": MessageLookupByLibrary.simpleMessage("Name cannot be empty"),
    "nation": MessageLookupByLibrary.simpleMessage("Nation"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
    "noAccount": MessageLookupByLibrary.simpleMessage(
      "Don’t have an account? Sign up",
    ),
    "noCockades": MessageLookupByLibrary.simpleMessage(
      "You haven’t won any rosettes yet",
    ),
    "noCollecting": MessageLookupByLibrary.simpleMessage(
      "You haven’t collected any bikes yet",
    ),
    "noInternet": MessageLookupByLibrary.simpleMessage(
      "Check your internet connection",
    ),
    "noMedals": MessageLookupByLibrary.simpleMessage(
      "You haven’t won any medals yet",
    ),
    "noMotoAdded": MessageLookupByLibrary.simpleMessage(
      "You haven’t added any bikes yet",
    ),
    "noMotoFoundFilter": MessageLookupByLibrary.simpleMessage(
      "No bikes found with these filters",
    ),
    "noNewNotifications": MessageLookupByLibrary.simpleMessage(
      "No new notifications",
    ),
    "noWinner": MessageLookupByLibrary.simpleMessage(
      "The winner has not been chosen yet",
    ),
    "nonUpdatedLanguage": MessageLookupByLibrary.simpleMessage(
      "Language Update Failed",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "nullify": MessageLookupByLibrary.simpleMessage("Cancel"),
    "numMotosCaptured": m1,
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "oldPassword": MessageLookupByLibrary.simpleMessage("Old password"),
    "or": MessageLookupByLibrary.simpleMessage("or"),
    "orderBy": MessageLookupByLibrary.simpleMessage("Sort by"),
    "partecipateTournaments": MessageLookupByLibrary.simpleMessage(
      "Participate in the tournament",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordConfirm": MessageLookupByLibrary.simpleMessage("Confirm password"),
    "percMotosCaptured": m2,
    "photocamera": MessageLookupByLibrary.simpleMessage("Camera"),
    "platinum": MessageLookupByLibrary.simpleMessage("Platinum"),
    "pointGained": MessageLookupByLibrary.simpleMessage("You earned a point!"),
    "points": m3,
    "presentation1Subtitle1": MessageLookupByLibrary.simpleMessage(
      "Collect the bikes you like\nwith a click",
    ),
    "presentation1Title": MessageLookupByLibrary.simpleMessage("Collect"),
    "presentation2Subtitle1": MessageLookupByLibrary.simpleMessage(
      "Compete with your favorite bikes\nand win medals",
    ),
    "presentation2Title": MessageLookupByLibrary.simpleMessage("Tournaments"),
    "presentation3Subtitle1": MessageLookupByLibrary.simpleMessage(
      "Share your adventures\nwith your bike with friends",
    ),
    "presentation3Title": MessageLookupByLibrary.simpleMessage("Community"),
    "privacy": MessageLookupByLibrary.simpleMessage("Privacy"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Terms and conditions",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "pwd8chars": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters long",
    ),
    "pwdForgot": MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "pwdNoCoincide": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "pwdNoEmpty": MessageLookupByLibrary.simpleMessage(
      "Password cannot be empty",
    ),
    "read": m4,
    "received": m5,
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign up with Google",
    ),
    "registerYou": MessageLookupByLibrary.simpleMessage("Sign up"),
    "reportConfirmation": MessageLookupByLibrary.simpleMessage(
      "Do you really want to report this photo?",
    ),
    "reportError": MessageLookupByLibrary.simpleMessage("Error reporting"),
    "reportFeedback": MessageLookupByLibrary.simpleMessage(
      "Thanks for reporting, the capture will be put under investigation",
    ),
    "reportReason": MessageLookupByLibrary.simpleMessage("Report reason"),
    "resetEmailSent": m6,
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "savingCompleted": MessageLookupByLibrary.simpleMessage("Saving completed"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
    "seeInfo": MessageLookupByLibrary.simpleMessage("View info"),
    "selectAvatar": MessageLookupByLibrary.simpleMessage("Select avatar"),
    "selectedMoto": MessageLookupByLibrary.simpleMessage("Selected bike"),
    "selectedMotoError": MessageLookupByLibrary.simpleMessage(
      "Error selecting the bike",
    ),
    "share": MessageLookupByLibrary.simpleMessage("Share"),
    "silver": MessageLookupByLibrary.simpleMessage("Silver"),
    "startCollecting": MessageLookupByLibrary.simpleMessage("Start collecting"),
    "state": MessageLookupByLibrary.simpleMessage("State"),
    "story": MessageLookupByLibrary.simpleMessage("Story"),
    "substitute": MessageLookupByLibrary.simpleMessage("Replace"),
    "surname": MessageLookupByLibrary.simpleMessage("Surname"),
    "surnameNoEmpty": MessageLookupByLibrary.simpleMessage(
      "Surname cannot be empty",
    ),
    "topMoto": MessageLookupByLibrary.simpleMessage("Top bike"),
    "tournament": MessageLookupByLibrary.simpleMessage("Tournament"),
    "tournamentInfoMessage": MessageLookupByLibrary.simpleMessage(
      "1. Participate in the tournament: register a capture in this tournament of 32 players, divided by similar motorcycle categories. Face off 1 vs 1 in daily direct elimination matches. Registration is only possible every Monday from 00:00 to 23:59. The winner of each match will be declared at 00:00 the next day. The final face-off takes place every Friday and the tournament champion will be declared at 00:00 on Saturday morning. The more victories you achieve, the more Cup points you will earn. Remember to complete the daily votings to earn Cup points and not lose the right to register for the next tournament.\n\n2. Vote: perform daily votings to earn the right to continue participating in the tournament and easily gain Cup points. You need 3 daily votings to not lose eligibility.\n\n3. Leaderboard: check the matches you have participated in and view your position in the general or friends leaderboard.",
    ),
    "tournaments": MessageLookupByLibrary.simpleMessage("Tournaments"),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "updatedLanguage": MessageLookupByLibrary.simpleMessage("Updated language"),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "usernameNoEmpty": MessageLookupByLibrary.simpleMessage(
      "Username cannot be empty",
    ),
    "usernameNotUnique": MessageLookupByLibrary.simpleMessage(
      "The username is already in use",
    ),
    "vote": MessageLookupByLibrary.simpleMessage("Vote"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome!"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back!"),
    "whereSelectImg": MessageLookupByLibrary.simpleMessage(
      "Where do you want to select the image from?",
    ),
    "winner": MessageLookupByLibrary.simpleMessage("Winner"),
    "winnerIs": MessageLookupByLibrary.simpleMessage("The winner is:"),
    "wins": MessageLookupByLibrary.simpleMessage("Wins"),
    "year": MessageLookupByLibrary.simpleMessage("Year"),
    "youNoTournamentsPartecipations": MessageLookupByLibrary.simpleMessage(
      "You haven’t participated in any tournaments yet",
    ),
  };
}
