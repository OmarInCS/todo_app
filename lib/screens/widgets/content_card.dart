

import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';

class ContentCard extends StatefulWidget {
  final String title;
  final String content;
  final bool showPlayIcon;
  const ContentCard({required this.title, required this.content, this.showPlayIcon = false,  Key? key}) : super(key: key);

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                if(widget.showPlayIcon)
                  const Icon(
                      Icons.play_circle_fill
                  )
              ],
            ),
            const Divider(
              thickness: 2,
              color: primaryLight,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.content,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,

                  ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
