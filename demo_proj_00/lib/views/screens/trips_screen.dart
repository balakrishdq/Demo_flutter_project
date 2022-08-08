import 'package:barcode_widget/barcode_widget.dart';
import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/utils/app_layout.dart';
import 'package:demo_proj_00/utils/app_list_info.dart';
import 'package:demo_proj_00/views/screens/trip_details.dart';
import 'package:demo_proj_00/widgets/column_layout.dart';
import 'package:demo_proj_00/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(20),
              vertical: AppLayout.getHeight(20),
            ),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text(
                'Your Trips',
                style: Styles.headLineStyle1,
              ),
              Gap(AppLayout.getHeight(20)),
              Tabs(firstTab: 'Upcoming', secondTab: 'Previous'),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TripDetails(
                  trip: tripList[0],
                  isColor: true,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(15),
                  vertical: AppLayout.getHeight(20),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(15),
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnLayout(
                          firstText: 'Xiomi',
                          secondText: 'Passenger',
                          alignment: CrossAxisAlignment.start,
                          isColor: false,
                        ),
                        ColumnLayout(
                          firstText: '877898',
                          secondText: 'id num',
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(40)),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnLayout(
                          firstText: '6467 5847',
                          secondText: 'Number of E-tickets',
                          alignment: CrossAxisAlignment.start,
                          isColor: false,
                        ),
                        ColumnLayout(
                          firstText: '785478',
                          secondText: 'Booking code',
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/visa.png",
                                  scale: 13,
                                ),
                                Text(
                                  " *** 2462",
                                  style: Styles.headLineStyle3,
                                )
                              ],
                            ),
                            Gap(AppLayout.getHeight(5)),
                            Text(
                              'Payment Method',
                              style: Styles.headLineStyle4,
                            ),
                          ],
                        ),
                        ColumnLayout(
                          firstText: '5000.00',
                          secondText: 'Price',
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //barcode
              SizedBox(height: 1),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(AppLayout.getHeight(21)),
                      bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                    )),
                margin: EdgeInsets.only(
                    left: AppLayout.getHeight(15),
                    right: AppLayout.getHeight(15)),
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(15)),
                    child: BarcodeWidget(
                      data: 'https://github.com/balakrishdq',
                      barcode: Barcode.code128(),
                      drawText: false,
                      color: Styles.textColor,
                      width: double.infinity,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TripDetails(
                  trip: tripList[0],
                ),
              ),
            ],
          ),
          Positioned(
            left: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(AppLayout.getHeight(5)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
          Positioned(
            right: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(AppLayout.getHeight(5)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
