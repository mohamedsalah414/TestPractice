import 'package:flutter/material.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/app_strings.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';
import 'package:testpractice/data/model/provider_model.dart';


class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({
    super.key,
    required this.horizontal,
  });

  final List<Data> horizontal;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: horizontal.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: context.width * .85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.blue,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: 2,
                    color: Colors.black12)
              ],
              image: DecorationImage(
                image: NetworkImage(
                    '${AppStrings.baseUrl}${horizontal[index].backgroundImagePath}'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(5),
                    color: AppColor.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.all(8.0),
                        child: Image.network(
                          '${AppStrings.baseUrl}${horizontal[index].imagePath}',
                          loadingBuilder: (context, child,
                              loadingProgress) {
                            if (loadingProgress == null)
                              return child;
                            return const Center(
                              child:
                              CircularProgressIndicator(
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
                            txt: horizontal[index]
                                .businessName,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          TextWidget(
                            txt:
                            '${horizontal[index].cashback.percentage}% Cashback',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: AppColor.pink,
                          ),
                          TextWidget(
                            txt: horizontal[index].note,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
