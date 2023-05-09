import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';


class ClipPathProfile extends StatelessWidget {
  const ClipPathProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ProsteBezierCurve(
        position: ClipPosition.bottom,
        list: [
          BezierCurveSection(
            start: const Offset(0, 250),
            top: Offset(context.width / 2, 270),
            end: Offset(context.width, 250),
          ),
        ],
      ),
      child: Container(
        height: 280,
        color: AppColor.blue,
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColor.white,
              child: CircleAvatar(
                radius: 38,
                backgroundColor: AppColor.blue,
                child: TextWidget(
                  txt: 'CS',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                ),
              ),
            ),
            10.ph,
            const TextWidget(
              txt: '£2.06',
              fontWeight: FontWeight.bold,
              color: AppColor.white,
              fontSize: 40,
            ),
            const TextWidget(
              txt: 'Account Balance',
              fontSize: 16,
              color: AppColor.white,
            ),
            10.ph,
            SizedBox(
              width: context.width * .8,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: AppColor.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const TextWidget(
                    txt: 'Withdraw Balance',
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
