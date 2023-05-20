// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nav_app_4_host/ui/pages/home_page/widgets/add_favotir_sheet.dart'
    deferred as add_favorit;

import 'general_widgets/custom_widgets/toast.dart';
import 'general_widgets/loading/load_library_dialog.dart';
import 'general_widgets/sheets/bottom_sheet.dart';

/// Open the favoirt locations sheet
Future<dynamic> opedAddFavoritSheet({
  required BuildContext context,
}) async {
  bool? loadLiabraryResp = await loadLiabraryDialog(
      context: context, future: add_favorit.loadLibrary());
  if (loadLiabraryResp != true) {
    CustomToast(context: context, msg: "error accured").init();
    return;
  }

  await SlidingBottomSheet(
          context: context, sheet: add_favorit.AddFavoritSheet())
      .showSheet();
}
