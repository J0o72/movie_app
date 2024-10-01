import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  const ReadMoreText({super.key, required this.text, this.maxLines = 3});
  final String text;
  final int maxLines;

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : widget.maxLines,
          overflow: TextOverflow.fade,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                alignment: Alignment.topCenter,
              ),
              onPressed: toggleExpanded,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  isExpanded ? 'Read Less' : 'Read More',
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
