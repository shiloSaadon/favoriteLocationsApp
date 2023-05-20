import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../app_const/resurces.dart';
import '../custom_widgets/custom_container.dart';

class CircleLoadingAnimation extends StatefulWidget {
  final Duration? timeout;
  const CircleLoadingAnimation({super.key, this.timeout});

  @override
  State<CircleLoadingAnimation> createState() => _CircleLoadingAnimationState();
}

class _CircleLoadingAnimationState extends State<CircleLoadingAnimation> {
  bool isTimeOut = false;
  bool stateAvilable = true;
  @override
  void dispose() {
    stateAvilable = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isTimeOut && widget.timeout != null) {
      Future.delayed(widget.timeout!).then((_) {
        if (stateAvilable) {
          setState(() {
            isTimeOut = true;
          });
        }
      });
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 200,
            child: Lottie.asset(loadingAnimation, width: 150, height: 150)),
        isTimeOut
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context, false);
                },
                child: const CustomContainer(
                    width: 80,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Cancel')),
              )
            : const SizedBox(),
      ],
    );
  }
}
