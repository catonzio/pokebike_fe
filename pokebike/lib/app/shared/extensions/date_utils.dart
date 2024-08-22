extension DateUtils on DateTime {
  String toFormattedString() {
    return "${day.toString().padLeft(2, "0")}/${month.toString().padLeft(2, "0")}/$year";
  }

  static DateTime fromFormattedString(String string) {
    return DateTime.parse(string.replaceAll("/", "-"));
  }
}
