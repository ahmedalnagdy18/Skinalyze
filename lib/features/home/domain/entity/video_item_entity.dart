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

List<VideoItem> videoList = [
  VideoItem(
    title: "Introduction to AI",
    description: "Learn the basics of Artificial Intelligence.",
    link:
        "https://www.youtube.com/playlist?list=PLwXXOxvDboebSxn_Ormj3LdB6d_wVw4sS",
  ),
  VideoItem(
    title: "Machine Learning Explained",
    description: "A deep dive into machine learning concepts.",
    link:
        "https://www.youtube.com/playlist?list=PL8TjVyuBdsCmRrAn8HbmyI5oWkaR9Bqi3",
  ),
  VideoItem(
    title: "AI in Healthcare",
    description: "How AI is transforming the medical field.",
    link: "https://www.youtube.com/watch?v=j6EB9HO6acE",
  ),
  VideoItem(
    title: "Neural Networks Demystified",
    description: "Understanding how neural networks process data.",
    link: "https://www.youtube.com/watch?v=C7m3aCqE2fs",
  ),
];
