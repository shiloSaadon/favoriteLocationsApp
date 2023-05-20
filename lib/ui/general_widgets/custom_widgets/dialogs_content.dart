import 'package:flutter/material.dart';
import 'package:nav_app_4_host/ui/app_sizes.dart';

import 'custom_container.dart';

class GeneralDialogContent extends StatelessWidget {
  final Widget? content;
  final String? cancelText;
  final Function()? onCancel;
  final String? submitText;
  final Function()? onSubmit;
  const GeneralDialogContent(
      {super.key,
      required this.content,
      required this.cancelText,
      required this.onCancel,
      required this.submitText,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          content ?? const SizedBox(),
          SizedBox(
            width: Sizes.screenWidth(context) * 0.5,
            child: cancelText != null || submitText != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(children: [
                      cancelText != null
                          ? Expanded(
                              child: CustomContainer(
                                  onTap: onCancel,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  raduis: 3,
                                  boxBorder: Border.all(
                                      width: 1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  alignment: Alignment.center,
                                  child: Text(
                                    cancelText!,
                                    textAlign: TextAlign.center,
                                  )),
                            )
                          : const SizedBox(),
                      submitText != null
                          ? Expanded(
                              child: CustomContainer(
                                  onTap: onSubmit,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  alignment: Alignment.center,
                                  raduis: 3,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  child: Text(
                                    submitText!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                  )),
                            )
                          : const SizedBox(),
                    ]),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
