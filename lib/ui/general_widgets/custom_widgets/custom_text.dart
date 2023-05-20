import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final double opacity;
  final double size;
  final bool ltrDirection;
  final bool rtlDirection;
  final bool onSecondary;
  final String text;
  final TextOverflow? overflow;
  final Color? color;
  final TextAlign? align;
  final bool applayToolTip;
  final String tooltipMessage;
  const CustomText(this.text,
      {super.key,
      this.opacity = 1,
      this.overflow,
      this.ltrDirection = false,
      this.rtlDirection = false,
      this.applayToolTip = false,
      this.tooltipMessage = '',
      this.size = 19,
      this.color,
      this.align,
      this.onSecondary = false});

  @override
  Widget build(BuildContext context) {
    return applayToolTip
        ? toolTipWrapper(context, customTextWidget(context))
        : customTextWidget(context);
  }

  Widget toolTipWrapper(BuildContext context, Widget child) {
    return Tooltip(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      message: tooltipMessage,
      textStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      child: child,
    );
  }

  Widget customTextWidget(BuildContext context) {
    return Opacity(
        opacity: opacity,
        child: Text(text,
            overflow: overflow,
            textAlign: align,
            textDirection: rtlDirection
                ? TextDirection.rtl
                : ltrDirection
                    ? TextDirection.ltr
                    : null,
            style: textStyle(context)));
  }

  TextStyle textStyle(BuildContext context) => TextStyle(
      fontSize: size,
      overflow: overflow,
      color: color ??
          (onSecondary
              ? Theme.of(context).colorScheme.onSecondary
              : Theme.of(context).colorScheme.onBackground));
}
