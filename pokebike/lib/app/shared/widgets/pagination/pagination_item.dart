class PaginationItem {
  final int index;
  final String text;
  final double leftPadding;
  final double rightPadding;
  final Function() onPressed;

  PaginationItem(
      {required this.index,
      required this.text,
      required this.onPressed,
      this.leftPadding = 4,
      this.rightPadding = 4});
}
