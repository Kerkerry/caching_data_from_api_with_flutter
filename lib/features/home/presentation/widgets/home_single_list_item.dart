import 'package:flutter/material.dart';
import 'package:offlineapp/core/utils/custom_image_viewer.dart';
import 'package:offlineapp/features/home/data/model/product_model.dart';
import 'package:intl/intl.dart';

class HomeSingleListItme extends StatelessWidget {
  const HomeSingleListItme(
      {super.key, required this.current});
  final ProductModel current;

  @override
  Widget build(BuildContext context) {
    final createdAt = formatDateString(current.createdAt.toString());
    final updatedAt = formatDateString(current.updatedAt.toString());
    Size size;
    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: height * .01, vertical: height * .007),
      height: height * .2,
      decoration: BoxDecoration(
          color: themeData.dialogBackgroundColor,
          borderRadius: BorderRadius.circular(height * .02)),
      child: Material(
        color: themeData.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(height * .02),
        elevation: 1,
        child: Row(
          children: [
            Container(
              width: width * .42,
              color: themeData.dialogBackgroundColor,
              child: CustomImageViewer.show(
                  context: context, url: current.photoUrl),
            ),
            SizedBox(
              width: width * .02,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      current.name,
                      style: themeData.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      current.description,
                      style: themeData.textTheme.labelLarge
                          ?.copyWith(color: themeData.unselectedWidgetColor),
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * .03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Created ",
                            style: themeData.textTheme.labelMedium,
                          ),
                          Text(
                            createdAt,
                            style: themeData.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                     const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * .03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Last updated ",
                            style: themeData.textTheme.labelMedium,
                          ),
                          Text(
                            updatedAt,
                            style: themeData.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: themeData.primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Text(
                            current.category.toUpperCase(),
                            style: themeData.textTheme.labelLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      Text(
                        current.price.toString(),
                        style: themeData.textTheme.labelLarge,
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

String formatDateString(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formatedDateString = DateFormat('MMM d, y').format(dateTime);
  return formatedDateString;
}
