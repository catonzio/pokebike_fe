import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class Constants {
  // static const String baseUrl = "https://danilocatone.com/moto_hunters";
  static const bool isLocal = false;
  static final String baseUrl = isLocal
      ? (Platform.isAndroid ? "http://10.0.2.2:8080" : "http://127.0.0.1:8080")
      : "http://console.motohunters.it";
  static final String apiBaseUrl = "$baseUrl/api";
  static final String apiStorageUrl = "$baseUrl/storage";
  static const String googleServerClientIdAndroid =
      '776310891261-0e8pmdce9cvu33oqsarmt8t1n22c1la9.apps.googleusercontent.com';
  // static const String apiBaseUrl = "http://127.0.0.1:8080/api";

  static const String settingsStorage = "settings";

  static const double bottomNavbarHeight = 130;
  static const double fabOffset = 200;
  static const int numCommunityHome = 7;

  static const String iubendaUrl =
      "https://www.iubenda.com/privacy-policy/12390454";

  static const SliverGridDelegate gridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.3,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
  );

  static const Map<String, List<String>?> filterBoxes = {
    "Ordina per": ["Più recenti", "Dalla A alla Z"],
    "Tipo": [
      "Naked",
      "Supersportive",
      "Adventure",
      "Cruiser",
      "Chopper",
      "Bobber",
      "Modern classic",
      "Touring",
      "Sport touring",
      "Enduro",
      "Cross",
      "Motard",
      "Trial",
      "125cc"
    ],
    "Marca": [
      "Adiva",
      "AJP",
      "Aprilia",
      "Archive Motorcycle",
      "Askoll",
      "Benelli",
      "Beta",
      "Bimota",
      "BMW",
      "Brixton",
      "CFMOTO",
      "Derbi",
      "Doohan",
      "Ducati",
      "Ecobit",
      "Energica",
      "F.B. Mondial",
      "Fantic",
      "FK Motors",
      "Garelli",
      "Gas Gas",
      "Hanway",
      "Harley-Davidson",
      "Honda",
      "Husqvarna",
      "Indian",
      "Italjet",
      "Kawasaki",
      "Keeway",
      "KL",
      "KTM",
      "Kimco",
      "Lambretta",
      "Lem",
      "Lifan",
      "Malaguti",
      "Mash",
      "Me",
      "Montesa",
      "Moto Guzzi",
      "Moto Morini",
      "MV Agusta",
      "Nito",
      "Niu",
      "Nox",
      "Orcal",
      "Over",
      "Peugeot",
      "Piaggio",
      "Polini",
      "Qooder",
      "RedMoto Honda",
      "Rieju",
      "Royal Alloy",
      "Royal Enfield",
      "Scorpa",
      "Senke",
      "Sherco",
      "Silence",
      "SMR Motorcycle",
      "Somoto",
      "Suzuki",
      "SWM",
      "Sym",
      "Tacita",
      "TM Racing",
      "Triumph",
      "Trs",
      "UM",
      "Vent",
      "Verve Moto",
      "WT Motors",
      "Yamaha",
      "YCF",
      "Zero Motorcycles",
      "Zontes"
    ],
  };
}
