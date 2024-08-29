import 'package:demo_multiple_date_picker/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() => logic.selectedDates.isEmpty
                  ? const Text(
                      "No date selected",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  : Wrap(
                      spacing: 8,
                      runSpacing: 5,
                      children: logic.selectedDates
                          .map(
                            (date) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3.5),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                border: Border.all(color: Colors.blue.shade700),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                DateFormat("dd MMM yyyy").format(date),
                              ),
                            ),
                          )
                          .toList(),
                    )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: logic.pickDates,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Select Dates"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
