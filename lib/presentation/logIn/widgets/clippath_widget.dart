import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/app_strings.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';

class BuildClipPath extends StatelessWidget {
  const BuildClipPath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ProsteBezierCurve(
        position: ClipPosition.bottom,
        list: [
          BezierCurveSection(
            start: const Offset(0, 150),
            top: Offset(context.width / 2, 200),
            end: Offset(context.width, 150),
          ),
        ],
      ),
      child: Container(
        height: context.height / 4,
        color: AppColor.blue,
        child: const Center(
          child: TextWidget(
            txt: AppStrings.signInTitle,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
