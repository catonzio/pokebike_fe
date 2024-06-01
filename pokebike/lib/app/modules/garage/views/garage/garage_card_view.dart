import 'package:flutter/material.dart';

class GarageCardWidget extends StatelessWidget {
  final int index;
  final Function() onTap;
  const GarageCardWidget({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: Image.network("https://picsum.photos/id/${100 + index}/300")
                .image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

