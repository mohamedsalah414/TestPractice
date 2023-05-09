import 'package:flutter/material.dart';
import 'package:testpractice/core/services/shared_preferences.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';
import 'package:testpractice/presentation/home/screens/home_navigator_screen.dart';

import '../widgets/column_profile_widget.dart';

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
          buildIconButton(context)
        ],
      ),
      body: const ColumnProfile(),
    );
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
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
            ));
  }
}


