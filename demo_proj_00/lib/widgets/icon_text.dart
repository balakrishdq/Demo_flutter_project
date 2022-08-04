import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/utils/app_layout.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppLayout.getWidth(12),
        vertical: AppLayout.getHeight(12),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            AppLayout.getWidth(10),
          )),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xFFBFC2DF),
          ),
          Gap(AppLayout.getWidth(10)),
          Text(
            text,
            style: Styles.textStyle,
          )
        ],
      ),
    );
  }
}
