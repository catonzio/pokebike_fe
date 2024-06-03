import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/shared/widgets/utils/mradio_button.dart';

class FilterModalBox extends StatelessWidget {
  final String title;
  final List<String> options;

  const FilterModalBox({super.key, required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.all(8),
      child: DefaultTextStyle(
        style: context.textTheme.bodyLarge!.copyWith(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title),
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.keyboard_arrow_down))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: options
                  .map((option) => ListTile(
                        leading: MRadioButton<String>(
                            groupValue: options.first,
                            value: option,
                            onChanged: (String value) => {}),
                        title: Text(option),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
