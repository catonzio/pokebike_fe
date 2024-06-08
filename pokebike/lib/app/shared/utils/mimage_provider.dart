class MImageProvider {
  static String getImageUrl({int? index, int width = 300, int height = 300}) {
    const String baseUrl = "https://picsum.photos";
    final idString = index != null ? "id/${1000 + index}/" : "";
    return "$baseUrl/$idString$width/$height";
  }
}
