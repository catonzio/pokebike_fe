String toS(int n, {int pad = 2}) => n.toString().padLeft(pad, "0");

extension DateUtils on DateTime {
  String toFormattedString({bool withHour = false}) {
    String result = "${toS(day)}/${toS(month)}/${toS(year, pad: 4)}";

    if (withHour) {
      result += " ${toS(hour)}:${toS(minute)}:${toS(second)}";
    }

    return result;
  }

  static DateTime fromFormattedString(String string) {
    return DateTime.parse(string.replaceAll("/", "-"));
  }
}
