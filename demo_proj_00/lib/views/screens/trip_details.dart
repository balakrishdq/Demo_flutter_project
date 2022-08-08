import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/utils/app_layout.dart';
import 'package:demo_proj_00/widgets/column_layout.dart';
import 'package:demo_proj_00/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';

class TripDetails extends StatelessWidget {
  final Map<String, dynamic> trip;
  final bool? isColor;
  const TripDetails({Key? key, required this.trip, this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 167 : 169),
      child: Container(
        margin: EdgeInsets.only(
          right: AppLayout.getHeight(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*For Blue Part */
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? Color(0xFFa859b3) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(21)),
                  topRight: Radius.circular(AppLayout.getHeight(21)),
                ),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        trip['from']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      ),
                      Expanded(child: Container()),
                      ThickContainer(
                        isColor: true,
                      ),
                      Expanded(
                          child: Stack(children: [
                        SizedBox(
                          height: AppLayout.getHeight(24),
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              print(
                                  "The width is ${constraints.constrainWidth()}");
                              return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                  ((constraints.constrainWidth() / 6).floor()),
                                  (index) => SizedBox(
                                    width: 3,
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: isColor == null
                                            ? Colors.white
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Center(
                          child: Icon(
                            Icons.local_taxi,
                            color: isColor == null
                                ? Colors.white
                                : Color(0xFF8ACCF7),
                          ),
                        ),
                      ])),
                      ThickContainer(
                        isColor: true,
                      ),
                      Expanded(child: Container()),
                      Text(
                        trip['to']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          trip['from']['name'],
                          style: isColor == null
                              ? Styles.headLineStyle4.copyWith(
                                  color: Colors.white,
                                )
                              : Styles.headLineStyle4,
                        ),
                      ),
                      Text(
                        trip['traveling_time'],
                        style: isColor == null
                            ? Styles.headLineStyle4.copyWith(
                                color: Colors.white,
                              )
                            : Styles.headLineStyle4,
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          trip['to']['name'],
                          style: isColor == null
                              ? Styles.headLineStyle4.copyWith(
                                  color: Colors.white,
                                )
                              : Styles.headLineStyle4,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // for center line
            Container(
              color: isColor == null ? Color(0xFF8f3b78) : Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor == null
                            ? Colors.grey.shade200
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(AppLayout.getHeight(12.0)),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        direction: Axis.horizontal,
                        children: List.generate(
                          (constraints.constrainWidth() / 15).floor(),
                          (index) => SizedBox(
                            width: 5,
                            height: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: isColor == null
                                    ? Colors.grey.shade200
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppLayout.getHeight(10)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //for bottom part
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                      isColor == null ? AppLayout.getHeight(21) : 0),
                  bottomRight: Radius.circular(
                      isColor == null ? AppLayout.getHeight(21) : 0),
                ),
              ),
              padding: EdgeInsets.only(
                  top: AppLayout.getHeight(10),
                  left: AppLayout.getHeight(16),
                  right: AppLayout.getHeight(16),
                  bottom: AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ColumnLayout(
                        firstText: trip['date'],
                        secondText: 'Date',
                        alignment: CrossAxisAlignment.start,
                        isColor: isColor,
                      ),
                      ColumnLayout(
                        firstText: trip['boarding_time'],
                        secondText: 'Boarding Time',
                        alignment: CrossAxisAlignment.center,
                        isColor: isColor,
                      ),
                      ColumnLayout(
                        firstText: trip['kms'].toString(),
                        secondText: 'Kms',
                        alignment: CrossAxisAlignment.end,
                        isColor: isColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
