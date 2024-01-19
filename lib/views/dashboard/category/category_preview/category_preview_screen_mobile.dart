import '../../../../controller/navigation/category/category_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/others/category_details_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CategoryPreviewScreenMobile extends StatelessWidget {
  final controller = Get.put(CategoryController());
  
  CategoryPreviewScreenMobile({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;
  
  @override
  Widget build(BuildContext context) {
    // print("screen $data");
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
          text: data["data"]["program"]["title"].toString(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
           topWidget(context),
           _bodyWidget(context),
          ],
        ),
      ),
    );
  }
  Widget topWidget(BuildContext context) {
    final programImageUrl = data["data"]['program']["image"].toString();
    final programTitle = data["data"]['program']["title"].toString();
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .1),
          child: CachedNetworkImage(
            imageUrl: programImageUrl,
            maxHeightDiskCache: 200 * 9,
            maxWidthDiskCache: 200 * 9,
            // maxHeightDiskCache: 200 * snapshot.data!.docs.length,
            // maxWidthDiskCache: 200 * snapshot.data!.docs.length,
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width ,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              // Choose your shimmer base color
              highlightColor: Colors.grey[100]!,
              // Choose your shimmer highlight color
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white, // You can change this color as needed
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 21, 20, 20).withOpacity(0.5)),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .8),
            child: TitleHeading2Widget(
              text: programTitle,
              textOverflow: TextOverflow.fade,
              maxLines: 2,
              fontSize: 14,
              color: CustomColor.whiteColor,
            ),
          ),
        ),
      ],
    );
  }

//data["data"][index]["banner"]
  _bodyWidget(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: data["data"]["episodes"].length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        String streamUrl = data["data"]['episodes'][index]["url"];
        String imagePath = data["data"]['episodes'][index]["image"];
        String title = data["data"]['episodes'][index]["title"];
        String subTitle = "";
        String summary = data["data"]['episodes'][index]["summary"];
        return data.isNotEmpty
            ? InkWell(
                onTap: () {
                  controller.goToDetailsScreen(
                      streamUrl, imagePath, title, subTitle, summary, data);
                },
                child: CategoryDetailsWidget(
                  imagePath: imagePath,
                  title: title,
                  subTitle: "",
                  itemCount: data["data"]["episodes"].length,
                ),
              )
            : const SizedBox();
      },
    );
  }
}
