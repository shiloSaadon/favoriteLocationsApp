import 'package:flutter/material.dart';
import 'package:nav_app_4_host/ui/general_widgets/custom_widgets/custom_container.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../app_sizes.dart';

class SlidingBottomSheet {
  final BuildContext context;
  final Widget sheet;
  final double size;
  final bool isDismissable;
  final bool useDismissDialog;
  final String? dismissDialogContent;
  final dynamic Function()? onDismissPrevented; //
  final Color? topSeetColor;

  const SlidingBottomSheet(
      {required this.context,
      required this.sheet,
      this.size = 1,
      this.isDismissable = true,
      this.useDismissDialog = true,
      this.dismissDialogContent,
      this.onDismissPrevented,
      this.topSeetColor});

  Future showSheet() {
    //  ScreenHelper().sheetController = controller;
    return showSlidingBottomSheet(
      context,
      builder: (conntext) => SlidingSheetDialog(
          isDismissable: isDismissable,
          onDismissPrevented: (backButton, backDrop) {},
          headerBuilder: (context, state) {
            return Container(
              width: Sizes.screenWidth(context),
              color: topSeetColor ?? Theme.of(context).colorScheme.surface,
              child: CustomContainer(
                  margin: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: Sizes.screenWidth(context) * 0.4),
                  height: 5,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.3)),
            );
          },
          color: Theme.of(context).colorScheme.surface,
          snapSpec: SnapSpec(snappings: [size]),
          builder: buildSheet,
          cornerRadiusOnFullscreen: 0,
          duration: const Duration(milliseconds: 500),
          cornerRadius: 20),
    );
  }

  Widget buildSheet(_, __) {
    return Material(child: sheet);
  }
}
