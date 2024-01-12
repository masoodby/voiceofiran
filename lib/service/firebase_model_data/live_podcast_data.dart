class LivePodcastModel {
  final String title, subTitle, url, banner;
  final bool visibility;

  LivePodcastModel(
      this.title, this.subTitle, this.url, this.banner, this.visibility);
}

List<LivePodcastModel> livePodcastData = [
  LivePodcastModel(
    "Live podcast with Elon Mask",
    "Topic: Space race",
    "https://lakay.online/public/telelabrise/index.m3u8",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/podcast_1.png?alt=media&token=38077ca5-6555-442b-97f6-574f23c66843",
    true,
  ),
  LivePodcastModel(
    "Live podcast with Bill Gets",
    "Topic: Tech vs Human",
    "https://lakay.online/public/telelabrise/index.m3u8",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/podcast_2.jpg?alt=media&token=df69e03c-9452-48d4-a0b6-0617da774b7c",
    true,
  ),
  LivePodcastModel(
    "Live podcast with Mark zuckerberg",
    "Topic: Social Media parse and cons",
    "https://lakay.online/public/telelabrise/index.m3u8",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/podcast_3.jpg?alt=media&token=cacc458c-bb7f-4c04-8ff9-9dc1697de254",
    true,
  ),
  LivePodcastModel(
    "Live podcast with Jeff Bezos ",
    "Topic: Future plan of blue origin",
    "https://lakay.online/public/telelabrise/index.m3u8",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/podcast_4.jpg?alt=media&token=a2c77a2f-39ef-4809-914f-388529dd6b70",
    true,
  ),
  LivePodcastModel(
    "Live podcast with Jack Ma",
    "Topic: Key parameter of Online Business",
    "https://lakay.online/public/telelabrise/index.m3u8",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/podcast_5.jpg?alt=media&token=52fc7833-1934-439d-ad4d-4e2aabf994c9",
    true,
  ),
  LivePodcastModel(
    "Live podcast with Appdevs",
    "Topic: Clean code and TDD",
    "https://lakay.online/public/telelabrise/index.m3u8",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/podcast_6.jpg?alt=media&token=420d11a9-dbd5-4964-a237-8d2edc90a4bc",
    true,
  ),
];