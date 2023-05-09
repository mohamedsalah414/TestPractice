import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:testpractice/core/services/shared_preferences.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';
import 'package:testpractice/data/model/provider_model.dart';
import 'package:testpractice/presentation/home/view_model/home_riverpod.dart';
import 'package:testpractice/presentation/home/widgets/clippath_home_widget.dart';
import 'package:testpractice/presentation/home/widgets/list_view_horizontal_widget.dart';
import 'package:testpractice/presentation/home/widgets/list_view_vertical_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool signedIn = false;

  @override
  void initState() {
    super.initState();
    SharedPreferencesService.getInstance().then((value) {
      setState(() {
        value.getValue('token') != null ?signedIn = true : false ;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, MMM d').format(now);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const TextWidget(
          txt: 'Cash Smart',
          color: AppColor.white,
        ),
        bottom: PreferredSize(
            preferredSize: Size(context.width, context.height / 10),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    txt: formattedDate,
                    color: AppColor.white,
                    fontSize: 16,
                  ),
                  10.ph,
                  const TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.white,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search)),
                  ),
                ],
              ),
            )),
      ),
      body: ListView(
        children: [
          buildVisibility(context),
          buildHorizontalList(),
          buildVerticalList(),
        ],
      ),
    );
  }

  Consumer buildVerticalList() {
    return Consumer(
          builder: (context, ref, child) {
            AsyncValue<List<Data>> prov = ref.watch(homeScreenProviders);
            List<Data> vertical = [];
            if (prov.value != null) {
              for (int i = 0; i < prov.value!.length; i++) {
                if (prov.value![i].highlight == 0) {
                  vertical.add(prov.value![i]);
                }
              }
            }
            debugPrint('Consumer build');
            return prov.when(
              data: (data) {
                return vertical.isNotEmpty
                    ? VerticalList(vertical: vertical)
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
              error: (error, stackTrace) {
                return Center(
                  child: TextWidget(txt: '$error'),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        );
  }

  SizedBox buildHorizontalList() {
    return SizedBox(
          height: 200,
          child: Consumer(
            builder: (context, ref, child) {
              AsyncValue<List<Data>> prov = ref.watch(homeScreenProviders);
              List<Data> horizontal = [];
              if (prov.value != null) {
                for (int i = 0; i < prov.value!.length; i++) {
                  if (prov.value![i].highlight == 1) {
                    horizontal.add(prov.value![i]);
                  }
                }
              }
              debugPrint('Consumer build');
              return prov.when(
                data: (data) {
                  return horizontal.isNotEmpty
                      ? ListViewHorizontal(horizontal: horizontal)
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: TextWidget(txt: '$error'),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
        );
  }

  Visibility buildVisibility(BuildContext context) {
    return Visibility(
          visible: !(signedIn),
          child: const ClipPathHome(),
        );
  }
}



