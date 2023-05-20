import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import '../../../utils/genral_utils.dart';
import '../custom_widgets/dialogs_content.dart';
import '../custom_widgets/dialogs_title.dart';

Future<dynamic> generalDialog(
    {required BuildContext context,
    Widget? content,
    Axis direction = Axis.vertical,
    String? cancelText,
    Function()? onCancel,
    String? submitText,
    Function()? onSubmit,
    double backgroundOpacity = 1,
    String? title,
    bool removeBackground = false,
    bool dismissible = true,
    DialogTransitionType animationType = DialogTransitionType.slideFromTop,
    Cubic curve = Curves.fastOutSlowIn,
    Duration duration = const Duration(milliseconds: 200)}) {
  // dismiss keyboard
  dismissKeyboard(context);
  return showAnimatedDialog<dynamic>(
    barrierDismissible: dismissible,
    context: context,
    builder: (BuildContext context) => GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: AlertDialog(
        //elevation: 0,
        shadowColor:
            removeBackground ? Colors.transparent.withOpacity(0) : null,
        backgroundColor: Theme.of(context)
            .dialogBackgroundColor
            .withOpacity(removeBackground ? 0 : backgroundOpacity),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: title != null ? DialogTitle(title: title) : null,
        content: GeneralDialogContent(
            content: content,
            cancelText: cancelText,
            onCancel: onCancel,
            submitText: submitText,
            onSubmit: onSubmit),
      ),
    ),
    animationType: animationType,
    curve: curve,
    duration: duration,
  ).whenComplete(() => overLaysHandling());
}
