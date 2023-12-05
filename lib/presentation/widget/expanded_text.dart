import 'package:flutter/material.dart';

class ExpandedText extends StatelessWidget {
  final String text;
  final int maxLines;
  const ExpandedText({super.key, required this.text, this.maxLines=2});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    ));
  }
}
