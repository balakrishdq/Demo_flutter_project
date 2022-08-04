import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/utils/app_layout.dart';
import 'package:demo_proj_00/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TripDetails extends StatelessWidget {
  final Map<String, dynamic> trip;
  const TripDetails({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only(
          right: AppLayout.getHeight(16),
        ),
        child: Column(
          children: [
            /*For Blue Part */
            Container(
              decoration: BoxDecoration(
                color: const Color(
                  0xFFa859b3,
                ),
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
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      ThickContainer(),
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
                                        color: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                      ])),
                      ThickContainer(),
                      Expanded(child: Container()),
                      Text(
                        trip['to']['code'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
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
                          style: Styles.headLineStyle4.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        trip['traveling_time'],
                        style: Styles.headLineStyle4.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          trip['to']['name'],
                          style: Styles.headLineStyle4.copyWith(
                            color: Colors.white,
                          ),
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
              color: const Color(0xFF8f3b78),
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                                color: Colors.white,
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
                color: Styles.orangeColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                  bottomRight: Radius.circular(AppLayout.getHeight(21)),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trip['date'],
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          Gap(AppLayout.getHeight(5)),
                          Text(
                            'Date',
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            trip['boarding_time'],
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          Gap(AppLayout.getHeight(5)),
                          Text(
                            'Boarding Time',
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            trip['kms'].toString(),
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          Gap(AppLayout.getHeight(5)),
                          Text(
                            'Kms',
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          )
                        ],
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
