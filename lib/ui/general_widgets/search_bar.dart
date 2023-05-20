// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:nav_app_4_host/ui/general_widgets/custom_widgets/custom_container.dart';

import 'custom_widgets/custom_text_form_field.dart';

class SearchBar extends StatelessWidget {
  final ValueNotifier<String> query;
  const SearchBar({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      userRegulatBorder: true,
      showBorder: true,
      raduis: 5,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: CustomTextFormField(
        showBorder: false,
        contentController: TextEditingController(),
        typeInput: TextInputType.text,
        onChanged: (text) {
          query.value = text;
          query.notifyListeners();
        },
      ),
    );
  }
}
