import 'package:flutter/material.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/app_strings.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';
import 'package:testpractice/data/model/provider_model.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({
    super.key,
    required this.vertical,
  });

  final List<Data> vertical;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: vertical.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
              ),
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 8.0),
                    child: Image.network(
                      '${AppStrings.baseUrl}${vertical[index].imagePath}',
                      loadingBuilder: (context, child,
                          loadingProgress) {
                        if (loadingProgress == null)
                          return child;
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.blue,
                          ),
                        );
                      },
                      // height: 100,
                      fit: BoxFit.contain,
                      scale: 1.2,
                    ),
                  ),
                  25.pw,
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        txt:
                        '${vertical[index].cashback.percentage}% Cashback',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: AppColor.pink,
                      ),
                      TextWidget(
                        txt: vertical[index].note,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      TextWidget(
                        txt: vertical[index].businessName,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: AppColor.yellow,
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
