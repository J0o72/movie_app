import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: widget.text != ''
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: Styles.styleText16,
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
                      child: Text(
                        isExpanded ? 'Read Less' : 'Read More',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Container(),
    );
  }
}
