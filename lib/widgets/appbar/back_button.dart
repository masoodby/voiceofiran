import '../../utils/basic_widget_imports.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        height: 40.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: Dimensions.iconSizeDefault * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
