// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHaft;
  late String secondtHaft;

  bool hiddentText = true;

  double textHeight = Dimension.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHaft = widget.text.substring(0, textHeight.toInt());
      secondtHaft =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHaft = widget.text;
      secondtHaft = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondtHaft.isEmpty
          ? SmallText(
              text: firstHaft,
              size: Dimension.font16,
              color: AppColors.paraColor,
              height: 1.8,
            )
          : Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  size: Dimension.font16,
                  color: AppColors.paraColor,
                  height: 1.8,
                  text: hiddentText
                      ? (firstHaft + "...")
                      : (firstHaft + secondtHaft),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddentText = !hiddentText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Xem thêm",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddentText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
