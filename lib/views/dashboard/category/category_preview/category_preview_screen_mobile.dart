import '../../../../controller/navigation/category/category_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/others/category_details_widget.dart';

class CategoryPreviewScreenMobile extends StatelessWidget {
  final controller = Get.put(CategoryController());

  CategoryPreviewScreenMobile({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title: TitleHeading3Widget(
          text: data["data"]["name"].toString(),
        ),
      ),
      body: _bodyWidget(context),
    );
  }

//data["data"][index]["banner"]
  _bodyWidget(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: data["data"]["data"].length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        String streamUrl = data["data"]["data"][index]["url"];
        String imagePath = data["data"]["data"][index]["banner"];
        String title = data["data"]["data"][index]["title"];
        String subTitle = data["data"]["data"][index]["subTitle"];
        String summary = data["data"]["data"][index]["summary"];
        return data.isNotEmpty
            ? InkWell(
                onTap: () {
                  controller.goToDetailsScreen(
                      streamUrl, imagePath, title, subTitle, summary,data["data"]["data"]);
                },
                child: CategoryDetailsWidget(
                  imagePath: imagePath,
                  title: title,
                  subTitle: subTitle,
                 // itemCount: data["data"]["data"].length,
                ),
              )
            : const SizedBox();
      },
    );
  }
}