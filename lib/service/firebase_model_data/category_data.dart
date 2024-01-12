class CategoryModel {
  final String name, banner;
  final bool visibility;
  final List<Map> data;

  CategoryModel(this.name, this.banner, this.visibility, this.data);
}

class Data {
  final String banner, title, subTitle, url, summary;
  final bool visibility;

  Data(
      {required this.banner,
      required this.title,
      required this.subTitle,
      required this.url,
      required this.visibility,required this.summary,});
}

List<CategoryModel> categoriesData = [
  CategoryModel(
    "Adventure",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_2.jpg?alt=media&token=7d8bda3e-ab63-44b4-a40b-a8fc4764de5e",
    true,
    [
      {
        "banner":
        "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/movie_1.png?alt=media&token=2528e491-f054-480e-a30b-09b3df3b8438",
        "title": "Jungle Cruise | Movie",
        "subTitle": "action, adventure",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
      {
        "banner":
        "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/movie_2.png?alt=media&token=81201fc5-adf2-4f88-bdbb-e5cecefd8b50",
        "title": "Edge of Tomorrow",
        "subTitle": "Action, Adventure",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
      {
        "banner":
        "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/movie_3.png?alt=media&token=a7844552-88b4-4377-b594-8a50e733607b",
        "title": "Karnan | Movie | 2021 ",
        "subTitle": "Action . Adventure",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
    ],
  ),
  CategoryModel(
    "Live",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_1.jpg?alt=media&token=8406078c-45b3-40ef-992b-2bf0fa2012fc",
    true,
    [
      {
        "banner":
            "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_1.jpg?alt=media&token=8406078c-45b3-40ef-992b-2bf0fa2012fc",
        "title": "Live",
        "subTitle": "live",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
    ],
  ),
  CategoryModel(
    "Animation",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_3.jpg?alt=media&token=432f515c-f30f-4f29-88c7-97e47efef738",
    true,
    [
      {
        "banner":
            "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_3.jpg?alt=media&token=432f515c-f30f-4f29-88c7-97e47efef738",
        "title": "Free guy | Movie | 2022",
        "subTitle": "action, adventure, animation",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
    ],
  ),
  CategoryModel(
    "Thriller",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_6.jpg?alt=media&token=3eb94717-f563-434f-907f-48ae7487192f",
    true,
    [
      {
        "banner":
            "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_6.jpg?alt=media&token=3eb94717-f563-434f-907f-48ae7487192f",
        "title": "Thriller Movie",
        "subTitle": "Thriller ",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
    ],
  ),

  CategoryModel(
    "Fantasy",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_4.jpg?alt=media&token=81bd85b7-e530-4489-8705-5f3334064b1a",
    true,
    [
      {
        "banner":
            "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_4.jpg?alt=media&token=81bd85b7-e530-4489-8705-5f3334064b1a",
        "title": "title",
        "subTitle": "subTitle",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
    ],
  ),
  CategoryModel(
    "Football",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_7.jpg?alt=media&token=111a8a59-70ba-467d-9fee-17525c01898d",
    true,
    [
      {
        "banner":
            "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_7.jpg?alt=media&token=111a8a59-70ba-467d-9fee-17525c01898d",
        "title": "title",
        "subTitle": "subTitle",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
    ],
  ),
  CategoryModel(
    "Cricket",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_8.jpg?alt=media&token=95322498-5067-44d5-b021-f723dc39a29f",
    true,
    [
      {
        "banner":
            "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_8.jpg?alt=media&token=95322498-5067-44d5-b021-f723dc39a29f",
        "title": "title",
        "subTitle": "subTitle",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
    ],
  ),
  CategoryModel(
    "Sports",
    "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_5.jpg?alt=media&token=903749e2-e9a4-4592-900d-7ff3704a8fb6",
    true,
    [
      {
        "banner":
            "https://firebasestorage.googleapis.com/v0/b/podlive-app.appspot.com/o/category_5.jpg?alt=media&token=903749e2-e9a4-4592-900d-7ff3704a8fb6",
        "title": "title",
        "subTitle": "subTitle",
        "url": "https://lakay.online/public/telelabrise/index.m3u8",
        "visibility": true,
        "summary":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
    ],
  ),
];