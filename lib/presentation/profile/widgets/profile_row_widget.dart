import 'package:flutter/material.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';

class ProfileRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color? color;

  const ProfileRowWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all( 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color ?? AppColor.blue,
              size: 40,
            ),
            20.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  txt: title,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                TextWidget(
                  txt: subTitle,
                  color: Colors.black54,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
