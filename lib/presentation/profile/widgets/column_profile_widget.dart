

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testpractice/presentation/profile/widgets/profile_row_widget.dart';

import '../../../core/widgets/text_widget.dart';
import 'clippath_profile_widget.dart';

class ColumnProfile extends StatelessWidget {
  const ColumnProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        ClipPathProfile(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextWidget(
            txt: 'Your activities',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ProfileRowWidget(
          title: 'Your activity',
          icon: Icons.analytics_outlined,
          subTitle: 'Tracked and confirmed cashback',
        ),
        ProfileRowWidget(
          title: 'Claims',
          icon: CupertinoIcons.flag,
          subTitle: 'Check the status of your claims',
        ),
        ProfileRowWidget(
          title: 'Boosts',
          icon: CupertinoIcons.rocket_fill,
          color: Colors.pink,
          subTitle: 'All of your boosts',
        ),
        ProfileRowWidget(
          title: 'Bonus cashback',
          icon: Icons.monetization_on,
          subTitle: 'All of your Cash Smart Bonuses',
        ),
      ],
    );
  }
}
