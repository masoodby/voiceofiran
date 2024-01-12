import '../../utils/basic_screen_imports.dart';

class ShowDialogWidget{


   static showBillingErrorDialog({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Required'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}