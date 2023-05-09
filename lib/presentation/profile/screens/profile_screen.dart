import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:testpractice/core/services/shared_preferences.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';
import 'package:testpractice/presentation/home/screens/home_navigator_screen.dart';
import 'package:testpractice/presentation/home/screens/home_screen.dart';
import 'package:testpractice/presentation/logIn/screens/logIn_screen.dart';
import 'package:testpractice/presentation/profile/widgets/profile_row_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const TextWidget(
          txt: 'Profile',
          color: AppColor.white,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(5, 0, 0, 0),
                    items: [
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {
                            context.pushAndRemoveUntil(const HomeNavigatorScreen());
                            SharedPreferencesService.getInstance().then((value) {
                              value.remove('token');
                            });
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.exit_to_app),
                              TextWidget(txt: 'Log out'),
                            ],
                          ),
                        ),
                      )
                    ]);
              },
              icon: const Icon(
                Icons.settings,
                color: AppColor.white,
              ))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipPath(
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
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextWidget(
              txt: 'Your activities',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const ProfileRowWidget(
            title: 'Your activity',
            icon: Icons.analytics_outlined,
            subTitle: 'Tracked and confirmed cashback',
          ),
          const ProfileRowWidget(
            title: 'Claims',
            icon: CupertinoIcons.flag,
            subTitle: 'Check the status of your claims',
          ),
          const ProfileRowWidget(
            title: 'Boosts',
            icon: CupertinoIcons.rocket_fill,
            color: Colors.pink,
            subTitle: 'All of your boosts',
          ),
          const ProfileRowWidget(
            title: 'Bonus cashback',
            icon: Icons.monetization_on,
            subTitle: 'All of your Cash Smart Bonuses',
          ),
        ],
      ),
    );
  }
}
