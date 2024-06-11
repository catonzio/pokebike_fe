class MImageProvider {
  static String getImageUrl({int? index, int width = 300, int height = 300}) {
    const String baseUrl = "https://picsum.photos";
    // const String baseUrl = "https://random.imagecdn.app";
    // final idString = index != null ? "id/${1000 + index}/" : "";
    final idString = index != null ? "random=$index/" : "";
    return "$baseUrl/$width/$height?$idString";
  }
}
