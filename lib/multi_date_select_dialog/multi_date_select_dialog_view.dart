import 'package:demo_multiple_date_picker/multi_date_select_dialog/multi_date_select_dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class MultiDateSelectDialogView extends StatelessWidget {
  const MultiDateSelectDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MultiDateSelectDialogController>(
        init: Get.put(MultiDateSelectDialogController()),
        builder: (logic) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    rangeSelectionMode: RangeSelectionMode.toggledOff,
                    focusedDay: logic.lastTappedDate ?? DateTime.now(),
                    firstDay: DateTime.now().subtract(const Duration(days: 365)),
                    selectedDayPredicate: (DateTime? dateTime) {
                      return logic.selectedDates.contains(dateTime);
                    },
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade700),
                        shape: BoxShape.circle,
                      ),
                      selectedTextStyle: TextStyle(color: Colors.blue.shade700),
                    ),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    onDaySelected: logic.onDaySelected,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: logic.onCancelPress,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Cancel"),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: logic.onDonePress,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Done"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
