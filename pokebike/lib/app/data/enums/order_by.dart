enum OrderBy {
  none,
  alphabet,
  recent;
}

extension OrderByExtension on OrderBy {
  String get name {
    switch (this) {
      case OrderBy.none:
        return "";
      case OrderBy.alphabet:
        return "Dalla A alla Z";
      case OrderBy.recent:
        return "Più recenti";
      default:
        return "";
    }
  }
}
