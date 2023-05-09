import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';
import 'package:testpractice/presentation/logIn/screens/logIn_screen.dart';


class ClipPathHome extends StatelessWidget {
  const ClipPathHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ProsteBezierCurve(
        position: ClipPosition.bottom,
        list: [
          BezierCurveSection(
            start: const Offset(0, 75),
            top: Offset(context.width / 2, 100),
            end: Offset(context.width, 75),
          ),
        ],
      ),
      child: Container(
        height: 125,
        color: AppColor.blue,
        child: Column(
          children: [
            10.ph,
            SizedBox(
              width: context.width * .8,
              child: ElevatedButton(
                  onPressed: () {
                    context.pushAndRemoveUntil(
                      const LogInScreen(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: AppColor.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const TextWidget(
                    txt: 'Sign in',
                    color: AppColor.blue,
                    fontSize: 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
