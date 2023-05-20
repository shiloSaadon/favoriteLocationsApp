import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/genral_utils.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final BuildContext? context;
  final TextEditingController contentController;
  final TextInputType typeInput;
  final Function(String text)? onChanged;
  final String? text;
  final String? Function(String?)? isValid;
  final double? width;
  final Widget? prefix;
  final bool showBorder;
  final double? hight;
  final String? labelText;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final String? initialValue;
  final int? maxLength;
  final bool showSuffix;
  final Widget? suffix;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextStyle? lableStyle;
  final bool showFocusedBorder;
  final bool showDeleteIcon;
  final Function(String?)? onSaved;
  const CustomTextFormField(
      {super.key,
      this.context,
      required this.contentController,
      required this.typeInput,
      this.showDeleteIcon = true,
      this.lableStyle,
      this.showFocusedBorder = true,
      this.contentPadding,
      this.onChanged,
      this.prefix,
      this.suffix,
      this.showBorder = true,
      this.textStyle,
      this.textAlign,
      this.showSuffix = true,
      this.isValid,
      this.width,
      this.hight,
      this.labelText,
      this.hintText,
      this.initialValue,
      this.maxLength,
      this.maxLines,
      this.text,
      this.onSaved});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isTapped = false;

  String? validationText = '';
  bool hasValidation = false;
  @override
  Widget build(BuildContext context) {
    if (widget.isValid != null) {
      hasValidation = true;
    }

    return customTextFormField();
  }

  Widget customTextFormField() {
    return TextFormField(
        keyboardAppearance: Theme.of(context).brightness,
        cursorColor: Theme.of(context).colorScheme.secondary,
        initialValue: widget.initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: widget.maxLength,
        validator: widget.isValid,
        textAlign: widget.textAlign ?? TextAlign.start,
        style: widget.textStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        maxLines: widget.maxLines,
        controller: widget.contentController,
        keyboardType: widget.typeInput,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        onEditingComplete: () {
          overLaysHandling();
          dismissKeyboard(context);
        },
        decoration: InputDecoration(
            prefixIcon: widget.prefix != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: widget.prefix,
                  )
                : null,
            prefixIconColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            prefixIconConstraints: const BoxConstraints(maxHeight: 30),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.only(right: 0, bottom: 8),
            isDense: true,
            suffixIcon: widget.showSuffix
                ? BouncingWidget(
                    onPressed: () {
                      if (widget.suffix != null) {
                        return;
                      }
                      setState(() {
                        if (widget.onChanged != null) {
                          widget.onChanged!("");
                        }
                        widget.contentController.text = "";
                      });
                    },
                    child: widget.suffix ?? const Icon(Icons.clear, size: 22))
                : null,
            suffixIconConstraints:
                BoxConstraints.loose(const Size.fromRadius(10)),
            suffixIconColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
            iconColor: Theme.of(context).colorScheme.secondary,
            labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: (widget.textStyle ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16))
                .copyWith(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.6)),
            errorBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.red, width: 2)),
            focusedErrorBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.red, width: 2)),
            focusedBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                    style: widget.showFocusedBorder ? BorderStyle.solid : BorderStyle.none)),
            disabledBorder: UnderlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground, style: widget.showBorder ? BorderStyle.solid : BorderStyle.none, width: 2)),
            enabledBorder: UnderlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground, style: widget.showBorder ? BorderStyle.solid : BorderStyle.none, width: 2)),
            border: UnderlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground, width: 2)),
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),
            labelStyle: TextStyle(fontStyle: FontStyle.italic, color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5))));
  }
}
