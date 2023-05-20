import 'package:flutter/material.dart';

import '../../../general_widgets/custom_widgets/custom_text_form_field.dart';
import '../../../general_widgets/dialogs/general_dialog.dart';

/// Show dialog with name text field, validate the name.
/// Return: validName -> name. else: null
Future<dynamic> getLocationNameDialog(BuildContext context) async {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  dynamic name = await generalDialog(
    context: context,
    title: "Add location name",
    content: Form(
      key: formKey,
      child: CustomTextFormField(
          isValid: (text) {
            if (text != null && text.length < 2) {
              return "To Short Name";
            }
            return null;
          },
          contentController: controller,
          typeInput: TextInputType.text),
    ),
    submitText: "Save",
    cancelText: "Cancel",
    onCancel: () => Navigator.pop(context),
    onSubmit: () {
      // validate the form
      if (formKey.currentState == null || !formKey.currentState!.validate()) {
        return;
      }
      // poping the dialog with the name
      Navigator.pop(context, controller.text);
    },
  );
  return (name is String) ? name : null;
}
