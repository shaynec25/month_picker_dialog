import 'package:flutter/material.dart';
import '/src/helpers/controller.dart';
import '/src/helpers/locale_utils.dart';

import 'month_button.dart';

class MonthYearGridBuilder extends StatelessWidget {
  const MonthYearGridBuilder({
    super.key,
    required this.onMonthSelected,
    required this.controller,
    required this.page,
    this.localeString,
  });
  final ValueChanged<DateTime> onMonthSelected;
  final MonthpickerController controller;
  final int page;
  final String? localeString;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 2,
        // mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        crossAxisCount: 3,
        children: List<Widget>.generate(
          12,
          (final int index) => MonthButton(
            theme: controller.theme,
            date: DateTime(
                controller.localFirstDate != null
                    ? controller.localFirstDate!.year + page
                    : page,
                index + 1),
            localeString: localeString ??
                getLocale(context, selectedLocale: controller.locale),
            onMonthSelected: onMonthSelected,
            controller: controller,
          ),
        ).toList(growable: false),
      ),
    );
  }
}
