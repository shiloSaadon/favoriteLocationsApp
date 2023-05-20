// ignore_for_file: must_be_immutable
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nav_app_4_host/providers/theme_provider.dart';
import 'package:nav_app_4_host/ui/themes/dark_theame.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function? onTap;
  final double? opacity;
  final BoxShape? shape;
  final double raduis;
  final Color? color;
  final bool showBorder;
  final double? borderWidth;
  final Alignment? alignment;
  final BorderRadiusGeometry? geometryRadius;
  final bool userRegulatBorder;
  final BoxBorder? boxBorder;
  final BoxConstraints? constraints;
  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.borderWidth,
    this.showBorder = true,
    this.userRegulatBorder = false,
    this.child,
    this.padding,
    this.margin,
    this.shape,
    this.opacity,
    this.raduis = 20,
    this.onTap,
    this.boxBorder,
    this.color,
    this.alignment,
    this.constraints,
    this.geometryRadius,
  });

  @override
  Widget build(BuildContext context) {
    return onTap != null
        ? BouncingWidget(
            onPressed: () => onTap!(),
            scaleFactor: 0.4,
            duration: const Duration(milliseconds: 100),
            child: container(context))
        : container(context);
  }

  Widget container(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 1,
      child: Container(
          alignment: alignment,
          height: height,
          width: width,
          padding: padding,
          margin: margin,
          constraints: constraints,
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.surface,
            shape: shape ?? BoxShape.rectangle,
            border: showBorder ? gradientBorder() : null,
            borderRadius: shape == BoxShape.circle
                ? null
                : geometryRadius ?? BorderRadius.all(Radius.circular(raduis)),
          ),
          child: child),
    );
  }

  BoxBorder gradientBorder() {
    return userRegulatBorder
        ? Border.all(
            width: 1,
            color: ThemeProvider().currentTheme == darkTheme
                ? Colors.white
                : Colors.black)
        : GradientBoxBorder(
            gradient: LinearGradient(
                colors: ThemeProvider().currentTheme == darkTheme
                    ? [
                        const Color(0xffFFFFFF).withOpacity(0.15),
                        const Color(0x00000000).withOpacity(0.1)
                      ]
                    : [
                        const Color(0x00000000).withOpacity(0.1),
                        const Color(0xffFFFFFF).withOpacity(0.15),
                      ]));
  }
}
