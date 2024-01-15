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
          text: data["data"]["title"].toString(),
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
      itemCount: 1,
      physics: const BouncingScrollPhysics(),
      
      itemBuilder: (BuildContext context, int index) {
        String streamUrl = data["data"]["url"];
        String imagePath = data["data"]["image"];
        String title = data["data"]["title"];
        String subTitle = "";
        String summary = data["data"]["summary"];
        return data.isNotEmpty
            ? InkWell(
                onTap: () {
                  controller.goToDetailsScreen(
                      streamUrl, imagePath, title, subTitle, summary,data);
                },
                child: CategoryDetailsWidget(
                  imagePath: imagePath,
                  title: title,
                  subTitle: subTitle,
                 itemCount: data["data"].length,
                ),
              )
            : const SizedBox();
      },
    );
  }
}