import 'package:flutter/material.dart';
import '/src/helpers/controller.dart';
import '/src/helpers/locale_utils.dart';
import '/src/year_selector/year_button.dart';

class YearGrid extends StatelessWidget {
  const YearGrid({
    super.key,
    required this.page,
    required this.onYearSelected,
    required this.controller,
    this.yearLocaleString,
  });
  final int page;
  final ValueChanged<int> onYearSelected;
  final MonthpickerController controller;
  final String? yearLocaleString;

  @override
  Widget build(BuildContext context) {
    final String localeString = yearLocaleString ??
        getLocale(context, selectedLocale: controller.locale);
    return Center(
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        crossAxisCount: 3,
        children: List<Widget>.generate(
          9,
          (final int index) => YearButton(
            theme: controller.theme,
            controller: controller,
            page: page,
            index: index,
            onYearSelected: onYearSelected,
            localeString: localeString,
          ),
        ).toList(growable: false),
      ),
    );
  }
}
