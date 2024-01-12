class LiveTvModel {
  final String liveTvImage;
  final String liveTvUrl;
  final String title;
  final String subTitle;
  final bool visibility;

  LiveTvModel(
      {required this.liveTvImage,
      required this.liveTvUrl,
      required this.visibility,
      required this.title,
      required this.subTitle});
}

List<LiveTvModel> liveTvData = [
  LiveTvModel(
      liveTvImage:
          "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/live_tv_1.png?alt=media&token=8043eceb-72d9-481a-b9a3-96e3f0bb7d4e",
      liveTvUrl: "https://lakay.online/public/telelabrise/index.m3u8",
      visibility: true,
      title: "Channel A",
      subTitle: "live"),
  LiveTvModel(
      liveTvImage:
          "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/live_tv_2.png?alt=media&token=32c8a5ff-9f6a-414c-8b79-cd266b924525",
      liveTvUrl: "https://lakay.online/public/telelabrise/index.m3u8",
      visibility: true,
      title: "Channel B",
      subTitle: "live"),
  LiveTvModel(
      liveTvImage:
          "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/live_tv_3.png?alt=media&token=1115c93d-93a4-4929-9480-44a684c68496",
      liveTvUrl: "https://lakay.online/public/telelabrise/index.m3u8",
      visibility: true,
      title: "Channel C",
      subTitle: "live"),
  LiveTvModel(
      liveTvImage:
          "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/live_tv_4.png?alt=media&token=d9e889e6-b803-4379-92af-e020193de095",
      liveTvUrl: "https://lakay.online/public/telelabrise/index.m3u8",
      visibility: true,
      title: "Channel D",
      subTitle: "live"),
  LiveTvModel(
      liveTvImage:
          "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/live_tv_5.png?alt=media&token=3c0e5e25-879d-4850-b8b6-418a239a2a50",
      liveTvUrl: "https://lakay.online/public/telelabrise/index.m3u8",
      visibility: true,
      title: "Channel E",
      subTitle: "live"),
  LiveTvModel(
      liveTvImage:
          "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/live_tv_6.png?alt=media&token=cbe888e3-43e3-47ad-8478-594cd0368941",
      liveTvUrl: "https://lakay.online/public/telelabrise/index.m3u8",
      visibility: true,
      title: "Channel F",
      subTitle: "live"),
];