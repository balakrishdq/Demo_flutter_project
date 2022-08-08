import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/utils/app_layout.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  String firstTab;
  String secondTab;
  Tabs({Key? key, required this.firstTab, required this.secondTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(AppLayout.getHeight(3.5)),
        child: Row(
          children: [
            //take a trip
            Container(
              width: size.width * .44,
              padding: EdgeInsets.all(AppLayout.getHeight(7)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(
                    AppLayout.getHeight(50),
                  ),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  firstTab,
                  style: Styles.headLineStyle4,
                ),
              ),
            ),
            //tour spots
            Container(
              width: size.width * .44,
              padding: EdgeInsets.all(AppLayout.getHeight(7)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(
                    AppLayout.getHeight(50),
                  ),
                ),
                color: Colors.transparent,
              ),
              child: Center(
                  child: Text(
                secondTab,
                style: Styles.headLineStyle4,
              )),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppLayout.getHeight(50),
          ),
          color: const Color(0xFFF4F6FD),
        ),
      ),
    );
  }
}
