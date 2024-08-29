import 'package:get/get.dart';

class MultiDateSelectDialogController extends GetxController {
  RxList<DateTime> selectedDates = <DateTime>[].obs;
  DateTime? lastTappedDate;

  @override
  void onInit() {
    super.onInit();
    selectedDates = Get.arguments['selectedDates'];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (selectedDates.contains(selectedDay)) {
      selectedDates.remove(selectedDay);
    } else {
      selectedDates.add(selectedDay);
    }
    lastTappedDate = selectedDay;
    update();
  }

  void onCancelPress() {
    Get.back();
  }

  void onDonePress() {
    selectedDates.sort();
    Get.back();
  }
}
