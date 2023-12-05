import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TodoTileWidget extends StatelessWidget {
  final String title;
  final String description;
  const TodoTileWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )),
        //

        const Gap(10),

        Flexible(
          child: Text(
            description,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13.0,
              fontFamily: 'Roboto',
              color: Color(0xFF212121),
            ),
            maxLines: 4,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
