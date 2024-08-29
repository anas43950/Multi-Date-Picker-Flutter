import 'package:demo_multiple_date_picker/multi_date_select_dialog/multi_date_select_dialog_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedDates = <DateTime>[].obs;

  void pickDates() async {
    Get.dialog(
      const MultiDateSelectDialogView(),
      arguments: {'selectedDates': selectedDates},
      barrierDismissible: false,
    );
  }
}
