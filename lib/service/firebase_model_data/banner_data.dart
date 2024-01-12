class BannerDataModel {
  final String bannerImage ;
  final String bannerLink;
  final bool visibility ;

   BannerDataModel(this.bannerImage, this.bannerLink, this.visibility);



}

List<BannerDataModel> bannerData = [
  BannerDataModel("https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/banner_1.jpg?alt=media&token=10af32f8-1d88-4e63-9aa1-ce842f4c468f", "", true),
  BannerDataModel("https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/banner_2.jpg?alt=media&token=37867082-856b-46b0-b7d4-6150bfff78b8", "", true),
  BannerDataModel("https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/banner_3.jpg?alt=media&token=fe9c1909-068a-4183-b492-f71e4e408ab3", "", true),

];