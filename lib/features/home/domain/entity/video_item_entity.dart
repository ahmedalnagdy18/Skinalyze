import 'package:flutter/material.dart';
import 'package:skinalyze/generated/l10n.dart';

class VideoItem {
  final String title;
  final String description;
  final String link;

  VideoItem({
    required this.title,
    required this.description,
    required this.link,
  });
}

List<VideoItem> getVideoList(BuildContext context) {
  return [
    VideoItem(
      title: S.of(context).video1Title,
      description: S.of(context).video1Sub,
      link:
          "https://www.youtube.com/playlist?list=PLwXXOxvDboebSxn_Ormj3LdB6d_wVw4sS",
    ),
    VideoItem(
      title: S.of(context).video2Title,
      description: S.of(context).video2Sub,
      link:
          "https://www.youtube.com/playlist?list=PL8TjVyuBdsCmRrAn8HbmyI5oWkaR9Bqi3",
    ),
    VideoItem(
      title: S.of(context).video3Title,
      description: S.of(context).video3Sub,
      link: "https://www.youtube.com/watch?v=j6EB9HO6acE",
    ),
    VideoItem(
      title: S.of(context).video4Title,
      description: S.of(context).video4Sub,
      link: "https://www.youtube.com/watch?v=C7m3aCqE2fs",
    ),
  ];
}
