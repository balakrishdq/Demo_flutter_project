import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:flutter/material.dart';

class DoubleText extends StatelessWidget {
  final bigText;
  final smallText;
  const DoubleText({Key? key, required this.bigText, required this.smallText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: Styles.headLineStyle2,
        ),
        InkWell(
          onTap: () {
            print('You are tapped');
          },
          child: Text(
            smallText,
            style: Styles.textStyle.copyWith(
              color: Styles.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
